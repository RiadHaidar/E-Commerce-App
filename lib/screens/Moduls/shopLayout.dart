import 'package:flutter/material.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent
        ,
      ),
      body: Column(),
      bottomNavigationBar: editedBottomNavBar()
    );
  }
}


Widget editedBottomNavBar() =>  Container(
          decoration: BoxDecoration(
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
                    BottomNavigationBarItem(
                        label: 'Home', icon: Icon(Icons.home)),
                    BottomNavigationBarItem(
                        label: 'Categories',
                        icon: Icon(Icons.category_outlined)),
                    BottomNavigationBarItem(
                        label: 'Favorite', icon: Icon(Icons.favorite_border)),
                    BottomNavigationBarItem(
                        label: 'Cart',
                        icon: Icon(Icons.shopping_basket_outlined)),
                    BottomNavigationBarItem(
                        label: 'Settings', icon: Icon(Icons.settings)),
                  ]),
            ),
          ));