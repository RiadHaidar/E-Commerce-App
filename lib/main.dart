import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/components/shared_values.dart';
import 'package:shoppingapp/network/local/cacheHelper.dart';
import 'package:shoppingapp/network/remote/dioHelper.dart';
import 'package:shoppingapp/screens/loginScreen.dart';
import 'package:shoppingapp/screens/onBoardingScreen.dart';

import 'cubit/blocObserver.dart';
import 'cubit/shopCubit/shopLoginCubit.dart';

void main() {
  BlocOverrides.runZoned(
    ()async {

      WidgetsFlutterBinding.ensureInitialized();
   await   CacheHelper.init();
      DioHelper.inti();

// bool checkFirstScreen = CacheHelper.get('isLoggedIn');

// Widget isScreen;
// if(checkFirstScreen){
// isScreen = ShopLayout();
// }else{
//   isScreen = OnBoardingScreen();
// }

      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

// Widget? FirstScreen;
// MyApp(this.FirstScreen);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) =>ShopLoginCubit()),
  ],
      child: MaterialApp(
        theme: ThemeData(  
          scaffoldBackgroundColor: Color(0xffDCEEF8),
     //    primarySwatch: Colors.blue,
        //   textTheme: GoogleFonts.notoSansTextTheme(textTheme).copyWith(
        // bodyText1: GoogleFonts.notoSans(textStyle: textTheme.bodyText1),
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.grey[800]))
      ),
    
    
    
        
        home: OnBoardingScreen(),
      ),
    );
  }
}
