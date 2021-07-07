import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Restaurants.dart';

class Comment_page extends StatefulWidget {
  @override
  _Comment_pageState createState() => _Comment_pageState();
}

class _Comment_pageState extends State<Comment_page> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context).settings.arguments as int;
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
        title: Text('Comments'),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(children: [
              Padding(padding: EdgeInsets.all(5)),
              Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: List.generate(
                        Restaurants.getRestaurants()
                            .elementAt(index)
                            .comment
                            .length, (ind) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xff7f1019),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: GestureDetector(
                            child: Column(
                              children: [
                                Text(
                                  Restaurants.getRestaurants()
                                      .elementAt(index)
                                      .comment
                                      .elementAt(ind)
                                      .text,
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  Restaurants.getRestaurants()
                                      .elementAt(index)
                                      .comment
                                      .elementAt(ind)
                                      .answer,
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}