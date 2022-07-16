import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/cubit/shopCubit/shopStates.dart';
import 'package:shoppingapp/models/addToCartModel.dart';
import 'package:shoppingapp/models/cartModel.dart';
import 'package:shoppingapp/models/categoriesModel.dart';
import 'package:shoppingapp/models/homeModel.dart';
import 'package:shoppingapp/network/endPoints.dart';
import 'package:shoppingapp/network/remote/dioHelper.dart';
import 'package:shoppingapp/screens/Moduls/cartScreen.dart';
import 'package:shoppingapp/screens/Moduls/favoriteScreen.dart';
import 'package:shoppingapp/screens/Moduls/screenSetting.dart';

import '../../components/components.dart';
import '../../components/shared_values.dart';
import '../../screens/Moduls/shopLayout.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    SettingScreen()
  ];

  List<Widget> appBars = [
    EditedAppBarTitle(),
    Text('favorite Screen'),
    EditedAppBarTitle(),
    Text('serring Screen')
  ];
  void changeScreen(int index) {
    currentIndex = index;
    emit(ShopHomeChangeScreen());
  }

  late HomeModel homeModel;

  bool loadedHomeModel = false;
  void getHomeData() {
    emit(ShopHomeLoadingState());

    DioHelper.getData(
      path: HOME,
      token: userToken,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      loadedHomeModel = true;
      print(homeModel.homeData.products);

      emit(ShopHomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopHomeErrorState());
    });
  }

  late CategoriesModel categoriesModel;
  bool loadedCategoriesModel = false;
  void getCategoriesData() {
    emit(ShopCategoriesLoadingState());

    DioHelper.getData(path: CATEGORIES).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      loadedCategoriesModel = true;
      print(categoriesModel.categoriesModelData.categoriesData[2].name);
      emit(ShopCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopHomeErrorState());
    });
  }

  late CartModel cartModel;
  bool isCartLoaded = false;

  void getCart() {
    emit(ShopCartLoadingState());

    DioHelper.getData(
      path: CART, 
    token: userToken,
    ).then((value) {

      cartModel = CartModel.fromJson(value.data);
     if(cartModel.status){
      isCartLoaded=true;
      emit(ShopCartSuccessState());
     }

    }).catchError((error) {
      print(error.toString());
      emit(ShopCartErrorState());
    });
  }




  late addToCartModel addToCart;

  void addItemToCart(dynamic productId){

    emit(ShopAddToCartLoadingState());

    DioHelper.postData(
      
      path: CART,
     data: {

     'product_id':productId
     }
     , token: userToken
     ).then((value) {

 addToCart=    addToCartModel.fromJson(value.data);
  print(addToCart.message);
if(addToCart.status){
  getCart();
}

emit(ShopAddToCartSuccessState());
    }).catchError((error){

print(error.toString());
emit(ShopAddToCartErrorState());
    });



  }
}
