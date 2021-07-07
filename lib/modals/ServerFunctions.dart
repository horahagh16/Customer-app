import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class read {
  List<String> _customers = [];

  Future<List<String>> _loadcustomers() async {
    List<String> customers1 = [];
    await rootBundle.loadString('path/to/customers.txt').then((q) {
      for (String i in LineSplitter().convert(q)) {
        customers1.add(i);
      }
    });
    return customers1;
  }

  String getCustomerName(int index) {
    List<String> temp = _customers[index].split(",,");
    String name = temp[0];
  }

  String getCustomerLastName(int index) {
    List<String> temp = _customers[index].split(",,");
    String name = temp[1];
  }

  String getCustomerAddress(int index) {
    List<String> temp = _customers[index].split(",,");
    String name = temp[0];
  }

  String getCustomerPhoneNumber(int index) {
    List<String> temp = _customers[index].split(",,");
    String name = temp[3];
  }

  String getCustomerPass(int index) {
    List<String> temp = _customers[index].split(",,");
    String name = temp[4];
  }
}