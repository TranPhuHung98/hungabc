import 'package:flutter/material.dart';
import 'package:untitled1/my_navigator.dart';

class ForgotPass extends StatefulWidget{
  @override
  ForgotPassState createState() => new ForgotPassState();
}

class ForgotPassState extends State<ForgotPass>{
  @override
  Widget build(BuildContext context) {

    final head = Text('''Nhập vào email, chúng tôi sẽ gửi mã xác nhận đến email của bạn.''',
      style: TextStyle(fontSize: 30.0),);

    final email = TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0)
            )
        )
    );

    final send = IconButton(
      icon: Icon(Icons.send),
      iconSize: 100.0,
      color: Colors.blue,
      onPressed: (){

      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            head,
            SizedBox(height: 20.0),
            email,
            SizedBox(height: 20.0),
            send
          ],
        ),
      ),
    );
  }

}