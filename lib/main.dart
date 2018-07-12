import 'package:flutter/material.dart';
import 'dart:async';
import 'package:untitled1/register/register_screen.dart';
import 'package:untitled1/home_screen.dart';
import 'package:untitled1/welcome/intro_screen.dart';
import 'package:untitled1/splash/splash_screen.dart';
import 'package:untitled1/login/login_screen.dart';
import 'package:untitled1/fogotpass/fogot_password.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      title: 'Flutter Demo',
      home:  SplashScreen(),
      routes: <String,WidgetBuilder>{
        '/LoginScreen': (BuildContext context) => new LoginScreen(),
        '/WelcomeScreen': (BuildContext context) => new WelcomeScreen(),
        '/HomeScreen': (BuildContext context) => new HomeScreen(),
        '/ForgotPass': (BuildContext context) => new ForgotPass(),
        '/Register': (BuildContext context) => new Register(),
      },
//      home: LoginScreen(),
    );
  }
}

