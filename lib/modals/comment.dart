import 'package:snappfood_app/modals/Customer.dart';

class Comment {
  bool accept = false;
  String text = '';
  String answer = 'Not Answered Yet...';
  Customer customer;

  Comment(String text, Customer customer) {
    this.text = text;
    this.customer = customer;
  }

  void answerIt(String s) {
    answer = s;
  }

  void acceptIt() {
    accept = !accept;
  }
}