class Area {
  static String areas = '';

  static void add(String area) {
    areas = areas + area + ',';
  }

  static String getAreas() {
    return areas;
  }

  static String deleter() {
    areas = '';
    return areas;
  }
}