class OrderDetails {
  String restaurant_name;
  String item;
  DateTime date;
  int code;
  double price;
  String name;
  String address;
  bool sent = false;

  OrderDetails(String res_name, String name, String item, String address,
      int code, double price) {
    this.item = item;
    date = DateTime.now();
    this.code = code;
    this.price = price;
    this.name = name;
    this.address = address;
    restaurant_name = res_name;
  }

  void setSent(bool issent) {
    sent = issent;
  }

  String getResName() {
    return restaurant_name;
  }

  String getItem() {
    return item;
  }

  String getAddress() {
    return address;
  }

  void setAddress(String add) {
    address = add;
  }

  DateTime getDate() {
    return date;
  }

  String getName() {
    return name;
  }

  int getCode() {
    return code;
  }

  double getPrice() {
    return price;
  }
}