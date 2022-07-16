import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/components/shared_values.dart';
import 'package:shoppingapp/cubit/shopCubit/shopCubit.dart';
import 'package:shoppingapp/models/categoriesModel.dart';

import '../../components/components.dart';
import '../../cubit/shopCubit/shopStates.dart';
import '../../models/homeModel.dart';

class ShopLayout extends StatelessWidget {
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          ShopCubit shopCubit = ShopCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: shopCubit.appBars[shopCubit.currentIndex],
              ),
              body: ConditionalBuilder(
                condition: shopCubit.loadedHomeModel && shopCubit.loadedCategoriesModel ,
                builder:(context)=> shopCubit.screens[shopCubit.currentIndex]
              ,  fallback: (context)=>Center(child: CircularProgressIndicator()),
                ),
          
              bottomNavigationBar: editedBottomNavBar(context));
        });
  }
}
