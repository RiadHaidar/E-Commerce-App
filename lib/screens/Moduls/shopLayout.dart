import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppingapp/components/components.dart';

class ShopLayout extends StatelessWidget {
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          actions: [
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
        body: Column(
          children: [

          Padding(
            padding: const EdgeInsets.all(40.0),
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
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Find Products',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
                //IconButton(onPressed: (){}, icon: Icon(Icons.search) )
              ],
            ),
          ),
          Text('Categories'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 500,
              child: GridView.builder(
                itemCount: 12,
                gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
              //    childAspectRatio: 3 / 0.5,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 20),
               itemBuilder: (context, index)=> buildItem()) ,
            ),
          ),
        ]),

        bottomNavigationBar: editedBottomNavBar());
  }
}

Widget buildItem() => Container(
      width: 150,
      height: 180,
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(22)),
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
                GestureDetector(child: Icon(Icons.favorite_border_outlined))
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
    );

Widget editedBottomNavBar() => Container(
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