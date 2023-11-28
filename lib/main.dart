import 'package:flutter/material.dart';
import 'package:shared_preference/homePage.dart';
import 'package:shared_preference/login.dart';
import 'package:shared_preference/newpage.dart';
import 'package:shared_preference/signup.dart';
import 'package:shared_preference/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: SplashScreen(),
     routes: {
       'signup':(context)=>SignupScreen(),
       'login':(context)=>LoginScreen(),
       'home':(context)=>HomePage()
     },
   );
  }
}
