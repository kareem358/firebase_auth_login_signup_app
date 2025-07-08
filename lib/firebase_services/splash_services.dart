

import 'dart:async';

import 'package:flutter/material.dart';

import '../ui/auth/login_screeen.dart';

class SplashService{
   void isLogin(BuildContext context){

      Timer(Duration (seconds: 3), (){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      });
   }
}