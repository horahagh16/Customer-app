import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:snappfood_app/modals/Food.dart';
import 'package:snappfood_app/Comment_page.dart';
import 'package:snappfood_app/Main_page.dart';
import 'package:snappfood_app/Order_page.dart';
import 'package:snappfood_app/Shop_page.dart';
import 'package:snappfood_app/modals/Restaurants.dart';
import 'package:snappfood_app/modals/Restaurant.dart';
import 'package:snappfood_app/Restaurant_page.dart';
import 'package:snappfood_app/modals/Customer.dart';
import 'package:snappfood_app/screens/loginScreen.dart';
import 'package:snappfood_app/screens/wallet.dart';
import 'package:snappfood_app/screens/comments.dart';
import 'dart:io';

void main() {
  Customers.customers.add(Customer("Narges dehghan", ["String address"],
      "String lastname", "09126215452", "dfghjkl.;/"));
  Restaurants.add(
      Restaurant("Farsi", 'dolat', ["iranian"], "09123456789", "abc1234"));
  Restaurants.restaurants
      .elementAt(0)
      .menu
      .add(Food("kabab koubide", "beef", 800000, "main course"));
  Restaurants.add(Restaurant(
      "Perperook", 'pasdaran', ["fastfood"], "09121234567", "def1234"));
  Restaurants.add(
      Restaurant("Nayeb", 'niavaran', ["iranian"], "09121231212", "ghi1234"));

  Restaurants.restaurants
      .elementAt(1)
      .menu
      .add(Food("French fries", "potato", 10000, "dessert"));
  Restaurants.restaurants
      .elementAt(1)
      .menu
      .add(Food("Caesar salad", "chicken,lettuce,...", 40000, "all"));
  Restaurants.restaurants
      .elementAt(2)
      .menu
      .add(Food("Mashroom soup", "chicken,mashroom,...", 40000, "appetiezer"));
  send("Customer connected");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/Mainpage": (context) => Main_page(),
        "/Comments": (context) => comment(),
        "/Drawer": (context) => Drawer(),
        "Shop": (context) => Shop_page(),
        "/RestaurantPage": (context) => Restaurant_page(),
        "/Wallet_page": (context) => wallet(),
        "/Orders": (context) => Order_page(),
        "/Comment_page": (context) => Comment_page(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: PopupDialog(),
    );
  }
}

void send(String farman) async {
  await Socket.connect('10.0.2.2', 1381).then((serverSocket) {
    print('connected');
    serverSocket.writeln(farman);
  });
}

Future<String> receipt(String farman) async {
  await Socket.connect('10.0.2.2', 1381).then((serverSocket) {
    print('connected to server');
    serverSocket.writeln(farman);
    serverSocket.listen((socket) {
      String answer = String.fromCharCodes(socket).trim();
      print(answer);
      return answer;
    });
  });
}

String R_name(int index) {
  return receipt("Find_Restaurant-" + index.toString() + "-Name:").toString();
}

String Find_menu(int index, int index1, String kind) {
  receipt("Find_Menu-" +
      index.toString() +
      "-" +
      index1.toString() +
      "-" +
      kind)
      .toString();
}

String Find_order(int index, int index1, String kind) {
  receipt("Find_Order-" +
      index.toString() +
      "-" +
      index1.toString() +
      "-" +
      kind)
      .toString();
}

int Find_wallet(int index) {
  String temp =
  receipt("Find_Customer-" + index.toString() + "-" + "Wallet:").toString();
  return int.tryParse(temp);
}

int Find_size(String kind, int index) {
  return int.tryParse(receipt(kind + index.toString()).toString());
}
