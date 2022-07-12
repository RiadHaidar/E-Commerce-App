import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/components/shared_values.dart';
import 'package:shoppingapp/network/local/cacheHelper.dart';
import 'package:shoppingapp/screens/Moduls/shopLayout.dart';
import '../components/components.dart';
import '../cubit/shopLoginCubit/shopLoginCubit.dart';
import '../cubit/shopLoginCubit/shopLoginStates.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
      if (state is ShopSuccessLoginState) {
        if (state.loginModel.status) {
          showToast(
              message: state.loginModel.message,
              backGroundColor: Colors.green);
            //  CacheHelper.put('isLoggedIn', true);
            navigateTo(context, ShopLayout());
        } else {
          showToast(
              message: state.loginModel.message,
               backGroundColor: Colors.red);
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar( 
          elevation: 0,
          backgroundColor: Colors.transparent,),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      'Login now to see our hot offers',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultFormField(
                      context: context,
                      label: 'Email Address',
                      controller: emailEditingController,
                      prefix: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      context: context,
                      label: 'Password',
                      controller: passwordEditingController,
                      prefix: Icons.lock,
                      suffix: ShopLoginCubit.get(context).iconData,
                      // showPass: true,
                      isPassword: ShopLoginCubit.get(context).isPassword,
                      keyboardType: TextInputType.text,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your  Password';
                        }
                      },
                      suffixPressed: () {
                        ShopLoginCubit.get(context).changePasswordVisibilty();
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ConditionalBuilder(
                      condition: state is! ShopLoadingLoginState,
                      builder: (BuildContext context) => defaultButton(
                          height: MediaQuery.of(context).size.height * 0.06,
                          text: 'LOGIN',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                  email: emailEditingController.text,
                                  password: passwordEditingController.text);
                            }
                          }),
                      fallback: (BuildContext context) =>
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                        defaultTextButton(
                            text: 'Register',
                            function: () {
                              // navigateAndFinish(context, RegisterScreen());
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
