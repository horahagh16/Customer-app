class Food {
  String name;
  String details;
  double price;
  String category;
  bool exist = true;

  void isExist() {
    exist = !exist;
  }

  Food(String name, String details, double price, String category) {
    this.name = name;
    this.details = details;
    this.price = price;
    this.category = category;
    this.exist = true;
  }
}