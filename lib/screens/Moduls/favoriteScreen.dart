




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:shoppingapp/components/shared_values.dart';
import 'package:shoppingapp/screens/Moduls/shopLayout.dart';

import '../../cubit/shopCubit/shopCubit.dart';
import '../../cubit/shopCubit/shopStates.dart';
import '../../models/favoriteModel/favoriteModel.dart';
class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state) {},
      builder:(context,state)
      {
       return                 ShopCubit.get(context).favoritesModel.data.data.length == 0 ?
         Center(
           child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined,
                  size: 70,color: defaultLightBlue,),
                  SizedBox(height: 10,),
                  Text('Your Wishlist is empty',
                  style: TextStyle(
                    fontWeight: FontWeight.bold ),),
                  Text('Be Sure to add something of your favorites',style: TextStyle(fontSize: 15 ))
                ],
              ),
         ):
       
       
        Conditional.single(
             context: context,
             conditionBuilder:(context) => state is !ShopFavoriteLoadingState,
             widgetBuilder: (context) => SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               child: 
               
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                       padding: EdgeInsets.all(10),
                       child: Row(
                         children: [
                           //Text('My Wishlist',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                           CustomizedTextWidget(title: 'My Wishlist',
                            fontSize: 25, 
                            fontColor: defaultDarkBlue, 
                            fontWeight: FontWeight.bold),
                           
                           SizedBox(width: 5,),

                           
                           Text('(${ShopCubit.get(context).
                           favoritesModel.data.total} items)',
                           style: TextStyle(color: Colors.grey),),
                         ],
                       )),
                   ListView.separated(
                       physics:NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemBuilder:(context,index) => favoriteProducts(
                        ShopCubit.get(context).favoritesModel.data.data[index].product,context),
                       separatorBuilder:(context,index) =>Divider(),
                       itemCount: ShopCubit.get(context).favoritesModel.data.data.length
                   ),
                 ],
               ),
             ),
             fallbackBuilder:(context) => Center(child: CircularProgressIndicator()));
     

      } ,
    );
  }

  Widget favoriteProducts(FavoriteProduct model,context)
  {
    return InkWell(
      onTap: (){
        // ShopCubit.get(context).getProductData(model.id);
        // navigateTo(context, ProductScreen());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration( 
borderRadius: BorderRadius.circular(15),
   boxShadow: [
              BoxShadow(
                color: Colors.grey,
        
                offset: Offset(0.0, 1.0), //(x,y)
        
                blurRadius: 6.0,
              ),
            ], color: Colors.white,),
        
          
          child: Column(
            children: [
              Container(
                height: 100,
                child: Row(
                  children:
                  [
                    Image(image: NetworkImage('${model.image}'),width: 100,height: 100,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          // Text('${model.name}',
                          //   style: TextStyle(
                          //     fontSize: 15,),
                          //     maxLines: 3,
                          //     overflow: 
                          //     TextOverflow.ellipsis,),

                              CustomizedTextWidget(
                                title: model.name,
                               fontSize: 15,
                                fontColor: defaultDarkBlue,
                                 fontWeight: FontWeight.normal, 
                                 textOverflow: TextOverflow.ellipsis),
                          Spacer(),
                          
                          Text('USD '+'${model.price}',
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold, 
                          color: defaultDarkBlue),
                          ),
                          if(model.discount != 0)
                            Text('USD'+'${model.oldPrice}',
                            style: TextStyle(
                              decoration: 
                              TextDecoration.lineThrough,
                              color: Colors.grey),),
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
                  Icon(Icons.shopping_cart_outlined,color: Colors.grey,),
                  TextButton(
                      onPressed: (){
                        ShopCubit.get(context).changeToFavorite(model.id);
                     //   ShopCubit.get(context).addToCart;

                      },
                      child: Text('Add To Cart',style: TextStyle(color: Colors.grey,),)
                  ),
                  Spacer(),
                  Icon(Icons.delete_outline_outlined,color: Colors.grey,),
                  TextButton(
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeToFavorite(model.id);
                        ShopCubit.get(context).getFavorite();
                      },
                      child: Text('Remove',style: TextStyle(color: Colors.grey,))
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
