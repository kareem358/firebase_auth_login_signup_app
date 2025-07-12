import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Post Screen",style: TextStyle(fontSize: 22,)),
        centerTitle: true,
      ) ,
      body: Center(
        child: Text("Post Screen",style: TextStyle(fontSize: 22),),
      )
    );
  }
}
