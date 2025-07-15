import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_csplash_login/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Post Screen",style: TextStyle(
          fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold,)),
        centerTitle: true,
        actions: [

            IconButton(

              onPressed: () {
                auth.signOut().then((value){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen(),));
                }).onError((error,stackTrace){
                  Utils.showErrorToast(error.toString());
                });
                },
               icon: Icon(Icons.logout, color: Colors.white,),
               ),

                /*auth.signOut().then((value) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()),
                        (route) => false, // Removes all previous routes
                  );
                }).catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout failed: ${e.toString()}')),
                  );
                });*/


        
        ],
      ) ,
      floatingActionButton: FloatingActionButton(onPressed: (){

      },
      child: Icon(Icons.add, color: Colors.deepPurple,),),
      body: Center(
        child: Text("Post Screen",style: TextStyle(fontSize: 22),),
      )
    );
  }
}
