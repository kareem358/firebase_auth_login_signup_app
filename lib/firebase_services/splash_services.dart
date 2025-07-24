
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/auth/login_screen.dart';
import '../ui/posts/post_screen.dart';

class SplashService {
   void isLogin(BuildContext context) {
      final user = FirebaseAuth.instance.currentUser;

      Timer(const Duration(seconds: 2), () {
         if (user != null) {
            // User is already logged in means having an account and logged in
            Navigator.pushReplacement(
               context,
               MaterialPageRoute(builder: (_) => const PostScreen()),
            );
         } else {
            // No user is logged in
            Navigator.pushReplacement(
               context,
               MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
         }
      });
   }
}




/*


import 'dart:async';

import 'package:flutter/material.dart';

import '../ui/auth/login_screen.dart';

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
}*/
