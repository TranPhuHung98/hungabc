import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled1/my_navigator.dart';

//import 'package:untitled1/login/login_screen.dart';
//import 'package:flutter_search_bar/flutter_search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}
enum Answer{YES,NO,MAYBE}
class _HomeScreenState extends State<HomeScreen> {
  String _answer = '';
  setAnswer(String value){
    setState(() {
      _answer = value;
    });
  }

  Future<Null> _dialog() async {
    await showDialog(
        context: context,
        child: SimpleDialog(
          title: Text(''),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: (){Navigator.pop(context);},
//              child: Text('abc'),
            )
          ],
        )
    );
    }

//  SearchBar searchBar;
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//  void onSubmitted(String value) {
//    setState(() => _scaffoldKey.currentState
//        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
//  }
//  _HomeScreenState() {
//    searchBar = new SearchBar(
//        inBar: false,
//        buildDefaultAppBar: buildAppBar,
//        setState: setState,
////        onSubmitted: onSubmitted
//    );
//  }
//  AppBar buildAppBar(BuildContext context) {
//    return new AppBar(
//        title: new Text('Search Bar Demo'),
//        actions: [searchBar.getSearchAction(context)]);
//  }
  final search = TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          hintText: 'Nhập email đăng kí',
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)))
  );

  final GoogleSignIn googleSignIn = new GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), iconSize: 40.0, onPressed: (){_dialog();}),
          IconButton(
              icon: Icon(Icons.shopping_cart), iconSize: 40.0, onPressed: null),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Trần Phú Hưng'),
              accountEmail: Text('naiheo123@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('H'),
              ),
            ),
            ListTile(
              title: Text(
                'Đăng nhập',
                style: TextStyle(height: 0.0, fontSize: 20.0),
              ),
              onTap: () => MyNavigator.goToLogin(context),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              title: Text('Đăng kí',
                  style: TextStyle(height: 0.0, fontSize: 20.0)),
              onTap: () => MyNavigator.goToRegister(context),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(
              height: 0.0,
            ),
            ListTile(
//              leading: Icon(icon),
              title: Text('Ẩm thực',
                  style: TextStyle(height: 0.0, fontSize: 15.0)),
              onTap: null,
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              title: Text('Làm đẹp',
                  style: TextStyle(height: 0.0, fontSize: 15.0)),
              onTap: null,
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              title: Text('Du lịch',
                  style: TextStyle(height: 0.0, fontSize: 15.0)),
              onTap: null,
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              title: Text('Giải trí',
                  style: TextStyle(height: 0.0, fontSize: 15.0)),
              onTap: null,
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
              color: Colors.green,
              padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
              height: 40.0,
              child: Text('Đăng xuất'),
              onPressed: () {
                googleSignIn.signOut();
                MyNavigator.goToLogin(context);
              }),
        ),
      ),
    );
  }
}
