import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
 final String verificationId;
  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Verify Code", style: TextStyle(fontSize: 24,
            color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          // we have to get details how to verify our code that will be sent automatically

        ],
      ),
    );
  }
}
