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

  test('Product does have a net price', () {
    final product = Product(priceNet: 10);
    expect(product.priceNet, isA<int>());
    expect(product.priceNet, 10);
  });

  test('The VAT can be read and is of the expected values', () {
    final productDefault = Product();
    final productFull = Product(vat: FullVat());
    final productReduced = Product(vat: ReducedVat());
    final productNo = Product(vat: NoVat());
    expect(productDefault.vatRate, 1000);
    expect(productFull.vatRate, 1000);
    expect(productReduced.vatRate, 500);
    expect(productNo.vatRate, 0);
  });

  test('Product does have a VAT value', () {
    final product = Product(priceNet: 1000000); // 100 Euro
    final productFull = Product(priceNet: 1000000, vat: FullVat());
    final productReduced = Product(priceNet: 1000000, vat: ReducedVat());
    final productNo = Product(priceNet: 1000000, vat: NoVat());
    expect(product.vatValue, 100000); // 10 Euro
    expect(productFull.vatValue, 100000); // 10 Euro
    expect(productReduced.vatValue, 50000); // 5 Euro
    expect(productNo.vatValue, 0);
  });

  test('The import duty reate can be read and is of the expected values', () {
    final productDefault = Product();
    final productDomestic = Product(origin: DomesticOrigin());
    final productInternational = Product(origin: InternationalOrigin());
    expect(productDefault.importDutyRate, 0);
    expect(productDomestic.importDutyRate, 0);
    expect(productInternational.importDutyRate, 500);
  });

  test('The import duty value can be read and is of the expected values', () {
    final productDefault = Product();
    final productDomestic = Product(origin: DomesticOrigin(), priceNet: 1000000);
    final productInternational = Product(origin: InternationalOrigin(), priceNet: 1000000);
    expect(productDefault.importDutyValue, 0);
    expect(productDomestic.importDutyValue, 0);
    expect(productInternational.importDutyValue, 50000);
  });

  test('Product does have a gross price', () {
    final product = Product(priceNet: 1000000);
    final productDomesticFull = Product(priceNet: 1000000, vat: FullVat(), origin: DomesticOrigin());
    final productDomesticReduced = Product(priceNet: 1000000, vat: ReducedVat(), origin: DomesticOrigin());
    final productDomesticNo = Product(priceNet: 1000000, vat: NoVat(), origin: DomesticOrigin());
    final productInternationalFull = Product(priceNet: 1000000, vat: FullVat(), origin: InternationalOrigin());
    final productInternationalReduced = Product(priceNet: 1000000, vat: ReducedVat(), origin: InternationalOrigin());
    final productInternationalNo = Product(priceNet: 1000000, vat: NoVat(), origin: InternationalOrigin());
    expect(product.priceGross, 1100000);
    expect(productDomesticFull.priceGross, 1100000);
    expect(productDomesticReduced.priceGross, 1050000);
    expect(productDomesticNo.priceGross, 1000000);
    expect(productInternationalFull.priceGross, 1150000);
    expect(productInternationalReduced.priceGross, 1100000);
    expect(productInternationalNo.priceGross, 1050000);
  });
}
