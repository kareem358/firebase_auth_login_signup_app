import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_csplash_login/ui/auth/verify_code.dart';
import 'package:firebase_csplash_login/widgets/round_button.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  final phoneNumberController=TextEditingController();
  bool loading=false ;
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Login",style: TextStyle(fontSize: 24,
            color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: '+92 300 1234567',
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
            ),
            SizedBox(height: 60,),
            RoundButton(title: "login", loading: loading, onTap: (){
              setState(() {
                loading=true;
              });
              auth.verifyPhoneNumber(
                phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){
                    setState(() {
                      loading=false;
                    });
                  },
                  verificationFailed: (e){
                    setState(() {
                      loading=false;
                    });
                    Utils.showErrorToast(e.message.toString());
                  },

                  codeSent: (String verificationId, int ? token){

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VerifyCodeScreen(verificationId: verificationId,),));
                  setState(() {
                    loading=false;
                  });
                  },
// with one need to enable some setting form the firebase both for android and ios as well
                  codeAutoRetrievalTimeout: (e){
                  Utils.showErrorToast(e.toString());
                  setState(() {
                    loading=false;
                  });
                  }

              );
            }),

        ],
        ),
      ),
    );
  }
}
