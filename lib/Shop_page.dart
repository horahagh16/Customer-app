import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:snappfood_app/MyBottomnavigator.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/colors_program.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:snappfood_app/screens/loginScreen.dart';

class Shop_page extends StatefulWidget {
  @override
  _Shop_pageState createState() => _Shop_pageState();
}

class _Shop_pageState extends State<Shop_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: bar,
      ),
      bottomNavigationBar: MyBottomnavigator(),
      body: Container(
        child: ListView(
          children: List.generate(
              Customers.getCustomers().elementAt(Global_index).orders.length,
                  (index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: bar,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: GestureDetector(
                        child: Row(
                          children: [
                            /*ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                      child: Image.asset(
                        "assets/images/back.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),*/
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      Customers.customers
                                          .elementAt(Global_index)
                                          .orders
                                          .elementAt(index)
                                          .getResName(),
                                      style: TextStyle(color: bar, fontSize: 20),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      Customers.customers
                                          .elementAt(Global_index)
                                          .orders
                                          .elementAt(index)
                                          .getName(),
                                      style: TextStyle(color: bar, fontSize: 16),
                                    ),
                                    Text(Customers.customers
                                        .elementAt(Global_index)
                                        .orders
                                        .elementAt(index)
                                        .date
                                        .toString()),
                                    Text(Customers.customers
                                        .elementAt(Global_index)
                                        .orders
                                        .elementAt(index)
                                        .getAddress()),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Price: " +
                                        Customers.customers
                                            .elementAt(Global_index)
                                            .orders
                                            .elementAt(index)
                                            .price
                                            .toString() +
                                        " T\n"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlatButton.icon(
                                      icon: Icon(Icons.delete),
                                      label: Text('Delete'),
                                      onPressed: () {
                                        setState(() {
                                          Customers.customers
                                              .elementAt(Global_index)
                                              .orders
                                              .removeAt(index);
                                        });
                                      },
                                    ),
                                    FlatButton.icon(
                                      icon: Icon(
                                        Icons.shop,
                                        color: Colors.green,
                                      ),
                                      label: Text('Continue'),
                                      onPressed: () {
                                        setState(() {
                                          if (Customers.customers
                                              .elementAt(Global_index)
                                              .wallet >=
                                              Customers.customers
                                                  .elementAt(Global_index)
                                                  .orders
                                                  .elementAt(index)
                                                  .price) {
                                            Customers.customers
                                                .elementAt(Global_index)
                                                .decreaseWallet(Customers.customers
                                                .elementAt(Global_index)
                                                .orders
                                                .elementAt(index)
                                                .price);
                                            Customers.customers
                                                .elementAt(Global_index)
                                                .orders
                                                .elementAt(index)
                                                .setSent(true);
                                            Customers.customers
                                                .elementAt(Global_index)
                                                .previesOrders
                                                .add(Customers.customers
                                                .elementAt(Global_index)
                                                .orders
                                                .elementAt(index));
                                            Customers.customers
                                                .elementAt(Global_index)
                                                .orders
                                                .removeAt(index);
                                          } else {
                                            Navigator.pushNamed(
                                                context, "/Wallet_page");
                                          }
                                        });
                                      },
                                    ),
                                    FlatButton.icon(
                                      icon: Icon(
                                        Icons.assignment_returned,
                                        color: Colors.orange,
                                      ),
                                      label: Text('Discount'),
                                      onPressed: () {
                                        setState(() {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  padding: EdgeInsets.all(5),
                                                  child: SingleChildScrollView(
                                                    child: Container(
                                                      padding: EdgeInsets.all(5),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                left: 15,
                                                                right: 15,
                                                                bottom: 30),
                                                            child: TextField(
                                                              keyboardType:
                                                              TextInputType
                                                                  .multiline,
                                                              maxLines: null,
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            child: Text('continue'),
                                                            onPressed: () {
                                                              setState(() {
                                                                if (Customers.customers
                                                                    .elementAt(
                                                                    Global_index)
                                                                    .wallet >=
                                                                    (Customers.customers
                                                                        .elementAt(
                                                                        Global_index)
                                                                        .orders
                                                                        .elementAt(
                                                                        index)
                                                                        .price *
                                                                        0.5)) {
                                                                  Customers.customers
                                                                      .elementAt(
                                                                      Global_index)
                                                                      .decreaseWallet(Customers
                                                                      .customers
                                                                      .elementAt(
                                                                      Global_index)
                                                                      .orders
                                                                      .elementAt(
                                                                      index)
                                                                      .price *
                                                                      0.5);
                                                                  Customers.customers
                                                                      .elementAt(
                                                                      Global_index)
                                                                      .orders
                                                                      .elementAt(index)
                                                                      .setSent(true);
                                                                  Customers.customers
                                                                      .elementAt(
                                                                      Global_index)
                                                                      .previesOrders
                                                                      .add(Customers
                                                                      .customers
                                                                      .elementAt(
                                                                      Global_index)
                                                                      .orders
                                                                      .elementAt(
                                                                      index));
                                                                  Customers.customers
                                                                      .elementAt(
                                                                      Global_index)
                                                                      .orders
                                                                      .removeAt(index);
                                                                } else {
                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      "/Wallet_page");
                                                                }
                                                                Navigator.pop(context);
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

void addOrder(String name, String item, String code, String price, String date,
    int index) async {
  await Socket.connect('10.0.2.2', 1381).then((serverSocket) {
    print('connected for add order');

    String order = "AddOrder_C-" +
        index.toString() +
        "-" +
        name +
        "-" +
        item +
        "-" +
        code +
        "-" +
        price +
        "-" +
        date;
    serverSocket.writeln(order);
  });
}