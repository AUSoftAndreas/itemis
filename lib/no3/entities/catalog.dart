/// Handles all price information for the materials we trade with
// ignore_for_file: prefer_final_fields

class Catalog {
  /// The Map containing all materials (as keys) and their price information
  Map<String, double> _prices = {};
  static final Catalog _instance = Catalog._();

  /// Singleton constructor
  factory Catalog() => _instance;

  /// Internal constructor to build the singleton instance
  Catalog._();

  /// Sets the price for a material [item] to [price]
  void setPrice(String item, double price) {
    _prices[item] = price;
  }

  /// Returns the price for a material [item]
  double getPrice(String item) => _prices[item] ?? 0;

  /// Resets all stored price information
  void reset() {
    _prices.clear();
  }
}
