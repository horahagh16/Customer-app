import 'package:flutter/cupertino.dart';
import 'package:snappfood_app/MyBottomnavigator.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/colors_program.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:snappfood_app/modals/Restaurants.dart';
import 'package:snappfood_app/modals/Restaurant.dart';
import 'package:snappfood_app/screens/favoriteres.dart';
import 'package:snappfood_app/screens/loginScreen.dart';
import 'package:snappfood_app/screens/opinion.dart';
import 'package:snappfood_app/screens/wallet.dart';

List<String> allNames = Restaurants.restaurantsName();

class Main_page extends StatefulWidget {
  @override
  _Main_pageState createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  int _selectedDestination = 0;

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text('Home'),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  })),
        ],
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: <Color>[
                        Color(0xffe62928),
                        Color(0xff7f1019),
                      ])),
              child: Center(
                  child: Text(
                    Customers.customers.elementAt(Global_index).name +
                        " " +
                        Customers.customers.elementAt(Global_index).lastname,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  )),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite restaurant'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavorite()));
              },
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('My opinions'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOpinion()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Increase wallet credit'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => wallet()));
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PopupDialog()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_circle),
        backgroundColor: Color(0xff7f1019),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PopupDialog()),
          );
        },
      ),
      bottomNavigationBar: MyBottomnavigator(),
      body: ListView(
        children: [
          Container(
            child: Column(children: [
              Padding(padding: EdgeInsets.all(5)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    ActionChip(
                      label: Text('FastFood'),
                      onPressed: () {},
                      shadowColor: Colors.greenAccent,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    ActionChip(
                      label: Text('Iranian Food'),
                      onPressed: () {},
                      shadowColor: Colors.greenAccent,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    ActionChip(
                      label: Text('Italian Food'),
                      onPressed: () {},
                      shadowColor: Colors.greenAccent,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    ActionChip(
                      label: Text('SeaFood'),
                      onPressed: () {},
                      shadowColor: Colors.greenAccent,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    ActionChip(
                      label: Text('Vegetarian'),
                      onPressed: () {},
                      shadowColor: Colors.greenAccent,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    ActionChip(
                      label: Text('Others'),
                      onPressed: () {},
                      shadowColor: Colors.greenAccent,
                    ),
                  ],
                ),
              ),
              Text(
                "\nThe Best",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children:
                    List.generate(Restaurants.getRestaurants().length, (index) {
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
                                  Restaurants.getRestaurants()
                                      .elementAt(index)
                                      .getName(),
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/RestaurantPage",
                                  arguments: index);
                            },
                          ),
                        ),
                      );
                    }),
                  )),
              Text(
                "Near",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children:
                    List.generate(Restaurants.getRestaurants().length, (index) {
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
                                  Restaurants.getRestaurants()
                                      .elementAt(index)
                                      .getName(),
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/RestaurantPage",
                                  arguments: index);
                            },
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

class CustomSearchDelegate extends SearchDelegate {
  var suggestion = Restaurants.restaurantsName();
  List<String> searchResult = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult.clear();
    searchResult =
        allNames.where((element) => element.startsWith(query)).toList();
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(suggestion.length, (index) {
            var item = suggestion[index];
            return Card(
              color: Colors.white,
              child: Container(padding: EdgeInsets.all(16), child: Text(item)),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? suggestion
        : allNames.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index];
          } else {
            int page = 0;
            for (Restaurant res in Restaurants.restaurants) {
              if (res.name.startsWith(query)) {
                page = Restaurants.restaurants.indexOf(res);
              }
            }
            Navigator.pushNamed(context, "/RestaurantPage", arguments: page);
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Color(0xff727272)),
                  )
                ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}