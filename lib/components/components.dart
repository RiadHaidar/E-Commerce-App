



import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppingapp/components/shared_values.dart';
import 'package:shoppingapp/models/homeModel/homeModel.dart';

import '../cubit/shopCubit/shopCubit.dart';
import '../cubit/shopCubit/shopStates.dart';
import '../models/categoriesModel/categoriesModel.dart';

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


bool isEdit = false;
String editText = 'Edit';
void editPressed({
  required context,
  required email,
  required name,
  required phone,
})
{
  isEdit =! isEdit;
  if(isEdit) {
    editText = 'Save';
    ShopCubit.get(context).emit(EditPressedState());
  } else {
    editText = 'Edit';
    ShopCubit.get(context).updateProfileData(
        email: email,
        name: name,
        phone: phone
    );
  }

}
Color defaultBackgroundColor = Color(0xffDBF0F8);
Future<bool?> showToast({ 
 required String message, 
 required Color backGroundColor, 

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

void pop (context) {
  Navigator.pop(context);
}



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


