import 'package:flutter/material.dart';
import 'package:snappfood_app/modals/Customers.dart';
import 'package:snappfood_app/modals/Global.dart';
import 'package:flutter/services.dart';
import 'package:snappfood_app/screens/loginScreen.dart';

class wallet extends StatefulWidget {
  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet> {
  TextEditingController increase_amount;
  int Increase_Amount;

  @override
  void initState() {
    increase_amount = TextEditingController();
    super.initState();
  }

  void dispose() {
    increase_amount.dispose();
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
          title: Text('Increase wallet credit'),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("YOU HAVE " +
                          Customers.customers
                              .elementAt(Global_index)
                              .wallet
                              .toString() +
                          " IN YOUR WALLET"),
                    ),
                    TextFormField(
                      controller: increase_amount,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      autovalidate: true,
                      //keyboardType: TextInputType.number,
                      keyboardType: TextInputType.number,
                      validator: (input) {
                        final isDigitsOnly = int.tryParse(input);
                        return isDigitsOnly == null
                            ? 'Input needs to be digits only'
                            : null;
                      },
                      /* onSaved: (String value) {
                      setState(() {
                        Increase_Amount = int.parse(value);
                      });
                    },*/
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            // Respond to button press

            setState(() {
              Customers.customers
                  .elementAt(Global_index)
                  .increaseWallet(int.parse(increase_amount.text.toString()));
              increase_amount.clear();
            });
          },
          child: Icon(Icons.add),
        ));
  }
}