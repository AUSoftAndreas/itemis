import 'package:itemis/entities/origin.dart';
import 'package:itemis/entities/vat.dart';

class Product {
  Product({
    this.name,
    this.vat = const FullVat(),
    this.origin = const DomesticOrigin(),
  });

  final String? name;
  final Vat vat;
  final Origin origin;

  int get vatRate => vat.vatRate;
  int get importDuty => origin.importDuty;
}
