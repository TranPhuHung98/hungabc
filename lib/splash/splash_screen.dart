import 'package:flutter/material.dart';
import 'dart:async';
import 'package:untitled1/main.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();

}

class SplashScreenState extends State<SplashScreen>{

  startTime() async{
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  Future navigationPage()async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    int counter = (prefs.getInt('counter') ?? 0);
//    print('Pressed $counter times.');

//    if((prefs.getInt('counter'))==0){
        Navigator.of(context).pushReplacementNamed('/WelcomeScreen');
//        counter++;}
//    else
      Navigator.of(context).pushReplacementNamed('/HomeScreen');
//    print(counter);
//    await prefs.setInt('counter', counter);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/logo-stdiohue-1.png",),
      ),
    );
  }

}