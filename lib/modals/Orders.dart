import 'package:snappfood_app/modals/Order.dart';
import 'dart:math';

class Orders {
  static List<OrderDetails> orders = List.empty(growable: true);

  static void add(OrderDetails order) {
    orders.add(order);
  }

  List<OrderDetails> getOrders() {
    return orders;
  }

  int make_random_code() {
    Random r = new Random();
    int num = ((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));
    return num;
  }
}