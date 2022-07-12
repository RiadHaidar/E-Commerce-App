import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/cubit/shopCubit/shopStates.dart';
import 'package:shoppingapp/models/homeModel.dart';
import 'package:shoppingapp/network/endPoints.dart';
import 'package:shoppingapp/network/remote/dioHelper.dart';

import '../../components/shared_values.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  late HomeModel homeModel;
  void getHomeData() {
    emit(ShopLoadingState());

    DioHelper.getData(
      path: HOME,
       token: userToken,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      print(homeModel.homeData.products);

      emit(ShopSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorState());
    });
  }
}
