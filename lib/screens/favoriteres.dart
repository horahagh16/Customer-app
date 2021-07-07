import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:snappfood_app/modals/Restaurant.dart';
import 'package:snappfood_app/modals/Restaurants.dart';
import '../colors_program.dart';
import 'package:snappfood_app/screens/loginScreen.dart';

class MyFavorite extends StatefulWidget {
  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
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
          title: Text("Favorite"),
        ),
        body: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: List.generate(
                  Customers.customers.elementAt(Global_index).getFavoriets().length,
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
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                child: Image.asset(
                                  "assets/images/orders.jpg",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                Customers.customers
                                    .elementAt(Global_index)
                                    .getFavoriets()
                                    .elementAt(index)
                                    .getName(),
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          onTap: () {
                            int page = 0;
                            for (Restaurant res in Restaurants.restaurants) {
                              if (res.name.startsWith(
                                Customers.customers
                                    .elementAt(Global_index)
                                    .getFavoriets()
                                    .elementAt(index)
                                    .getName(),
                              )) {
                                page = Restaurants.restaurants.indexOf(res);
                              }
                            }
                            Navigator.pushNamed(context, "/RestaurantPage",
                                arguments: page);
                          },
                        ),
                      ),
                    );
                  }),
            )));
  }
}