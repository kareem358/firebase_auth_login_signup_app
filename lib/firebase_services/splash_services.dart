
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firestore/firestore_list_screen.dart';
import '../ui/auth/login_screen.dart';
import '../ui/posts/post_screen.dart';

class SplashService {
   void isLogin(BuildContext context) {
      final user = FirebaseAuth.instance.currentUser;

      Timer(const Duration(seconds: 2), () {
         if (user != null) {
            // already logged in
            Navigator.pushReplacement(
               context,
               //now for firestore instead of working with PostScreen user
               // will be redirected to the FireStoreScreen
               MaterialPageRoute(builder: (_) => const FireStoreScreen()),
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
