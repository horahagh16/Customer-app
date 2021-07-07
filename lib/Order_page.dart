import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:snappfood_app/modals/Restaurants.dart';
import 'package:snappfood_app/modals/comment.dart';
import 'package:snappfood_app/screens/loginScreen.dart';

class Order_page extends StatefulWidget {
  @override
  _Order_pageState createState() => _Order_pageState();
}

class _Order_pageState extends State<Order_page> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    MyStatefulWidget2(),
    MyStatefulWidget(),
    Text(
      'Index 1: Business',
    ),
  ];

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
        title: Text('Orders'),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Previous orders',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Active orders',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int ind) {
    //index++;
    return Item(
      headerValue: Customers.getCustomers()
          .elementAt(Global_index)
          .orders
          .elementAt(ind)
          .restaurant_name,
      expandedValue: Customers.getCustomers()
          .elementAt(Global_index)
          .orders
          .elementAt(ind)
          .item,
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(
      Customers.getCustomers().elementAt(Global_index).orders.length);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: buildPanel(),
      ),
    );
  }

  Widget buildPanel() {
    return ExpansionPanelList(
      dividerColor: Color(0xff7f1019),
      expandedHeaderPadding: EdgeInsets.all(3),
      expansionCallback: (int ind, bool isExpanded) {
        setState(() {
          _data[ind].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: Colors.lightGreenAccent[100],
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: Column(
              children: [
                Text('\n'),
                Text("Item: " +
                    Customers.getCustomers()
                        .elementAt(Global_index)
                        .orders
                        .elementAt(_data.indexOf(item))
                        .name +
                    "\n"),
                Text("code: " +
                    Customers.getCustomers()
                        .elementAt(Global_index)
                        .orders
                        .elementAt(_data.indexOf(item))
                        .code
                        .toString() +
                    "\n"),
                Text("Price: " +
                    Customers.getCustomers()
                        .elementAt(Global_index)
                        .orders
                        .elementAt(_data.indexOf(item))
                        .price
                        .toString() +
                    " T\n"),
                Text(Customers.getCustomers()
                    .elementAt(Global_index)
                    .orders
                    .elementAt(_data.indexOf(item))
                    .date
                    .toString()),
              ],
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<Item> generateItems2(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int ind) {
    return Item(
      headerValue: Customers.getCustomers()
          .elementAt(Global_index)
          .previesOrders
          .elementAt(ind)
          .restaurant_name,
      expandedValue: Customers.getCustomers()
          .elementAt(Global_index)
          .previesOrders
          .elementAt(ind)
          .item,
    );
  });
}

class MyStatefulWidget2 extends StatefulWidget {
  MyStatefulWidget2({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState2 createState() => _MyStatefulWidgetState2();
}

class _MyStatefulWidgetState2 extends State<MyStatefulWidget2> {
  TextEditingController comment;

  @override
  void initState() {
    comment = TextEditingController();
    super.initState();
  }

  void dispose() {
    comment.dispose();
    super.dispose();
  }

  List<Item> _data = generateItems2(
      Customers.getCustomers().elementAt(Global_index).previesOrders.length);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: buildPanel(),
      ),
    );
  }

  Widget buildPanel() {
    return ExpansionPanelList(
      dividerColor: Color(0xfff5f5f5),
      expandedHeaderPadding: EdgeInsets.all(3),
      expansionCallback: (int ind, bool isExpanded) {
        setState(() {
          _data[ind].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        int index = 0;
        for (int i = 0; i < Restaurants.restaurants.length; i++) {
          if (Customers.getCustomers()
              .elementAt(Global_index)
              .previesOrders
              .elementAt(_data.indexOf(item))
              .restaurant_name
              .startsWith(Restaurants.restaurants.elementAt(i).name)) {
            index = i;
            break;
          }
        }
        return ExpansionPanel(
          backgroundColor: Color(0xfffffdaf),
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: Column(
              children: [
                Text('\n'),
                Text("Item: " +
                    Customers.getCustomers()
                        .elementAt(Global_index)
                        .previesOrders
                        .elementAt(_data.indexOf(item))
                        .name +
                    "\n"),
                Text("code: " +
                    Customers.getCustomers()
                        .elementAt(Global_index)
                        .previesOrders
                        .elementAt(_data.indexOf(item))
                        .code
                        .toString() +
                    "\n"),
                Text("Price: " +
                    Customers.getCustomers()
                        .elementAt(Global_index)
                        .previesOrders
                        .elementAt(_data.indexOf(item))
                        .price
                        .toString() +
                    " T\n"),
                Text(Customers.getCustomers()
                    .elementAt(Global_index)
                    .previesOrders
                    .elementAt(_data.indexOf(item))
                    .date
                    .toString()),
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FlatButton.icon(
                            icon: Icon(
                              Icons.replay,
                              color: Colors.pink,
                            ),
                            label: Text("Reorder"),
                            onPressed: () {
                              setState(() {
                                Customers.getCustomers()
                                    .elementAt(Global_index)
                                    .orders
                                    .add(Customers.getCustomers()
                                    .elementAt(Global_index)
                                    .previesOrders
                                    .elementAt(_data.indexOf(item)));
                              });
                            },
                          ),
                        ])),
                RaisedButton(
                  child: Text(
                    "comment",
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
                                          left: 15, right: 15, bottom: 30),
                                      child: TextField(
                                        controller: comment,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                      ),
                                    ),
                                    ElevatedButton(
                                      child: Text('SEND'),
                                      onPressed: () {
                                        setState(() {
                                          Restaurants.getRestaurants()
                                              .elementAt(index)
                                              .comment
                                              .add(Comment(
                                              comment.text,
                                              Customers.customers.elementAt(
                                                  Global_index)));
                                          Customers.customers
                                              .elementAt(Global_index)
                                              .My_comments
                                              .add(Comment(
                                              comment.text,
                                              Customers.customers.elementAt(
                                                  Global_index)));
                                          Navigator.pop(context);
                                        });
                                      },
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
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}