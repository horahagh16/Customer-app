import 'package:snappfood_app/modals/Customer.dart';

class Customers {
  static List<Customer> customers = List.empty(growable: true);

  static void add(Customer customer) {
    customers.add(customer);
  }

  static List<Customer> getCustomers() {
    return customers;
  }
}