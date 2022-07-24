import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/components/components.dart';
import 'package:shoppingapp/cubit/shopCubit/shopCubit.dart';
import 'package:shoppingapp/screens/Moduls/favoriteScreen.dart';
import 'package:shoppingapp/screens/Moduls/homeScreen.dart';
import 'package:shoppingapp/screens/Moduls/profileScreen.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../cubit/shopCubit/shopStates.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:shoppingapp/components/shared_values.dart';

import '../../models/categoriesModel/categoriesModel.dart';
import '../../models/homeModel/homeModel.dart';

class ShopLayout extends StatelessWidget {
  TextEditingController searchTextController = TextEditingController();
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      //  if(state is ShopSuccessFavoriteState){
      //   if(!state.changeFavoriteModel!.status  ){
      //     showToast(message:state.changeFavoriteModel!.message ,
      //     backGroundColor: Colors.red);
      //   }
      // }
    }, builder: (context, state) {
      ShopCubit shopCubit = ShopCubit.get(context);
      return SideMenu(
        key: _sideMenuKey,
        menu: buildMenu(context),
        type: SideMenuType.slideNRotate, // check above images
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        print('object');
                        final _state = _sideMenuKey.currentState;
                        if (_state!.isOpened)
                          _state.closeSideMenu(); // close side menu
                        else
                          _state.openSideMenu(); // open side menu
                      },
                      icon: Icon(Icons.menu)),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://cdn.vectorstock.com/i/preview-1x/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp'),
                  )
                ],
              ),
            ),
            body: shopCubit.screens[shopCubit.currentIndex],
            bottomNavigationBar: editedBottomNavBar(context)),
      );
    });
  }
}

Widget buildMenu(context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://cdn.vectorstock.com/i/preview-1x/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp'),
              ),
              SizedBox(height: 16.0),
              Text(
                "Hello, Riad Haidar",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            ShopCubit.get(context).screens[ShopCubit.get(context).currentIndex];
          },
          leading: const Icon(Icons.home, size: 30.0, color: Colors.white),
          title: const Text(
            "Home",
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {
            //  ShopCubit.get(context). screens[ShopCubit.get(context).currentIndex];
// navigateAndFinish(context, HomeScreen());
            navigateTo(context, HomeScreen());
          },
          leading:
              const Icon(Icons.verified_user, size: 20.0, color: Colors.white),
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {
            navigateTo(context, ProfileScreen());
          },
          leading:
              const Icon(Icons.shopping_cart, size: 20.0, color: Colors.white),
          title: const Text(
            "Cart",
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {
            navigateTo(context, FavoritesScreen());
          },
          leading:
              const Icon(Icons.star_border, size: 20.0, color: Colors.white),
          title: const Text(
            "Favorites",
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
      ],
    );
Widget CustomizedGirdView(HomeData homeData, context) => Expanded(
      child: GridView.count(
        childAspectRatio: 1.20 / 1.58,
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        //  physics: NeverScrollableScrollPhysics(),
        children: List.generate(
            homeData.products.length,
            (index) => buildItem(
                  homeData.products[index],
                  context,
                )),
      ),
    );
Widget CustomizedTextWidget({
  required String title,
  required double fontSize,
  required Color? fontColor,
  required FontWeight fontWeight,
  TextDecoration? decoration,
  TextOverflow? textOverflow,
}) =>
    Text(
      // softWrap:true,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      title,
      style: TextStyle(
          fontWeight: fontWeight, fontSize: fontSize, color: fontColor),
    );

Widget buildItem(Products products, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          ShopCubit.get(context).addItemToCart(products.id);
        },
        child: Container(
          // width: 150,

          // height: 180,

          //color: Colors.white,

          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey,

              offset: Offset(0.0, 1.0), //(x,y)

              blurRadius: 6.0,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(22)),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //    crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          ShopCubit.get(context).changeToFavorite(products.id);
                        },
                        child: ShopCubit.get(context).favorites[products.id]
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.grey,
                              )),
                  ],
                ),
                //        SizedBox(height: 5,),
                Image(
                    //width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    image: NetworkImage(products.image)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  products.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: defaultDarkBlue),
                ),
                SizedBox(
                  height: 5,
                ),

                Row(
                  //SmainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //                     Text('USD '+'${products.price}',
                    // style: TextStyle(
                    //   fontSize: 20,
                    // fontWeight: FontWeight.bold),),
                    // if(products.discount != 0)
                    //   Text('USD'+'${products.oldPrice}',
                    //   style: TextStyle(decoration: TextDecoration.lineThrough,
                    //   color: Colors.grey[700]),),
                    CustomizedTextWidget(
                        title: '\$' + '${products.price.toStringAsFixed(1)}',
                        fontSize: 16,
                        fontColor: defaultDarkBlue,
                        fontWeight: FontWeight.bold),

                    if (products.discount != 0)
                      Text(
                        ' \$' + '${products.oldPrice}',
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[700]),
                      ),
                    // CustomizedTextWidget(
                    //   title:  ' \$'+'${products.oldPrice..toStringAsFixed(1)}',
                    //  fontSize: 20,
                    //   fontColor:Colors.grey ,
                    //   fontWeight: FontWeight.normal,
                    //   decoration: TextDecoration.underline)

                    //        ,
                    //    IconButton(onPressed: (){}, icon:Icon(Icons.add_to_queue) )
                    Spacer(),
                    InkWell(
                        onTap: () {
                          ShopCubit.get(context).addItemToCart(products.id);
                        },
                        child: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.blue[300],
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget editedBottomNavBar(context) => Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 10.0,
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero),
        color: Colors.white),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
            currentIndex: ShopCubit.get(context).currentIndex,
            onTap: (index) {
              ShopCubit.get(context).changeScreen(index);
            },
            selectedItemColor: Color(0xff0DD7DF),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Favorite', icon: Icon(Icons.favorite_border)),
              BottomNavigationBarItem(
                  label: 'Cart', icon: Icon(Icons.shopping_basket_outlined)),
              BottomNavigationBarItem(
                  label: 'Profile', icon: Icon(Icons.person_outline)),
            ]),
      ),
    ));
