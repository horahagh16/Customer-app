import 'Restaurant.dart';

class Restaurants {
  static List<Restaurant> restaurants = List.empty(growable: true);

  static void add(Restaurant restaurant) {
    restaurants.add(restaurant);
  }

  static List<Restaurant> getRestaurants() {
    return restaurants;
  }

  static List<String> restaurantsName() {
    List<String> name = [""];
    for (Restaurant res in restaurants) name.add(res.name);
    return name;
  }
}