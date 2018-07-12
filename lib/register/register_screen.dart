import 'package:flutter/material.dart';
import 'package:untitled1/my_navigator.dart';
import 'package:flutter/foundation.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => new RegisterState();
}

class RegisterState extends State<Register> {

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

    final email = TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(Icons.perm_identity),
            hintText: 'Nhập email đăng kí',
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
        )
    );

    final password = TextField(
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock_outline),
          hintText: 'Nhập mật khẩu',
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final confirm = TextField(
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock_outline),
          hintText: 'Nhập lại mật khẩu',
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final registerButton = Padding(
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
            'Đăng kí tài khoản',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () {},
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ĐĂNG KÍ'),
        elevation: 0.0,
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            logo,
            SizedBox(height: 35.0),
            email,
            SizedBox(height: 20.0),
            password,
            SizedBox(height: 20.0),
            confirm,
            SizedBox(height: 30.0),
            registerButton
          ],
        ),
      )),
    );
  }
}
