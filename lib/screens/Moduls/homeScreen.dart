

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/screens/Moduls/shopLayout.dart';

import '../../cubit/shopCubit/shopCubit.dart';
import '../../cubit/shopCubit/shopStates.dart';



class HomeScreen extends StatelessWidget {
  get defaultDarkBlue => null;

  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      
      listener: (context, state) {
        
      },
      
      
      builder:(context,state){
              ShopCubit shopCubit = ShopCubit.get(context);
        return ConditionalBuilder(
                condition: shopCubit.loadedHomeModel,
                  
                builder: (context) =>   Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Scaffold(
          body: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShopLayoutTopContainer(),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                       fontFamily: GoogleFonts.redHatDisplay().fontFamily,
                         fontWeight: FontWeight.w800,
                        fontSize: 37,
                        letterSpacing: 1.5,
                        color: defaultDarkBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // CutomizedCarouselSlider(context, ShopCubit.get(
                //   context).categoriesModel.categoriesModelData),
                // SizedBox(
                //   height: 20,
                // ),
                CustomizedGirdView(ShopCubit.get(context).
                homeModel.homeData,
                 context), 
              
              ]),
        ),
      ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              );
        
        
        
       
      }
    );
  }
}

