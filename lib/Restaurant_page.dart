import 'package:flutter/cupertino.dart';
import 'package:snappfood_app/modals/Order.dart';
import 'package:snappfood_app/modals/Orders.dart';
import 'package:snappfood_app/modals/Restaurants.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:snappfood_app/colors_program.dart';
import 'package:snappfood_app/screens/loginScreen.dart';

class Restaurant_page extends StatefulWidget {
  @override
  _Restaurant_pageState createState() => _Restaurant_pageState();
}

class _Restaurant_pageState extends State<Restaurant_page> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(Restaurants.getRestaurants().elementAt(index).name),
        backgroundColor: bar,
      ),
      body: Container(
        child: Column(
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
              Restaurants.getRestaurants().elementAt(index).kind.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Customers.getCustomers()
                        .elementAt(Global_index)
                        .favorites
                        .contains(
                        Restaurants.getRestaurants().elementAt(index))
                        ? Icon(
                      Icons.favorite,
                      color: Colors.pinkAccent,
                    )
                        : Icon(
                      Icons.favorite_border,
                      color: Colors.pinkAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        if (Customers.getCustomers()
                            .elementAt(Global_index)
                            .favorites
                            .contains(Restaurants.getRestaurants()
                            .elementAt(index))) {
                          Customers.getCustomers()
                              .elementAt(Global_index)
                              .favorites
                              .remove(Restaurants.getRestaurants()
                              .elementAt(index));
                        } else {
                          Customers.getCustomers()
                              .elementAt(Global_index)
                              .favorites
                              .add(Restaurants.getRestaurants()
                              .elementAt(index));
                        }
                      });
                    }),
                FlatButton.icon(
                  icon: Icon(Icons.message),
                  label: Text('Comments'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/Comment_page",
                        arguments: index);
                  },
                ),
                FlatButton.icon(
                  icon: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  label: Text(Restaurants.getRestaurants()
                      .elementAt(index)
                      .star
                      .toString()),
                  onPressed: () {
                    setState(() {
                      Restaurants.getRestaurants().elementAt(index).stars(1);
                    });
                  },
                ),
              ],
            ),
            Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(
                      Restaurants.getRestaurants().elementAt(index).menu.length,
                          (index1) {
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
                                      "assets/images/back.png",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            Restaurants.getRestaurants()
                                                .elementAt(index)
                                                .menu
                                                .elementAt(index1)
                                                .name,
                                            style: TextStyle(color: bar, fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(Restaurants.getRestaurants()
                                              .elementAt(index)
                                              .menu
                                              .elementAt(index1)
                                              .category),
                                          Text(Restaurants.getRestaurants()
                                              .elementAt(index)
                                              .menu
                                              .elementAt(index1)
                                              .details),
                                          Text("Price: " +
                                              Restaurants.getRestaurants()
                                                  .elementAt(index)
                                                  .menu
                                                  .elementAt(index1)
                                                  .price
                                                  .toString() +
                                              " T\n"),
                                          FlatButton.icon(
                                            icon: Icon(Icons.shopping_cart),
                                            label: Text("Add to shop cart"),
                                            onPressed: () {
                                              Customers.getCustomers()
                                                  .elementAt(Global_index)
                                                  .add_order(OrderDetails(
                                                  Restaurants.getRestaurants()
                                                      .elementAt(index)
                                                      .name,
                                                  Restaurants.getRestaurants()
                                                      .elementAt(index)
                                                      .menu
                                                      .elementAt(index1)
                                                      .name,
                                                  Restaurants.getRestaurants()
                                                      .elementAt(index)
                                                      .menu
                                                      .elementAt(index1)
                                                      .category,
                                                  Restaurants.getRestaurants()
                                                      .elementAt(index)
                                                      .address,
                                                  Orders().make_random_code(),
                                                  Restaurants.getRestaurants()
                                                      .elementAt(index)
                                                      .menu
                                                      .elementAt(index1)
                                                      .price));
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }
}