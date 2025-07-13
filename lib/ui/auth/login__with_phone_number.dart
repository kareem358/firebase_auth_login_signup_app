import 'package:firebase_auth/firebase_auth.dart';
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
        title: Text("Login"),
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextFormField(
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
            RoundButton(title: "login", onTap: (){
              auth.verifyPhoneNumber(
                phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){},
                  verificationFailed: (e){
                    Utils.showErrorToast(e.message.toString());
                  },

                  codeSent: (String verification, int ? token),

                  codeAutoRetrievalTimeout: (e){
                  Utils.showErrorToast(e.message.toString());
                  }

              );
            }),

        ],
        ),
      ),
    );
  }
}
