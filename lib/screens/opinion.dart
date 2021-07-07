import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'cdb.dart';
import 'loginScreen.dart';

class MyOpinion extends StatefulWidget {
  @override
  _MyOpinionState createState() => _MyOpinionState();
}

class _MyOpinionState extends State<MyOpinion> {
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
        title: Text("WHAT I SAID"),
      ),
      body: ListView(children: [
        Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: List.generate(
                  Customers.getCustomers()
                      .elementAt(Global_index)
                      .My_comments
                      .length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            Customers.getCustomers()
                                .elementAt(Global_index)
                                .My_comments
                                .elementAt(index)
                                .text,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBox(
                                title: "From restaurant",
                                descriptions: Customers.getCustomers()
                                    .elementAt(Global_index)
                                    .My_comments
                                    .elementAt(index)
                                    .answer,
                                //restaurant massage
                                text: "ok",
                              );
                            });
                      },
                    ),
                  ),
                );
              }),
            )),
      ]),
    );
  }
}