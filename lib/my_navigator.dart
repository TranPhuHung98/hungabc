import 'package:flutter/material.dart';
import 'package:untitled1/home_screen.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/HomeScreen");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/LoginScreen");
  }

  static void goToWelcome(BuildContext context) {
    Navigator.pushNamed(context, "/WelcomeScreen");
  }

  static void goToFogotPass(BuildContext context) {
    Navigator.pushNamed(context, "/ForgotPass");
  }

  static void goToRegister(BuildContext context) {
    Navigator.pushNamed(context, "/Register");
  }
  static goAnother(context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomeScreen()))
    .then((value)=>value) ;
  }

}