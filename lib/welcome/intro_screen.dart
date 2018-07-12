import 'package:flutter/material.dart';
import 'package:untitled1/my_navigator.dart';
import 'package:untitled1/welcome/walkthrough.dart';

class WelcomeScreen extends StatefulWidget{

  @override
  WelcomeScreenState createState() {
    return WelcomeScreenState();
  }
}
class WelcomeScreenState extends State<WelcomeScreen>{
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 4) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 8,
            child: PageView(
              children: <Widget>[
                WalkThrough(
                  title: "CEO",
                  content: "CEO\n Trần Hữu Bệnh",
                  image: 'images/ceo.png',
                ),
                WalkThrough(
                  title: "Android",
                  content: "Android\n Văn Thiện Pro",
                  image: 'images/android.png',
                ),
                WalkThrough(
                  title: "IOS",
                  content: "IOS\n Phước Vip Pro",
                  image: 'images/ios.png',
                ),
                WalkThrough(
                  title: "Flutter",
                  content: "Flutter\n Trai đẹp",
                  image: 'images/flutter.jpg',
                ),
                WalkThrough(
                  title: "Web - PHP",
                  content: "Web - PHP",
                  image: 'images/web.png',
                )
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(lastPage ? "" : "SKIP",
                      style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0)),
                      onPressed: () =>
                      lastPage ? null : MyNavigator.goToLogin(context),
                  ),
                  FlatButton(
                    child: Text(lastPage ? "GOT IT" : "NEXT",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    onPressed: () => lastPage ? MyNavigator.goToLogin(context) : controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn),
                  )
                ]
            )
          )
        ],
      ),
    );
  }

}