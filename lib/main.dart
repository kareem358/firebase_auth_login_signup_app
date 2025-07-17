import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_csplash_login/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'logIn',
     theme: ThemeData(
       //primarySwatch: Colors.purple,
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       useMaterial3: true,
     ),
     // theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),),
      home: SplashScreen(),
    );
  }
}


