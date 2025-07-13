import 'package:flutter/material.dart';
class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  final phoneNumberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body:  Column(
        children: [
          SizedBox(height: 30,),
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(

            ),
          )
],
      ),
    );
  }
}
