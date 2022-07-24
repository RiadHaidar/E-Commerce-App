import 'package:flutter/material.dart';
import 'package:shoppingapp/main.dart' ;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/components/components.dart';
import 'package:shoppingapp/cubit/shopCubit/shopStates.dart';
import 'package:shoppingapp/models/cartModel/addToCartModel.dart';
import 'package:shoppingapp/models/cartModel/cartModel.dart';
import 'package:shoppingapp/models/cartModel/updateCartModel.dart';
import 'package:shoppingapp/models/categoriesModel/categoriesModel.dart';
import 'package:shoppingapp/models/favoriteModel/addToFavrite.dart';
import 'package:shoppingapp/models/favoriteModel/favoriteModel.dart';
import 'package:shoppingapp/models/homeModel/homeModel.dart';
import 'package:shoppingapp/network/endPoints.dart';
import 'package:shoppingapp/network/remote/dioHelper.dart';
import 'package:shoppingapp/screens/Moduls/cartScreen.dart';
import 'package:shoppingapp/screens/Moduls/favoriteScreen.dart';
import 'package:shoppingapp/screens/Moduls/profileScreen.dart';

import '../../components/shared_values.dart';
import '../../models/userModel/userProfileModel.dart';
import '../../screens/Moduls/homeScreen.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfileScreen()
  ];

 
  Icon favoriteIcon =Icon (Icons.favorite,color: Colors.red,);
  Icon unFavoriteIcon =Icon (Icons.favorite_border_rounded , color: Colors.grey,);
  // List<Widget> appBars = [
  //   EditedAppBarTitle(),
  //  CustomizedTextWidget(fontColor: defaultDarkBlue, fontSize: 15, fontWeight: FontWeight.bold,title: 'Favorites Screen'),
  //   EditedAppBarTitle(),
  //   Text('serring Screen')
  // ];
  void changeScreen(int index) {
    currentIndex = index;
    emit(ShopHomeChangeScreen());
  }

  late HomeModel homeModel;
late Map <dynamic ,dynamic> favorites = {};

late Map<dynamic,dynamic> cart ={};
  bool loadedHomeModel = false;
  void getHomeData() {
    emit(ShopHomeLoadingState());

    DioHelper.getData(
      path: HOME,
      token: userToken ,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      loadedHomeModel = true;
      homeModel.homeData.products.forEach((element) {
        favorites.addAll({
          element.id : element.inFavorite
        });
       });

        homeModel.homeData.products.forEach((element) {
        cart.addAll({
          element.id : element.inCart
        });
       });



       print(favorites);
    //   homeModel.homeData .products.forEach((element)
    // {
    //   favorites.addAll({
    //     element.id : element.inFavorite
    //   });
    // });
    //getFavorite();
    //print(favorites);
      // loadedHomeModel = true;
      //print(homeModel.homeData.products);

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
     // print(categoriesModel.categoriesModelData.categoriesData[2].name);
      emit(ShopCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopHomeErrorState());
    });
  }

  late CartModel cartModel;
  bool isCartLoaded = false;
 // Map<dynamic, dynamic> cart = {};
  void getCart() {
    emit(ShopCartLoadingState());

    DioHelper.getData(
      path: CART,
      token: userToken,
    ).then((value) {
      cartModel = CartModel.fromJson(value.data);
      print(cartModel.data.total);
      // cart.addAll(cartModel.data.cartItems);
      //  if(cartModel.status){
      //   isCartLoaded=true;
      //  }
      //  print(cartModel.toJson());
      emit(ShopCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopCartErrorState());
    });
  }

  late addToCartModel addToCart;

  void addItemToCart(dynamic productId) {


    emit(ShopAddToCartLoadingState());

    DioHelper.postData(
            path: CART,
             data: {'product_id': productId}, 
             token: userToken)
        .then((value) {
      addToCart = addToCartModel.fromJson(value.data);
      // print(addToCart.message);
if(addToCart.status){
  getCart();
}

 //  getHomeData();
      emit(ShopAddToCartSuccessState(addToCart));
    }).catchError((error) {
      print(error.toString());
      emit(ShopAddToCartErrorState());
    });
  }


  

  late UpdateCartModel  updateCartModel;
  void updateCartData(int cartId,int quantity) {
    emit(ShopUpdateCartLoadingState());
    DioHelper.putData(
      path: 'carts/$cartId',
      data: {
        'quantity':'$quantity',
      },
      token: userToken,
    ).then((value){
      updateCartModel = UpdateCartModel.fromJson(
        value.data);
      if(updateCartModel.status)
        getCart();
      else
        showToast(
          
         message: updateCartModel.message,
         backGroundColor :Colors.red);
      print('Update Cart '+ updateCartModel.status.toString());
      emit(ShopUpdateCartSuccessState());
    }).catchError((error){
      emit(ShopUpdateCartErrorState());
      print(error.toString());
    });
  }

