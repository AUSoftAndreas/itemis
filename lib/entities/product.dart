import 'package:itemis/entities/origin.dart';
import 'package:itemis/entities/vat.dart';

/// One product in our catalog
class Product {
  /// Constructs one product
  /// - name: Name of the product
  /// - vat: The VAT related information of the product
  /// - origin: The origin of the product
  /// - price: The price of the product (net, in centicents)
  Product({
    this.name,
    this.vat = const FullVat(),
    this.origin = const DomesticOrigin(),
    this.price = 0,
  });

  /// The name of the product
  final String? name;

  /// The VAT related information of the product
  final Vat vat;

  /// The origin of the product
  final Origin origin;

  /// The price of the product (net, in centicents)
  final int price;

  /// The VAT rate of the product
  int get vatRate => vat.vatRate;

  /// The import duty applicable for the product
  int get importDuty => origin.importDuty;
}
