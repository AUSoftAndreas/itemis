import 'dart:developer';

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
    this.shelfPrice,
  });

  /// The name of the product
  final String? name;

  /// The VAT related information of the product
  final Vat vat;

  /// The origin of the product
  final Origin origin;

  /// The price of the product (net, in centicents)
  final int? shelfPrice;

  /// The VAT rate of the product (in 100th %)
  int get vatRate => vat.vatRate;

  /// The VAT value of the product (in Euro centicents)
  int get vatValue {
    final withoutRounding = (shelfPrice ?? 0) * vatRate ~/ 10000;
    final withRounding = withoutRounding % 500 != 0 ? (withoutRounding ~/ 500) * 500 + 500 : withoutRounding;
    return withRounding;
  }

  /// The import duty applicable for the product
  int get importDutyRate => origin.importDutyRate;

  /// The import duty value for the product
  int get importDutyValue {
    final withoutRounding = (shelfPrice ?? 0) * importDutyRate ~/ 10000;
    log('withoutRounding: $withoutRounding');
    final withRounding = withoutRounding % 500 != 0 ? (withoutRounding ~/ 500) * 500 + 500 : withoutRounding;
    log('Zwischenergebnis: ${withoutRounding % 500}');
    log('withRounding: $withRounding');
    return withRounding;
  }

  /// The net price of the product (in Euro centicents)
  int get priceNet => (shelfPrice ?? 0) - vatValue;
}
