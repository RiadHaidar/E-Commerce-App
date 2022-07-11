import 'package:shoppingapp/models/loginModel.dart';

abstract class ShopLoginStates{}

class ShopInitialLoginState extends ShopLoginStates{}

class ShopLoadingLoginState extends ShopLoginStates{}

class ShopSuccessLoginState extends ShopLoginStates{
 final LoginModel loginModel;
  ShopSuccessLoginState(this.loginModel);
}
class ShopErrorLoginState extends ShopLoginStates{
final  String error;
  ShopErrorLoginState(this.error);
}

class ShopLoginChangePasswordVisibilty extends ShopLoginStates{}