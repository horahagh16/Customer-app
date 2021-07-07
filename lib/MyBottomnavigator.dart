import 'package:flutter/material.dart';
import 'package:snappfood_app/colors_program.dart';

class MyBottomnavigator extends StatefulWidget {
  @override
  _MyBottomnavigatorState createState() => _MyBottomnavigatorState();
}

class _MyBottomnavigatorState extends State<MyBottomnavigator> {
  int currentTabIndex = 1;

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void switch_pages() {
    int index = currentTabIndex;
    switch (index) {
      case 2:
        Navigator.pushNamed(context, "/Orders");
        break;
      case 1:
        Navigator.pushNamed(context, "/Mainpage");
        break;
      case 0:
        Navigator.pushNamed(context, "Shop");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: bar,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (index) {
        switch (index) {
          case 2:
            Navigator.pushNamed(context, "/Orders");
            break;
          case 1:
            Navigator.pushNamed(context, "/Mainpage");
            break;
          case 0:
            Navigator.pushNamed(context, "Shop");
            break;
        }
      },
      currentIndex: currentTabIndex,
      items: [
        BottomNavigationBarItem(
          title: Text('Shop'),
          icon: Icon(Icons.shopping_cart),
        ),
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Orders'),
          icon: Icon(Icons.library_books),
        ),
      ],
    );
  }
}