// late AddToFavoritesModel addToFavoritesModel;


// void addToFavorite(int productId){
//   favorites[productId]  = !favorites[productId] ;
// emit(ShopAddtoFavoriteSuccessState());


//   DioHelper.postData(
//     path: FAVORITE,
  
//    data: {
// 'product_id':productId
//    }, 

// token: userToken
//    ).then((value) {

// addToFavoritesModel = AddToFavoritesModel.fromjson(value.data);
// getFavorite();
// emit(ShopAddtoFavoriteSuccessState());
//   }).catchError((error){


// emit(ShopAddToFavoriteErrorState());
//   });




// }
late AddToFavoritesModel changeToFavoritesModel;
  void changeToFavorite(int productID) {
    favorites[productID] = !favorites[productID];
 //   emit(ChangeFavoritesManuallySuccessState());

    emit(ShopAddtoFavoriteSuccessState());
    DioHelper.postData(
      path: FAVORITE,
      token: userToken,
      data: {
        'product_id': productID
      }
    ).then((value){
      changeToFavoritesModel = AddToFavoritesModel.fromjson(value.data);
      print(changeToFavoritesModel.status);
      if(changeToFavoritesModel.status == false)
        favorites[productID] = !favorites[productID];
      else {
        getFavorite();
      }
      emit(ShopAddtoFavoriteSuccessState());
    }).catchError((error){
      favorites[productID] = !favorites[productID];
      emit(ShopAddToFavoriteErrorState());
      print(error.toString());
    });
  }


 late FavoritesModel favoritesModel;
  
 void getFavorite(){
emit(ShopFavoriteLoadingState());
  DioHelper.getData(
    path:FAVORITE,
    token: userToken,
     ).then((value) {
favoritesModel = FavoritesModel.fromJson(value.data);
// getCategoriesData();
// getHomeData();
emit(ShopFavoriteSuccessState());
  }).catchError((error){


    emit(ShopFavoriteErrorState());
  });

 }


late UserModel userModel;
  void getProfileData() {
    emit(ProfileLoadingState());
    DioHelper.getData(
      path: PROFILE,
      token: userToken,
    ).then((value){
      userModel = UserModel.fromJson(value.data);
      print('Profile '+ userModel.status.toString());
      print(userModel.data.token);
      emit(ProfileSuccessState());
    }).catchError((error){
      emit(ProfileErrorState());
      print(error.toString());
    });
  }

  void updateProfileData({
    required String email,
    required String name,
    required String phone,
  }) {
    emit(UpdateProfileLoadingState());
    DioHelper.putData(
      path: UPDATE_PROFILE,
      token: userToken,
        data: {
          'name':name,
          'phone': phone,
          'email': email,
        }
    ).then((value){
      userModel = UserModel.fromJson(value.data);
      print('Update Profile '+ userModel.status.toString());
      emit(UpdateProfileSuccessState(userModel));
    }).catchError((error){
      emit(UpdateProfileErrorState());
      print(error.toString());
    });
  }

  late UserModel passwordModel;
  void changePassword({
    required context,
    required String currentPass,
    required String newPass
  }) {
    emit(ChangePassLoadingState());
    DioHelper.postData(
        path: 'change-password',
        token: userToken,
        data: {
          'current_password':currentPass,
          'new_password': newPass,
        }
    ).then((value){
      passwordModel = UserModel.fromJson(value.data);
      print('Change Password '+ passwordModel.status.toString());
      
      emit(ChangePassSuccessState(userModel));
    }).catchError((error){
      emit(ChangePassErrorState());
      print(error.toString());
    });
  }

}
