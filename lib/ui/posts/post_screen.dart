import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_csplash_login/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

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
        title: Text("Post Screen",style: TextStyle(fontSize: 22,)),
        centerTitle: true,
        actions: [

            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                auth.signOut().then((_) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (route) => false, // Removes all previous routes
                  );
                }).catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout failed: ${e.toString()}')),
                  );
                });
              },
            ),

         /* IconButton(onPressed: (){
            auth.signOut().then(value){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreen(),));
            }
          },
              icon: Icon(Icons.logout))*/
        ],
      ) ,
      body: Center(
        child: Text("Post Screen",style: TextStyle(fontSize: 22),),
      )
    );
  }
}
