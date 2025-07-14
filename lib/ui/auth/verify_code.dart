import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/round_button.dart';
import '../posts/post_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
 final String verificationId;
  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final codeController=TextEditingController();
  final auth=FirebaseAuth.instance;
  bool loading =false;
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

          RoundButton(title: "Verify", loading: loading, onTap: () async{
         final credential= PhoneAuthProvider.credential(
             verificationId: widget.verificationId,
             smsCode: codeController.text.trim()
         );
         try{
           await auth.signInWithCredential(credential);
           Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => PostScreen(),));
         }catch(e){
       //    Utils.showErrorToast(e.toString());
         }

          /*  setState(() {
              loading = true;
            });
            final credential = PhoneAuthProvider.credential(
                verificationId: widget.verificationId,
                smsCode: codeController.text.trim());
            auth.signInWithCredential(credential).then((value) {
              setState(() {
                loading = false;
              });
            },);*/
          }
          ) ,
        ],
      ),
    );
  }
}
