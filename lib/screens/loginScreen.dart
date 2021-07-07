import 'dart:io';
import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Customer.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:snappfood_app/Main_page.dart';
import 'package:snappfood_app/modals/Global.dart';

int Global_index = 0;

class PopupDialog extends StatefulWidget {
  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  bool is_alreadyused(String number, List<Customer> list) {
    bool status = false;
    for (Customer cust in list) {
      if (cust.phoneNumber.contains(number)) status = true;
    }
    return status;
  }

  String validatePassword(String pass) {
    String pattern = r'^(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,}$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(pass)) {
      return 'invalid password';
    } else
      return null;
  }

  bool is_passCorrect(String number, String pass, List<Customer> list) {
    bool status = false;
    for (Customer cust in list) {
      if (cust.phoneNumber.contains(number) && cust.password.contains(pass))
        status = true;
    }
    return status;
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  int phone_number;

  List<String> addresses = List.empty(growable: true);
  TextEditingController pass;
  TextEditingController phoneNumber;
  TextEditingController CustomerName;
  TextEditingController CustomerLastName;
  TextEditingController address;
  TextEditingController address1;
  TextEditingController address2;
  TextEditingController address3;

  @override
  void initState() {
    pass = TextEditingController();
    phoneNumber = TextEditingController();
    CustomerName = TextEditingController();
    CustomerLastName = TextEditingController();
    address = TextEditingController();
    address1 = TextEditingController();
    address2 = TextEditingController();
    address3 = TextEditingController();
    super.initState();
  }

  void dispose() {
    phoneNumber.dispose();
    pass.dispose();
    address.dispose();
    address1.dispose();
    address2.dispose();
    address3.dispose();
    CustomerName.dispose();
    CustomerLastName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: IconButton(
                  onPressed: () => _onAlertButtonsPressed(context),
                  icon: Icon(Icons.restaurant_menu),
                  color: Colors.red,
                  iconSize: 100,
                  disabledColor: Colors.white),
              shape: CircleBorder(),
            ),
            Text("\nTAP TO ENJOY",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30)),
          ],
        ),
      ),
    );
  }

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Already have an account?",
      buttons: [
        DialogButton(
          child: Text(
            "LOGIN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => _onAlertWithCustomContentPressed2(context),
          gradient: LinearGradient(colors: [
            Color(0xff00FF00),
            Color.fromRGBO(0, 179, 134, 1.0),
          ]),
        ),
        DialogButton(
          child: Text(
            "REGISTER",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => _onAlertWithCustomContentPressed(context),
          gradient: LinearGradient(colors: [
            Colors.green[900],
            Colors.greenAccent[400],
          ]),
        )
      ],
    ).show();
  }

  _onAlertWithCustomContentPressed(context) {
    Alert(
        context: context,
        title: "REGISTER",
        content: Column(
          children: <Widget>[
            TextField(
              controller: CustomerName,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                ),
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: CustomerLastName,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                ),
                labelText: 'LastName',
              ),
            ),
            TextFormField(
              controller: phoneNumber,
              validator: (String value) {
                if (is_alreadyused(phoneNumber.text, Customers.customers)) {
                  return 'this number was taken';
                }
                return null;
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.phone,
                  color:
                  phoneNumber.text.length != 11 ? Colors.red : Colors.grey,
                ),
                labelText: 'Phone Number',
                errorText: is_alreadyused(phoneNumber.text, Customers.customers)
                    ? 'this number is not valid or it was taken'
                    : null,
              ),
            ),
            TextField(
              controller: pass,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: validatePassword(pass.text),
                  suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _toggle();
                          if (Navigator.canPop(context)) {
                            _onAlertWithCustomContentPressed(context);
                          }
                        });
                      }),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )),
            ),
            TextField(
              controller: address,
              decoration: InputDecoration(
                fillColor: Colors.deepOrangeAccent[400],
                icon: Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                labelText: 'address',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            RaisedButton(
              child: Text("add more address"),
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
                                    controller: address1,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 30),
                                  child: TextField(
                                    controller: address2,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 30),
                                  child: TextField(
                                    controller: address3,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(),
                                  ),
                                ),
                                ElevatedButton(
                                  child: Text('Done'),
                                  onPressed: () {
                                    setState(() {
                                      addresses.add(address.text);
                                      addresses.add(address1.text);
                                      addresses.add(address2.text);
                                      addresses.add(address3.text);
                                    });
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            )
          ],
        ),
        buttons: [
          DialogButton(
              gradient: LinearGradient(colors: [
                Color(0xff00FF00),
                Color.fromRGBO(0, 179, 134, 1.0),
              ]),
              child: Text(
                "SIGN UP",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                if (validatePassword(pass.text) == null &&
                    phoneNumber != null &&
                    pass != null &&
                    address != null &&
                    phoneNumber.text.length == 11 &&
                    !is_alreadyused(phoneNumber.text, Customers.customers)) {
                  setState(() {
                    addCustomer(CustomerName.text, CustomerLastName.text,
                        phoneNumber.text, pass.text, addresses.toString());
                    Customers.add(Customer(CustomerName.text, addresses,
                        CustomerLastName.text, phoneNumber.text, pass.text));
                    Global_index = Customers.getCustomers().length - 1;
                    CustomerName.clear();
                    phoneNumber.clear();
                    address.clear();
                    address.clear();
                    address1.clear();
                    address2.clear();
                    address3.clear();
                    pass.clear();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main_page()),
                  );
                } else {
                  if (Navigator.canPop(context)) {
                    _onAlertWithCustomContentPressed(context);
                  }
                }
              }),
          DialogButton(
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => _onAlertWithCustomContentPressed2(context),
            gradient: LinearGradient(colors: [
              Colors.green[900],
              Colors.greenAccent[400],
            ]),
          ),
        ]).show();
  }

  _onAlertWithCustomContentPressed2(context) {
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextFormField(
              controller: phoneNumber,
              decoration: InputDecoration(
                  labelText: 'Phone Number',
                  errorText:
                  !is_alreadyused(phoneNumber.text, Customers.customers)
                      ? 'this number not exist'
                      : null,
                  icon: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  )),
              onSaved: (String value) {
                phone_number = int.parse(value);
              },
              validator: (String value) {
                if (int.parse(value) is int == false) {
                  return "please enter numbers";
                }
                if (is_alreadyused(phoneNumber.text, Customers.customers)) {
                  return "this number not exist";
                }
                if (phone_number.toString().length != 11) {
                  return "please enter 11 numbers";
                }
                return null;
              },
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: is_passCorrect(
                      phoneNumber.text, pass.text, Customers.getCustomers())
                      ? null
                      : "incorrect",
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _toggle();
                        if (Navigator.canPop(context)) {
                          _onAlertWithCustomContentPressed2(context);
                        }
                      });
                    },
                  ),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )),
              obscureText: _obscureText,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              if (is_passCorrect(
                  phoneNumber.text, pass.text, Customers.getCustomers()) &&
                  phoneNumber.text != "") {
                for (Customer res in Customers.customers) {
                  if (res.phoneNumber.startsWith(phoneNumber.text)) {
                    setState(() {
                      Global_index = Customers.customers.indexOf(res);
                      Global().setIndexGlobal(Global_index);
                    });
                  }
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Main_page()),
                );
              } else {
                if (Navigator.canPop(context)) {
                  _onAlertWithCustomContentPressed2(context);
                }
              }
            },
            gradient: LinearGradient(colors: [
              Color(0xff00FF00),
              Color.fromRGBO(0, 179, 134, 1.0),
            ]),
          ),
          DialogButton(
            child: Text(
              "REGISTER",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => _onAlertWithCustomContentPressed(context),
            gradient: LinearGradient(colors: [
              Colors.green[900],
              Colors.greenAccent[400],
            ]),
          )
        ]).show();
  }
}

void addCustomer(String name, String lastname, String phone, String pass,
    String address) async {
  await Socket.connect('10.0.2.2', 1381).then((serverSocket) {
    print('connected for register');

    String order = "AddCustomer-" +
        name +
        "-" +
        lastname +
        "-" +
        phone +
        "-" +
        pass +
        "-" +
        address +
        "-" +
        " ";
    serverSocket.writeln(order);
  });
}
/*
void login(String phone, String pass,
    String s) async {
  await Socket.connect('10.0.2.2', 1381).then((serverSocket) {
    print('connected for register');
//find a customer
    String order = "find-" +
        name +
        "-" +
        phone +
        "-" +
        pass +
        "-" +
        address +
        "-" +
        lastname +
        "-" +
        " ";
    serverSocket.writeln(order);
  });
}*/