

import 'dart:async';

import 'package:flutter/material.dart';

import '../ui/auth/login_screeen.dart';

class SplashService{
   void isLogin(BuildContext context){

      Future<void> isLogin(BuildContext context) async {
         await Future.delayed(const Duration(seconds: 2)); // splash delay
         // your login check logic here (e.g. using SharedPreferences or FirebaseAuth)
      }

      Timer(Duration (seconds: 2), (){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      });
   }
}