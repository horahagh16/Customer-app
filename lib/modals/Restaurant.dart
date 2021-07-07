import 'Customer.dart';
import 'Food.dart';
import 'package:snappfood_app/modals/comment.dart';
import 'package:snappfood_app/modals/supportArea.dart';

class Restaurant {
  String name;
  String address;
  List kind = List.empty(growable: true);
  String phoneNumber;
  String password;
  List<Comment> comment = [
    Comment(
        "It tasted very bad...",
        Customer("Narges", ["String address"], "Dehghan", "09126215452",
            "dfghjkl.;/")),
    Comment(
        "The food was hot and arrived on time,thanks",
        Customer("Narges", ["String address"], "Dehghan", "09126215452",
            "dfghjkl.;/"))
  ];
  List<Food> menu = List.empty(growable: true);
  double star = 0;
  int sta = 0;
  int count = 0;
  String supportArea;
  int sold_number = 0;
  double sold_sum = 0;

  Restaurant(String name, String address, List kind, String phoneNumber,
      String password) {
    this.name = name;
    this.address = address;
    this.kind = kind;
    this.phoneNumber = phoneNumber;
    this.password = password;
  }

  String getName() {
    return name;
  }

  String getAddress() {
    return address;
  }

  List getKind() {
    return kind;
  }

  String getArea() {
    return Area.getAreas();
  }

  void setArea() {
    this.supportArea = Area.getAreas();
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  Comment getComment(int index) {
    return comment.elementAt(index);
  }

  String getPassword() {
    return password;
  }

  void stars(int star) {
    count++;
    sta += star;
    this.star = sta / count;
  }

  void increase_SoldAmount(double price1) {
    this.sold_sum += price1;
  }

  void increase_SoldNumber() {
    this.sold_number += 1;
  }

  double getSoldAmount() {
    return sold_sum;
  }

  int getSoldNumber() {
    return sold_number;
  }
}