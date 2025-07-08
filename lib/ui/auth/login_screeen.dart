
import 'package:flutter/material.dart';

import '../../widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        //Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Login", style: TextStyle(fontSize: 20,
            color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(key: _formKey,
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        // obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Email",
                          //helperText: "Enter Your Email  e.g tech@gmail.com",
                          hintText: "Enter your email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surfaceVariant,
                        ),
                      validator: (value){
                          if(value!.isEmpty){
                            return "enter your email";
                          }
                          return null;
                      },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Your Password",
                            prefixIcon: Icon(Icons.password_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            )

                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "enter your password";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ) ),


            SizedBox(
              height: 11,
            ),
            RoundButton(title: "Login",
            onTap: () {
              if(_formKey.currentState!.validate()) {
                /*Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );*/
              }
            },
            ),
          ],
        ),
      ),
    );
  }
}
