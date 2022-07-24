


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/components/shared_values.dart';

import '../../components/components.dart';
import '../../cubit/shopCubit/shopCubit.dart';
import '../../cubit/shopCubit/shopStates.dart';


class ProfileScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state) {
       
      },
      builder: (context,state)
      {
        ShopCubit cubit =  ShopCubit.get(context);
        var model = cubit.userModel;
        nameController.text = model.data.name;
        phoneController.text =model.data.phone;

        return  SingleChildScrollView(
          
            physics: BouncingScrollPhysics(),
            child: Container(padding: EdgeInsets.all(8),
              //color: Colors.grey[300] ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10,
                    vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome ${cubit.userModel.data.name.split(' ').elementAt(0)}',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: defaultDarkBlue, ),),
                        Text('${cubit.userModel.data.email}',
                        
                        style: TextStyle(fontSize: 15 , 
                        
                        color: defaultDarkBlue, 
                        ),
                        
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 280,
                    padding: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children :
                        [
                          if(state is UpdateProfileLoadingState)
                            Column(
                              children: [
                                LinearProgressIndicator(),
                                SizedBox(height: 20,),
                              ],
                            ),
                          Row(
                            children: [
                              Text('PERSONAL INFORMATION',style: 
                              TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold, color: defaultDarkBlue, ),),
                              Spacer(),
                              TextButton(
                                  onPressed: ()
                                  {
                                    editPressed(
                                        context: context,
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        email: cubit.userModel.data.email
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit,color: Colors.grey,size: 15,),
                                      SizedBox(width: 5,),
                                      Text('$editText',style: TextStyle(color: Colors.grey),),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),

                          Text('Name',style: TextStyle(
                            fontSize: 15,  color: defaultDarkBlue, ),),
                          defaultFormField(
                              controller: nameController,
                              context: context,
                              prefix: Icons.person,
                            //  enabled: isEdit ? true:false,
                              validate: (value){}
                          ),
                          SizedBox(height: 40,),
                          Text('Phone',style: TextStyle(
                            fontSize: 15,  color: defaultDarkBlue, ),),
                          defaultFormField(
                              context: context,
                              controller: phoneController,
                              prefix: Icons.phone,
                              //enabled: isEdit ? true:false,
                              validate: (value){}
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    color: Colors.white,
                    width: double.infinity,

                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SECURITY INFORMATION',style: TextStyle(
                          fontSize: 15,fontWeight: FontWeight.bold,  color: defaultDarkBlue, ),),
                        SizedBox(height: 5,),
                        OutlinedButton(
                            onPressed: (){
                              // navigateTo(context,
                              // ChangePasswordScreen());
                            },
                            child: Text('Change Password')
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:200)
                ],
              ),
            ),
          
        );
      },
    );  }
}
