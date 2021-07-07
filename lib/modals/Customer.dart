import 'package:snappfood_app/modals/Restaurant.dart';
import 'package:snappfood_app/modals/Order.dart';
import 'package:snappfood_app/modals/comment.dart';

class Customer {
  String name;
  String lastname;
  List<String> address = List.empty(growable: true);
  String phoneNumber;
  String password;
  List<Restaurant> favorites = List.empty(growable: true);
  List<int> favorites_index = List.empty(growable: true);
  List<Comment> My_comments = List.empty(growable: true);

  List<OrderDetails> orders = List.empty(growable: true);
  List<OrderDetails> previesOrders = List.empty(growable: true);
  double wallet = 0;

  Customer(String name, List<String> address, String lastname,
      String phone_number, String password) {
    this.name = name;
    this.address = address;
    this.lastname = lastname;
    this.phoneNumber = phone_number;
    this.password = password;
  }

  String getName() {
    return name;
  }

  List getAddress() {
    return address;
  }

  Comment getComment(int index) {
    return My_comments.elementAt(index);
  }

  String getLastname() {
    return lastname;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  String getPassword() {
    return password;
  }

  void add_favorite(Restaurant r1) {
    favorites.add(r1);
  }

  List<Restaurant> getFavoriets() {
    return favorites;
  }

  void add_favorite_index(int index1) {
    favorites_index.add(index1);
  }

  List<int> getFavoriets_index() {
    return favorites_index;
  }

  double getWallet() {
    return wallet;
  }

  void increaseWallet(int inc) {
    this.wallet += inc;
  }

  void decreaseWallet(double dec) {
    wallet -= dec;
  }

  void add_order(OrderDetails order) {
    orders.add(order);
  }

  List<OrderDetails> getOrders() {
    return orders;
  }
}