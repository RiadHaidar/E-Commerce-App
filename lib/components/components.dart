



import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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