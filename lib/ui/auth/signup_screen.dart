

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_csplash_login/widgets/round_button.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool loading =false;
  var emailController = TextEditingController();
  var passwordController= TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Sign Up", style: TextStyle(fontSize: 22,
            color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(key: _formKey,
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                  validator: (value){
                    if (value!.isEmpty){
                      return "enter your email";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock_open),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                  validator: (value){
                    if (value!.isEmpty){
                      return "enter your password";
                    }
                    return null;
                  },
                ),
              ),

            ],)),

          SizedBox(height: 30,),
          RoundButton(title: "Sign Up",
            loading: loading,
            /*onTap: () async {
            if (_formKey.currentState!.validate()) {
              setState(() {
                loading = true;
              });
              try {
                await _auth.createUserWithEmailAndPassword(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                // You can navigate or show success toast here
                Utils.toastMessage("User registered successfully");
              } catch (error) {
                Utils.toastMessage(error.toString());
              }
            }
          },*/
            onTap: () async{
           login();
          }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Login"))
            ],
          )
        ],

      ),
    );
  }

  Future<void> login() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        loading = true;
      });
      await _auth.createUserWithEmailAndPassword(email: emailController.text.toString(),
          password: passwordController.text.toString()).then((value){
        Utils.toastMessage("User registered successfully");
        setState(() {
          loading = false;
        });
        // Navigator.pop(context);
      }).onError((error, stackTrace){
        // print(error.toString());
        Utils.toastMessage(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  }
}
