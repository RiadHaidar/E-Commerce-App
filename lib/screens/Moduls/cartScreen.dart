import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/components/components.dart';
import 'package:shoppingapp/cubit/shopCubit/shopCubit.dart';
import 'package:shoppingapp/models/cartModel.dart';

import '../../components/shared_values.dart';
import '../../cubit/shopCubit/shopStates.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCubit shopCubit = ShopCubit.get(context);
          return Scaffold(
            body: ConditionalBuilder(
              condition:shopCubit.isCartLoaded , 
              builder: (context)=>Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'My Bag',
                          style: TextStyle(
                            fontFamily: GoogleFonts.redHatDisplay().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 37,
                            letterSpacing: 1.5,
                            color: defaultDarkBlue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Check and Pay Your orders',
                          style: TextStyle(
                            fontFamily: GoogleFonts.redHatDisplay().fontFamily,
                            //   fontWeight: FontWeight.w800,
                            fontSize: 17,
                            letterSpacing: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.separated(
                            itemCount: shopCubit.cartModel.data.cartItems.length,
                            separatorBuilder: (context, index) => SizedBox(),
                            itemBuilder: (context, index) => cartItemBuilder(shopCubit.cartModel.data.cartItems[index],context)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                      //  crossAxisAlignment: Cr,
                        children: [
                          Container(
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      //    SizedBox(width: 4,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                            text: shopCubit.cartModel.data.cartItems.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                             color: Colors.grey),
                            children:  <TextSpan>[
                              TextSpan(
                                text:' Items',
                                style: TextStyle(
                                                 fontWeight: FontWeight.bold,
                                  color:defaultDarkBlue, fontSize: 16),
                              ),
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: RichText(
                          text: TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                             color: defaultLightBlue),
                            children:  <TextSpan>[
                              TextSpan(
                                text: shopCubit.cartModel.data.total .toString(),
                                style: TextStyle(
                                                 fontWeight: FontWeight.bold,
                                  color:defaultDarkBlue, fontSize: 16),
                              ),
                        
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                                          ),
                        ),
                        //   SizedBox(width: 2,),
                       ],),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffDBF0F8),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(232, 209, 209, 209),
                                  offset: Offset(0.0, 1.5), //(x,y)
                                  blurRadius: 10.0,
                                ),
                              ],
              
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                    color: defaultLightBlue,
                                    borderRadius: BorderRadius.circular(25)
                                    
                                    
                                    ),
                           child: Center(child: CustomizedTextWidget(title: 'Checkout',
                            fontSize: 18, fontColor: Colors.white,
                             fontWeight: FontWeight.w600)),
                              ),
              
                          // ElevatedButton(onPressed:
                          //${shopCubit.cartModel.data.total}
                          // (){},
                          //  child: Text('Checkout'))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              
              fallback: (context)=>Center(child: CircularProgressIndicator(),),
            
              
               

            ),
          );
        });
  }
}

Widget cartItemBuilder( CartItems cartItems,context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //   width: MediaQuery.of(context).size.width * 0.5,
      
          //height: MediaQuery.of(context).size.height * 0.15,
      
        //color: Colors.white,
      
        decoration: BoxDecoration(
            //      color:Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
      
                offset: Offset(0.0, 1.0), //(x,y)
      
                blurRadius: 6.0,
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(22)),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: 100,
            height: 100,
                //   alignment: Alignment.center,
                child: Image.network(
                 cartItems.product.image
                  )  ),
            Container(
                width: 100,
            height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomizedTextWidget(
                      title:cartItems.product.name,
                      fontSize: 20,
                      fontColor: defaultDarkBlue,
                      fontWeight: FontWeight.bold),
                  CustomizedTextWidget(
                      title: cartItems. product.price.toString(),
                      fontSize: 18,
                      fontColor: Colors.grey,
                      fontWeight: FontWeight.w300),
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    //  ShopCubit.get(context).getCart();
                  },
                  child: CustomizedTextWidget(
                      title: '+',
                      fontSize: 20,
                      fontColor: defaultDarkBlue,
                      fontWeight: FontWeight.bold),
                ),
                CustomizedTextWidget(
                    title: cartItems.quantity.toString(),
                    fontSize: 18,
                    fontColor: Colors.grey,
                    fontWeight: FontWeight.normal),
                TextButton(
                    onPressed: () {},
                    child: CustomizedTextWidget(
                        title: '-',
                        fontSize: 20,
                        fontColor: defaultDarkBlue,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
