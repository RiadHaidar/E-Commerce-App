import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/components/components.dart';

import '../../components/shared_values.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  itemCount: 3,
                  separatorBuilder: (context, index) => SizedBox(),
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                       //   width: MediaQuery.of(context).size.width * 0.5,

                       //   height: MediaQuery.of(context).size.height * 0.15,

                          //color: Colors.white,

                          decoration: BoxDecoration(
                              //      color:Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,

                                  offset: Offset(0.0, 1.0), //(x,y)

                                  blurRadius: 6.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22)),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: 100,

                                  //   alignment: Alignment.center,
                                  child: Image.network(
                                      'https://thumbs.dreamstime.com/z/lots-groceries-17001094.jpg')),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomizedTextWidget(
                                      title: 'xxxxxxxxxxxx',
                                      fontSize: 20,
                                      fontColor: defaultDarkBlue,
                                      fontWeight: FontWeight.bold),
                                  CustomizedTextWidget(
                                      title: 'ssssssssss',
                                      fontSize: 18,
                                      fontColor: Colors.grey,
                                      fontWeight: FontWeight.w300),


                                ],
                              ),
                              Column(

                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: CustomizedTextWidget(
                                        title: '+',
                                        fontSize: 20,
                                        fontColor: defaultDarkBlue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CustomizedTextWidget(
                                    title: '242',
                                   fontSize: 18, 
                                   fontColor: Colors.grey,
                                    fontWeight: FontWeight.normal),


                                     TextButton(onPressed: (){},
                                   child: CustomizedTextWidget(
                                    title: '-',
                                    fontSize: 20, 
                                    fontColor: defaultDarkBlue, 
                                    fontWeight: FontWeight.bold)
                                     ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
            ), 
              SizedBox(height: 10,),
       Column(children: [ 
              Container(
              // color: Colors.white,
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
            SizedBox(height: 15,),
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
  ),
             ],
           )
       ],)
          ],
        ),
      ),
    );
  }
}
