import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/cubit/loginCubit/shopLoginStates.dart';
import 'package:shoppingapp/models/loginModel.dart';
import 'package:shoppingapp/network/local/cacheHelper.dart';
import 'package:shoppingapp/network/remote/dioHelper.dart';

import '../../network/endPoints.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopInitialLoginState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  IconData iconData = Icons.visibility_off_rounded;
  bool isPassword = true;

  void changePasswordVisibilty() {
    isPassword = !isPassword;
    iconData =
        isPassword ? Icons.visibility_rounded 
        : Icons.visibility_off_outlined;
    emit(ShopLoginChangePasswordVisibilty());
  }

  late LoginModel loginModel;
  void userLogin({required String email, required String password}) {
    emit(ShopLoadingLoginState());

    DioHelper.postData(
      path: LOGIN,
      data: {'email': email, 'password': password},
      
    ).then((value) {
    
    loginModel = LoginModel.fromJson(value.data);

    
      // print(value.data!);
      // print(loginModel.status);
            // print(loginModel.message);
            //       print(loginModel.data);


      emit(ShopSuccessLoginState(loginModel));
    }).catchError((error) {
      print(error);
      emit(ShopErrorLoginState(error.toString()));
    });
  }
}
