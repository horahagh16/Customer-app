import 'package:snappfood_app/modals/Order.dart';

class Shop_Cart {
  List<OrderDetails> shop = List.empty(growable: true);

  void add(OrderDetails order) {
    shop.add(order);
  }

  List<OrderDetails> getOrders() {
    return shop;
  }
}