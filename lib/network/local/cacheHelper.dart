import 'package:shared_preferences/shared_preferences.dart';



class CacheHelper{

  static late SharedPreferences sharedPreferences;

  static init() async{
  sharedPreferences = await SharedPreferences.getInstance( 

  );
  
  }

  static void put(String key, dynamic value){
if(value is bool) sharedPreferences.setBool(key, value); 
if(value is String) sharedPreferences.setString(key, value);
if(value is double) sharedPreferences.setDouble(key, value);
if(value is int) sharedPreferences.setInt(key, value);



 }

 static  get(String key ){
   return sharedPreferences.get(key);
  }




}