Widget CutomizedCarouselSlider(
        context, CategoriesModelData categoriesModelData) =>
    Container(
      //  padding: EdgeInsets.all(20),
      height: 30,
      width: MediaQuery.of(context).size.width * 0.9,
      child: CarouselSlider(
          items: List.generate(
              categoriesModelData.categoriesData.length,
              (index) => CustomizedTextWidget(
                  title: categoriesModelData.categoriesData[index].name,
                  fontSize: 18,
                  fontColor: defaultDarkBlue,
                  fontWeight: FontWeight.bold)),
          options: CarouselOptions(
            viewportFraction: 0.2,
          )),
    );

/*ListView.separated(
              
              itemBuilder:(context,index)=> buildItem() , 
            separatorBuilder: (context,index)=> Divider(), 
            itemCount: 5),
            */

Widget ShopLayoutTopContainer() => Padding(
      padding: const EdgeInsets.all(22.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // color: Colors.white,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(232, 209, 209, 209),
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: defaultLightBlue,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Find Products',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
            ),
          ),
          //IconButton(onPressed: (){}, icon: Icon(Icons.search) )
        ],
      ),
    );

// Widget EditedAppBarTitle() => Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//             onPressed: () {
//            final _state = _sideMenuKey.currentState;
//                 if (_state.isOpened)
//                   _state.closeSideMenu(); // close side menu
//                 else
//                   _state.openSideMenu();// open side menu
//               },

//             icon: Icon(Icons.menu)),
//         CircleAvatar(
//           radius: 25,
//           backgroundImage: NetworkImage(
//               'https://cdn.vectorstock.com/i/preview-1x/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp'),
//         )
//       ],
//     );
