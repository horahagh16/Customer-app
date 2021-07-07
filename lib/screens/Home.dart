import 'package:flutter/material.dart';
import 'loginScreen.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: <Color>[
                    Color(0xff7f1019),
                    Color(0xffe62928),
                  ])),
        ),
        title: Text('Snapp food'),
        leading: Icon(Icons.restaurant_menu),
      ),
      body: PopupDialog(),
    );
  }
}