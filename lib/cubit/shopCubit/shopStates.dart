import 'package:shoppingapp/models/cartModel/addToCartModel.dart';
import 'package:shoppingapp/models/favoriteModel/addToFavrite.dart';

import '../../models/userModel/userProfileModel.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}
class ShopHomeLoadingState extends ShopStates{}
class ShopHomeSuccessState extends ShopStates{}
class ShopHomeErrorState extends ShopStates{}


class ShopCategoriesLoadingState extends ShopStates{}
class ShopCategoriesSuccessState extends ShopStates{}
class ShopCategoriesErrorState extends ShopStates{}

class ShopHomeChangeScreen extends ShopStates{}

class ShopCartLoadingState extends ShopStates{}
class ShopCartSuccessState extends ShopStates{}
class ShopCartErrorState extends ShopStates{}


class ShopAddToCartLoadingState extends ShopStates{}
class ShopAddToCartSuccessState extends ShopStates{
  final addToCartModel addModel; 
  ShopAddToCartSuccessState(this.addModel);
}
class ShopAddToCartErrorState extends ShopStates{}


class ShopUpdateCartLoadingState extends ShopStates{}
class ShopUpdateCartSuccessState extends ShopStates{}
class ShopUpdateCartErrorState extends ShopStates{}

class ShopAddToFavoriteLoadingState extends ShopStates{}
class ShopAddtoFavoriteSuccessState extends ShopStates{
 // final AddToFavoritesModel; 

}
class ShopAddToFavoriteErrorState extends ShopStates{}



class ShopFavoriteLoadingState extends ShopStates{}
class ShopFavoriteSuccessState extends ShopStates{}
class ShopFavoriteErrorState extends ShopStates{}




///Profile State
class ProfileLoadingState extends ShopStates{}
class ProfileSuccessState extends ShopStates {}
class ProfileErrorState extends ShopStates{}
///End of Profile State


///Update Profile State
class UpdateProfileLoadingState extends ShopStates{}
class UpdateProfileSuccessState extends ShopStates {
  final UserModel updateUserModel;
  UpdateProfileSuccessState(this.updateUserModel);
}
class UpdateProfileErrorState extends ShopStates{}
///End of Update Profile State

///ChangePassword State
class ChangePassLoadingState extends ShopStates{}
class ChangePassSuccessState extends ShopStates {
  final UserModel passUserModel;
  ChangePassSuccessState(this.passUserModel);
}
class ChangePassErrorState extends ShopStates{}
///End of ChangePassword State

class EditPressedState extends ShopStates{}



