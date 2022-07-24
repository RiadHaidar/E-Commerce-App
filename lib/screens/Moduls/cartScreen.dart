import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/cubit/shopCubit/shopCubit.dart';
import 'package:shoppingapp/models/cartModel/cartModel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoppingapp/screens/Moduls/shopLayout.dart';
import '../../components/shared_values.dart';
import '../../cubit/shopCubit/shopStates.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCubit shopCubit = ShopCubit.get(context);
          return  Scaffold(

            body: ShopCubit.get(context).cartModel.data.cartItems.length == 0 ?  Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined,
                size: 70,color: defaultLightBlue,),
                SizedBox(height: 10,),
                Text('Your Cart is empty',
                style: TextStyle(
                  fontWeight: FontWeight.bold ),),
                Text('Be Sure to fill your cart with something you like',style: TextStyle(fontSize: 15 ))
              ],
            )):
          
          
               ConditionalBuilder(
              condition: state is! ShopCartLoadingState,
              builder: (context) => Padding(
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
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                          itemCount: shopCubit.cartModel.data.cartItems.length,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) => Slidable(
                              startActionPane: ActionPane(
                                // A motion is a widget used to control how the pane animates.
                                motion: ScrollMotion(),

                                // A pane can dismiss the Slidable.

                                // All actions are defined in the children parameter.
                                children: [
                                  // A SlidableAction can have an icon and/or a label.
                              
                                  SlidableAction(
                                  onPressed: (ctx) {
                                    shopCubit.addItemToCart(shopCubit
                                        .cartModel
                                        .data
                                        .cartItems[index]
                                        .product
                                        .id);
                                    //      print('deleted successfully')
                                    ;
                                  },
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                  borderRadius: BorderRadius.circular(25),
                                    ),
                                       
                                 SizedBox(width: 20,),
                                ],
                              ),
                              child: cartItemBuilder(
                                  shopCubit.cartModel.data.cartItems[index],
                                  context))),
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
                                    text: shopCubit
                                        .cartModel.data.cartItems.length
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Items',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: defaultDarkBlue,
                                            fontSize: 16),
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
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: shopCubit.cartModel.data.total
                                            .toStringAsFixed(3),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: defaultDarkBlue,
                                            fontSize: 16),
                                      ),

                                      // TextSpan(text: ' world!'),
                                    ],
                                  ),
                                ),
                              ),
                              //   SizedBox(width: 2,),
                            ],
                          ),
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
                                  borderRadius: BorderRadius.circular(25)),
                              child: ElevatedButton(

                                onPressed: () {
                                  //shopCubit.getCart();

                                  shopCubit.getProfileData();
                                },
                               
                                child: Center(
                                    child: CustomizedTextWidget(
                                        title: 'Checkout',
                                        fontSize: 18,
                                        fontColor: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
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
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}


Widget cartItemBuilder(CartItems cartItems, context) => 

    
 Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
    
            offset: Offset(0.0, 1.0), //(x,y)
    
            blurRadius: 6.0,
          ),
        ], color: Colors.white,),
    

        
      padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 100,
              child: Row(
                children:
                [
                  Image(image: NetworkImage('${cartItems.  product.image}'),width: 100,height: 100,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text('${cartItems.product.name}',
                          style: TextStyle(fontSize: 15, 
                          color: defaultDarkBlue),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis, 
                          ),
                        Spacer(),
                        Text('USD '+'${cartItems.product.price}',
                        style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold, 
                        color: defaultDarkBlue),),
                        if(cartItems.product.discount != 0)
                          Text('USD'+'${cartItems.product.oldPrice}',
                          style: TextStyle(
                            
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[700]),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              children:
              [
                Container(
                  width: 20,
                  height: 20,
                  child: MaterialButton(
                    onPressed: (){
                       int quantity = 
                       cartItems.quantity-1;
                      if(quantity != 0)
                        ShopCubit.get(context).
                      updateCartData(
                        cartItems.id, 
                      quantity);
                    },
                    child: Icon(Icons.remove,size: 17,color: Colors.deepOrange,),
                    minWidth: 20,
                  //  shape: OutlineInputBorder(
                    //  borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.zero,

                  ),
                ),
                SizedBox(width: 5,),
                Text( cartItems.quantity.toString() 
                ,style: TextStyle(fontSize: 20 , color: defaultDarkBlue),),
                SizedBox(width: 5,),
                Container(
                  width: 20,
                  height: 20,
                  child: MaterialButton(
                      onPressed: (){
                       int quantity = cartItems
                        .quantity+1;
                        if(quantity <= 5)
                         ShopCubit.get(context).
                         updateCartData(
                          cartItems.id,
                        quantity);
                      },
                    child: Icon(
                      Icons.add,
                    size: 17,color: Colors.green[500],),
                    minWidth: 10,
                    //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.zero,

                  ),
                ),
                Spacer(),
                TextButton(
                    onPressed: (){
                      //ShopCubit.get(context).addToCart(model.product!.id);
                 ShopCubit.get(context).changeToFavorite( cartItems.product.id);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.grey,size: 18,),
                        SizedBox(width: 2.5,),
                        Text(
                          'Move to Wishlist'
                        ,style: TextStyle(
                          color: Colors.grey,
                        fontSize: 15,),),
                      ],
                    ),
                ),
                SizedBox(width: 5,),
                Container(height: 20,width: 1,color: Colors.grey[300],),
                TextButton(
                    onPressed: ()
                    {
                  ShopCubit.get(context).addItemToCart(cartItems.product.id);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline_outlined,color: Colors.grey,size: 18,),
                        SizedBox(width: 2.5,),
                        Text('Remove',style: TextStyle(color: 
                        Colors.grey,fontSize: 15,)),
                      ],
                    )
                ),
              ],
            )
          ],
        ),
      );












      /* 
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
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
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,\c
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            //r  mainAxisAlignment: M,
              children: [
                SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.all(9),
                    width: 100,
                    height: 100,
                    //   alignment: Alignment.center,
                   // child: Image.network(cartItems.product.image), 
                        decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(10), 
  
                image: DecorationImage(image: NetworkImage(
                  cartItems.product.image
                  
                  ), 
  
                fit: BoxFit.fill)
                ,)
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomizedTextWidget(
                            title: cartItems.product.name,
                            fontSize: 15,
                            fontColor: defaultDarkBlue,
                            fontWeight: FontWeight.bold),
                        CustomizedTextWidget(
                            title: cartItems.product.price.toString(),
                            fontSize: 18,
                            fontColor: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

*/