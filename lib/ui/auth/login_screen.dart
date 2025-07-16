
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_csplash_login/ui/auth/login__with_phone_number.dart';
import 'package:firebase_csplash_login/ui/auth/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/round_button.dart';
import '../posts/post_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  // Add this at the top of your _LoginScreenState class


// Add this helper method in your _LoginScreenState class
  String _getFriendlyError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found': return 'No account found with this email';
      case 'wrong-password': return 'Incorrect password';
      case 'invalid-email': return 'Please enter a valid email';
      case 'user-disabled': return 'This account has been disabled';
      case 'too-many-requests': return 'Too many attempts. Try again later';
      default: return 'Login failed: ${e.message}';
    }
  }

// Updated login method
  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);

      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          Utils.showSuccessToast("Login successful!");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PostScreen()),
          ).then((_) {
            debugPrint("Navigation to PostScreen completed");
          }).catchError((e) {
            debugPrint("Navigation failed: $e");
          });

        }
      } on FirebaseAuthException catch (e) {
        Utils.showErrorToast(_getFriendlyError(e));
        debugPrint("Login error: ${e.toString()}");
      } catch (e, stackTrace) {
        Utils.showErrorToast("An unexpected error occurred");
        debugPrint("Login error: $e\n$stackTrace");
      } finally {
        if (mounted) setState(() => loading = false);
      }
    }
  }
 /* void login() async {
    if (_formKey.currentState!.validate())
    {
      setState(() {
        loading = true; // Show loading indicator
      });

      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Success case
        if (userCredential.user != null) {
          Utils.showSuccessToast("Login successful!");
          // Navigate to home screen after successful login
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PostScreen(),));
        }
      } on FirebaseAuthException catch (e) {
        // Firebase-specific errors
        Utils.showErrorToast(_getFriendlyError(e));
      } catch (e) {
        // Generic errors
        Utils.showErrorToast("An unexpected error occurred");
        debugPrint(e.toString());
        // You can also log the error for developer debugging
      } finally {
        setState(() {
          loading = false; // Hide loading indicator
        });
      }
    }
  }*/

  /*void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading=true;
      });

     await _auth.signInWithEmailAndPassword(email: emailController.text.trim(),
          password: passwordController.text.trim()).then((value) {
        Utils.toastMessage(value.user!.email.toString());
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
      });
    }
  }*/

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Allow back button if there's somewhere to go back to
        if (Navigator.canPop(context)) {
          return true;
        }
        // Otherwise prevent closing app from login screen
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          //Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Login", style: TextStyle(fontSize: 22,
              color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                          height: 20,
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
                                prefixIcon: Icon(Icons.lock_open),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              filled: true,
                              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                  height: 30,
                ),
                RoundButton(title: "Login",
                onTap: () {
                  if(_formKey.currentState!.validate()) {
                    login();
                    loading = loading;

                  }
                },
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      SignUpScreen(),));
                    },
                        child: Text("Sign Up"))
          
                  ],
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginWithPhoneNumber()),
                    );
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.purpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.3),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Login with Phone Number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),
                ),


               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
