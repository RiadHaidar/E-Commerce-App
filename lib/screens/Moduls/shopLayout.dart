import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/cubit/shopCubit/shopCubit.dart';

import '../../cubit/shopCubit/shopStates.dart';

class ShopLayout extends StatelessWidget {
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates> (
      listener: (context, state) {
        
      },
      builder:  (context, state) {

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {
                  ShopCubit.get(context).getHomeData();
                }, icon: Icon(Icons.menu)),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 10),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://cdn.vectorstock.com/i/preview-1x/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp'),
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // color: Colors.white,
    
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color(0xff0DD7DF),
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
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
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
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Color(0xff363B64),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                //  padding: EdgeInsets.all(20),
                height: 30,
                width: MediaQuery.of(context).size.width * 0.9,
                child: CarouselSlider(
                    items: [
                      CustomizedTextWidget(
                          title: 'Shoes',
                          fontSize: 17,
                          fontColor: Color(0xff363B64),
                          fontWeight: FontWeight.bold),
                      CustomizedTextWidget(
                          title: 'Products',
                          fontSize: 17,
                          fontColor: Color(0xff363B64),
                          fontWeight: FontWeight.bold),
                      CustomizedTextWidget(
                          title: 'Shoes',
                          fontSize: 17,
                          fontColor: Color(0xff363B64),
                          fontWeight: FontWeight.bold),
                      CustomizedTextWidget(
                          title: 'Products',
                          fontSize: 17,
                          fontColor: Color(0xff363B64),
                          fontWeight: FontWeight.bold),
                      CustomizedTextWidget(
                          title: 'Shoes',
                          fontSize: 17,
                          fontColor: Color(0xff363B64),
                          fontWeight: FontWeight.bold),
                      CustomizedTextWidget(
                          title: 'Products',
                          fontSize: 17,
                          fontColor: Color(0xff363B64),
                          fontWeight: FontWeight.bold),
                    ],
                    options: CarouselOptions(
                      viewportFraction: 0.2,
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: GridView.count(
                    childAspectRatio: 1.45 / 1.58,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                    //  physics: NeverScrollableScrollPhysics(),
                    children: [
                      buildItem(),
                      buildItem(),
                      buildItem(),
                      buildItem(),
                      buildItem(),
                      buildItem(),
                      buildItem(),
                      buildItem(),
                      buildItem(),
                      buildItem(),
                    ]),
              ),
            ]),
          ),
          bottomNavigationBar: editedBottomNavBar()
    );
  });
   }
}
      
Widget CustomizedTextWidget(
        {required String title,
        required double fontSize,
        required Color? fontColor,
        required FontWeight fontWeight}) =>
    Text(
      title,
      style: TextStyle(
          fontWeight: fontWeight, fontSize: fontSize, color: fontColor),
    );

Widget buildItem() => Padding(
      padding: const EdgeInsets.all(8.0),
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$ ',
                      style: TextStyle(fontSize: 15, color: Color(0xff0DD7DF)),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '222',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),

                        // TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
              Image(
                fit: BoxFit.cover,
                width: 100,
                image: NetworkImage(
                    'https://m.media-amazon.com/images/I/71D9ImsvEtL._UL1500_.jpg'),
              ),
              Flexible(
                child: Text(
                  'Nike Jprdan Dadsads sdsad dsasdds ads',
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget editedBottomNavBar() => Container(
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
            selectedItemColor: Color(0xff0DD7DF),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Categories', icon: Icon(Icons.category_outlined)),
              BottomNavigationBarItem(
                  label: 'Favorite', icon: Icon(Icons.favorite_border)),
              BottomNavigationBarItem(
                  label: 'Cart', icon: Icon(Icons.shopping_basket_outlined)),
              BottomNavigationBarItem(
                  label: 'Settings', icon: Icon(Icons.settings)),
            ]),
      ),
    ));


/*ListView.separated(
              
              itemBuilder:(context,index)=> buildItem() , 
            separatorBuilder: (context,index)=> Divider(), 
            itemCount: 5),
            */