import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/components/components.dart';
import 'package:shoppingapp/components/shared_values.dart';
import 'package:shoppingapp/cubit/shopCubit/shopCubit.dart';
import 'package:shoppingapp/network/local/cacheHelper.dart';
import 'package:shoppingapp/network/remote/dioHelper.dart';
import 'package:shoppingapp/screens/Moduls/shopLayout.dart';
import 'package:shoppingapp/screens/loginScreen.dart';
import 'package:shoppingapp/screens/onBoardingScreen.dart';
import 'cubit/blocObserver.dart';
import 'cubit/loginCubit/shopLoginCubit.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await CacheHelper.init();
      DioHelper.inti();
      
Widget widget;

 bool? showOnBoard = CacheHelper.getData('ShowOnBoard');


  if(showOnBoard == false) {
    if (userToken != null)
      widget = ShopLayout();
    else
      widget = LoginScreen();
  }
  else
    widget = OnBoardingScreen();
      runApp(MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
late final Widget startWidget;
MyApp(this.startWidget);
  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
Color primary = Color(0xFF2F4D7D);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopLoginCubit(),),
        BlocProvider(create: (context) => ShopCubit()..getHomeData()..getCategoriesData()..getCart()..getFavorite()..getProfileData(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         // primarySwatch: myColor,
          scaffoldBackgroundColor:defaultBackgroundColor ,
          primarySwatch:  generateMaterialColor(primary),
          fontFamily:GoogleFonts.roboto() .fontFamily ,
    // textTheme: TextTheme(),
          // bodyText1: GoogleFonts.notoSans(textStyle: textTheme.bodyText1),
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            // systemOverlayStyle: SystemUiOverlayStyle(
            //   statusBarColor: Color(0xffDCEEF8),
            // ),
            iconTheme: IconThemeData(
              color: Colors.grey[800],
            ),
          ),
        ),
        home: startWidget,
      ),
    );
  }
}
