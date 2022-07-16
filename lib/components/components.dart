



import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/components/shared_values.dart';
import 'package:shoppingapp/models/homeModel.dart';

import '../cubit/shopCubit/shopCubit.dart';
import '../models/categoriesModel.dart';

Widget defaultFormField({
  required context,
  TextEditingController? controller,
  dynamic label,
  IconData ? prefix,
  String ? initialValue,
  TextInputType ?keyboardType,
  Function(String)? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData ?suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      onFieldSubmitted: onSubmit,
      enabled: enabled,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.center,
      style:Theme.of(context).textTheme.bodyText1,
      initialValue:initialValue ,
      //textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
      hintText: label,
        border:UnderlineInputBorder(),
        prefixIcon: Icon(prefix,),
        suffixIcon: suffix != null ? IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,

      ),
    );


Widget defaultTextButton ({ 
  required String text,
  required void Function()? function,
}){
  return TextButton(
                      onPressed:function,
                     child: Text(text, 
                     ),
                     
                     );

}

// class defaultButton extends StatelessWidget {

//   required String text,  
//   required void Function? function , 
  
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height* 0.06,
//           child: ElevatedButton(
            
//             onPressed: (){}, child: Text('Login'), 
//                ),
//         );
//   }
// }


Widget defaultButton({ 
  required double height, 
  required String text, 
  required void Function()? onPressed, 
}) => Container(
  width: double.infinity, 
  height: height, 
  child: ElevatedButton(child: Text( 
    '$text', 
    
  ), 
  onPressed: onPressed,),
); 



Future<bool?> showToast({ 
 required String message, 
 required Color? backGroundColor, 

}) =>  Fluttertoast.showToast(
                msg:message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: backGroundColor,
                textColor: Colors.white,
                fontSize: 16.0);
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context,widget)=> Navigator.pushReplacement(context,  MaterialPageRoute(
    builder: (context) => widget,
  ),);




  MaterialColor myColor = MaterialColor(0xffffffff, color);
Map<int, Color> color =
{
50:Color.fromRGBO(255,255,255, .1),
100:Color.fromRGBO(4,131,184, .2),
200:Color.fromRGBO(4,131,184, .3),
300:Color.fromRGBO(4,131,184, .4),
400:Color.fromRGBO(4,131,184, .5),
500:Color.fromRGBO(4,131,184, .6),
600:Color.fromRGBO(4,131,184, .7),
700:Color.fromRGBO(4,131,184, .8),
800:Color.fromRGBO(4,131,184, .9),
900:Color.fromRGBO(4,131,184, 1),
};



class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
            CutomizedCarouselSlider(context, ShopCubit.get(context).categoriesModel.categoriesModelData),
            SizedBox(
              height: 20,
            ),
            CustomizedGirdView(ShopCubit.get(context).homeModel.homeData,context),
          ]),
    );
  }
}


Widget CustomizedGirdView(HomeData homeData,context) => Expanded(
                        child: GridView.count(
                            childAspectRatio: 1.35 / 1.58,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 5,
                            //  physics: NeverScrollableScrollPhysics(),
                            children:List.generate(
                              homeData.products.length,
                             (index) => buildItem(homeData.products[index],
                             context))
                            
                            ,),
                      );
Widget CustomizedTextWidget(
        {required String title,
        required double fontSize,
        required Color? fontColor,
        required FontWeight fontWeight}) =>
    Text(
     // softWrap:true,
     textAlign: TextAlign.center,
     overflow: TextOverflow.ellipsis,
     maxLines:2,
      title,
      style: TextStyle(
        
          fontWeight: fontWeight, fontSize: fontSize, color: fontColor),
    );

Widget buildItem(Products products,context) => Padding(
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
                    RichText(
                      text: TextSpan(
                        text: '\$',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                         color: defaultLightBlue),
                        children:  <TextSpan>[
                          TextSpan(
                            text: products.price.toString(),
                            style: TextStyle(
                                             fontWeight: FontWeight.bold,
                              color:defaultDarkBlue, fontSize: 16),
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
        //        SizedBox(height: 5,),
                Image(
      //width: 100,
      height: 100,
                  fit: BoxFit.contain,
                  image: NetworkImage(
                              products.image)              ),
                Text(
      
      products.name,
      textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                color: defaultDarkBlue),
                )
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
          onTap: (index){
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
                  label: 'Settings', icon: Icon(Icons.settings)),
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

Widget EditedAppBarTitle() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
            //  ShopCubit.get(context).getHomeData();
         //  ShopCubit.get(context).getCategoriesData();
            },
            icon: Icon(Icons.menu)),
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://cdn.vectorstock.com/i/preview-1x/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp'),
        )
      ],
    );
