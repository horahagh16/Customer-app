import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:snappfood_app/screens/loginScreen.dart';

class comment extends StatefulWidget {
  @override
  _commentState createState() => _commentState();
}

class _commentState extends State<comment> {
  TextEditingController answer;

  List<String> Answer = List.empty(growable: true);

  @override
  void initState() {
    answer = TextEditingController();
    super.initState();
  }

  void dispose() {
    answer.dispose();
    super.dispose();
  }

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
        title: Text('Manage comments'),
      ),
      body: ListView.builder(
          itemCount:
          Customers.customers.elementAt(Global_index).My_comments.length,
          itemBuilder: (context, int ind) {
            return GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text(Customers.customers
                      .elementAt(Global_index)
                      .My_comments
                      .elementAt(ind)
                      .text),
                  trailing: Column(
                    children: [
                      RaisedButton(
                        child: Text(
                          "ANSWER",
                          style: TextStyle(color: Colors.white),
                        ),
                        disabledColor: Color(0xff7f1019),
                        color: Color(0xff7f1019),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.all(5),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                bottom: 30),
                                            child: Text(Customers.customers
                                                .elementAt(Global_index)
                                                .My_comments
                                                .elementAt(ind)
                                                .answer),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                  tileColor: Color(0xfff5f5f5),
                ),
              ),
            );
          }),
    );
  }
}