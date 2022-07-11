import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/components/components.dart';
import 'package:shoppingapp/screens/loginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class boardingModel {
  late String title;
  late String subTitle;
  late String image;
  boardingModel(
      {required this.title, required this.subTitle, required this.image});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();

  List<boardingModel> boardingScreens = [
    boardingModel(
      title: 'Purchase Items Online',
      subTitle:'Select and memorize your fufute purchases with smart online shopping cart',

      image: 'images/on1.png',
    ),
    boardingModel(
      title: 'Sales and Gifts',
      subTitle:
'Holiday sales, Birthday gifts, Various choices and catagories',      image: 'images/on2.png',
    ),
    boardingModel(
      title: 'Client Review',
      subTitle:
'Honest feedback from our clients, Happy Clients- Happy ys',      image: 'images/on3.png',
    ),
  ];

  void changeIndex(index){

    boardingScreens[index];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
       
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemBuilder: ((context, index) =>
                  onBoardingScreenBuilder(boardingScreens[index])),
              itemCount: boardingScreens.length,
            ),
          ),
          Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {
                    navigateTo(context, LoginScreen());
                  },
                  child: Text(
                    'let\'s go shopping',
                    style: TextStyle(color: Color.fromARGB(255, 103, 110, 163)),
                  ),
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 180, 215, 235))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {

                         controller.previousPage(
                            duration:
                             Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Previous',
                        style: TextStyle(color: Color(0xff363B64)),
                      )),
                  SmoothPageIndicator(
                    controller: controller,
                    count: boardingScreens.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: Color(0xff363B64),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                    if(controller.page == 2){
 navigateTo(context, LoginScreen());
}else{
                         controller.nextPage(
                            duration:
                             Duration(milliseconds: 400),
                            curve: Curves.easeOut);

}
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Color(0xff363B64),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

Widget onBoardingScreenBuilder(boardingModel bModel) => Column(
       mainAxisAlignment: MainAxisAlignment.center,
       
        children: [
          
            Flexible(
              child: Image(
               fit: BoxFit.cover,
                height: 300,
                image: AssetImage('${bModel.image}'),
              ),
            ),
           SizedBox(
            height: 15,
          ),
      
         Text(
              bModel.title,
                 textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                  color: Color(0xff363B64),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          SizedBox(
            height: 15,
          ),
          Text(
            bModel.subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300),
          ),
        ]);
