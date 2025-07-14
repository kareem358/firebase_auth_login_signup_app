import 'package:flutter/material.dart';

import '../../widgets/round_button.dart';

class VerifyCodeScreen extends StatefulWidget {
 final String verificationId;
  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final codeController=TextEditingController();
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
          SizedBox(height: 50,),
          // we have to get details how to verify our code that will be sent automatically
          TextFormField(
            controller: codeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '6 digit code',
              labelText: 'Code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
          )
          ),
          SizedBox(height: 50,),

          RoundButton(title: "Verify", onTap: (){}, )
        ],
      ),
    );
  }
}
