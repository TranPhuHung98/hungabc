import 'package:flutter/material.dart';
import 'package:untitled1/my_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
// import 'package:flutter_facebook_connect/flutter_facebook_connect.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:untitled1/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  // FacebookConnect _connect;


 void _loginFB() async{
   var fbLogin = FacebookLogin();
   var result = await FacebookLogin().logInWithReadPermissions(['email','public_profile']);
  //  FirebaseUser user = await _auth.signInWithFacebook(accessToken: result.accessToken.token);
   switch(result.status){
     case FacebookLoginStatus.loggedIn:
       _auth.signInWithFacebook(accessToken: result.accessToken.token);
       break;
     case FacebookLoginStatus.cancelledByUser:
       print("FB bi cancelled");
       break;
     case FacebookLoginStatus.error:
       print('bi loi roi');
       break;

   }
 }

//  Future<Null> _dialog() async {
//    await showDialog(
//        context: context,
//        child: SimpleDialog(
//          title: Text(''),
//          children: <Widget>[
//            SimpleDialogOption(
//              onPressed: (){Navigator.pop(context);},
////              child: Text('abc'),
//            )
//          ],
//        )
//    );
//  }

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
//    print('User name HUNGAAAAAAA: ${user.displayName}');
//    MyNavigator.goToHome(context);
    MyNavigator.goAnother(context);
    return user;
  }

//  void startFBlogin() async {
//    var fblogin = new FacebookLogin();
//    var result = await fblogin.logInWithReadPermissions(['email', 'public_profile']);
//    switch(result.status){
//      case FacebookLoginStatus.loggedIn:
//        FirebaseAuth.instance.signInWithFacebook(accessToken: result.accessToken.token);
//        break;
//      case FacebookLoginStatus.error:
//        print("FB sign in failed");break;
//      case FacebookLoginStatus.cancelledByUser:
//        print('FB sign in cancelled by user');break;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/logo_bd.png'),
      ),
    );

    final emailTF = TextField(
//        keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final passwordTF = TextField(
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock_outline),
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
//        shadowColor: Colors.blue,
//        elevation: 5.0,
        child: MaterialButton(
          color: Colors.green,
          minWidth: 200.0,
          height: 42.0,
          highlightColor: Colors.grey,
          child: Text(
            'ĐĂNG NHẬP',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () {
//            Scaffold.of(context).showSnackBar(
//                SnackBar(content: Text('Tài khoản hoặc mật khẩu không đúng')));
          },
        ),
      ),
    );

//    final register = FlatButton(
//      child: Text(
//        'Chưa có tài khoản?',
//        style: TextStyle(color: Colors.black26),
//      ),
//      onPressed: () {
//        MyNavigator.goToRegister(context);
////        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Register()));
//      },
//    );

    final forgotPass = FlatButton(
      padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
      child: Text(
        'Quên mật khẩu?',
        style: TextStyle(color: Colors.black26),
      ),
      onPressed: () {
        MyNavigator.goToFogotPass(context);
      },
    );

    final loginOtherWaysButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
       FlatButton(
         child: Image.asset('images/facebook.png'),
         onPressed: () {
           _loginFB();
         },
       ),

        // new FacebookLoginButton(
        //     appId: '<APP_ID>',
        //     clientSecret: '<CLIENT_SECRET>',
        //     scope: [FacebookAuthScope.publicProfile],
        //     cookie: false,
        //     onConnect: (api, token) {
        //       _connect = api;
        //       print(token);
        //       setState(() {});
        //     }),
       FlatButton(
         child: Image.asset('images/twitter.png'),
         onPressed: () {},
       ),
        FlatButton(
          child: Image.asset('images/google.png'),
          onPressed: () {
            _signIn()
                .then((FirebaseUser user) => print(user))
                .catchError((e) => print(e));
//            MyNavigator.goToHome(context);
          },
        ),
      ],
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập nà <3'),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30.0),
            logo,
            SizedBox(height: 40.0),
            emailTF,
            SizedBox(height: 10.0),
            passwordTF,
            SizedBox(height: 10.0),
            forgotPass,
            loginButton,
            SizedBox(height: 10.0),
            loginOtherWaysButton,
          ],
        ),
      )),
    );
  }
}
