import 'package:itemis/entities/origin.dart';
import 'package:itemis/entities/product.dart';
import 'package:itemis/entities/vat.dart';
import 'package:test/test.dart';

void main() {
  test('Product can be instantiated', () {
    final product = Product();
    expect(product, isA<Product>());
  });

  test('An instantiated product has a name associated with it', () {
    final product = Product(name: 'Hello world');
    expect(product.name, isA<String>());
    expect(product.name, 'Hello world');
  });

  test('An instantiated product has a VAT object associated with it', () {
    final product = Product();
    expect(product.vat, isA<Vat>());
  });

  test('An instantiated product has a VAT rate which we can read', () {
    final product = Product();
    expect(product.vatRate, isA<int>());
  });

  test('Full rate is 10% (=1000) (just exemplary)', () {
    final product = Product(vat: FullVat());
    expect(product.vatRate, 1000);
  });

  test('Product has an origin and standard origin is domestic', () {
    final product = Product();
    expect(product.origin, isA<Origin>());
    expect(product.origin, isA<DomesticOrigin>());
  });

  test('Product can be instantiated with international origin too', () {
    final product = Product(origin: InternationalOrigin());
    expect(product.origin, isA<Origin>());
    expect(product.origin, isA<InternationalOrigin>());
  });

  test('The import duty can be read and is of the expected values', () {
    final productDefault = Product();
    final productDomestic = Product(origin: DomesticOrigin());
    final productInternational = Product(origin: InternationalOrigin());
    expect(productDefault.importDuty, 0);
    expect(productDomestic.importDuty, 0);
    expect(productInternational.importDuty, 500);
  });

  test('Product does have a price', () {
    final product = Product();
    expect(product.price, isA<int>());
  });
}
