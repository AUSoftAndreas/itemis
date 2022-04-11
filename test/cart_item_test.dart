import 'package:itemis/entities/cart_item.dart';
import 'package:itemis/entities/origin.dart';
import 'package:itemis/entities/product.dart';
import 'package:itemis/entities/vat.dart';
import 'package:test/test.dart';

void main() {
  test('We can instantiate a cart item', () {
    final cartItem = CartItem(product: Product());
    expect(cartItem, isA<CartItem>());
    expect(cartItem.quantity, 1);
    expect(cartItem.importDutyRate, isA<int>());
    expect(cartItem.vatRate, isA<int>());
  });

  test('Cart Item does have a net price', () {
    final product = Product(shelfPrice: 100000);
    final ci = CartItem(product: product, quantity: 2);
    expect(ci.priceNet, isA<int>());
    expect(ci.priceNet, 180000);
  });

  test('The VAT rate can be read and is of the expected values', () {
    final productDefault = Product();
    final productFull = Product(vat: FullVat());
    final productReduced = Product(vat: ReducedVat());
    final productNo = Product(vat: NoVat());
    final ciDefault = CartItem(product: productDefault);
    final ciFull = CartItem(product: productFull);
    final ciReduced = CartItem(product: productReduced);
    final ciNo = CartItem(product: productNo);
    expect(ciDefault.vatRate, 1000);
    expect(ciFull.vatRate, 1000);
    expect(ciReduced.vatRate, 500);
    expect(ciNo.vatRate, 0);
  });

  test('Cart item have a VAT value of expected value', () {
    final product = Product(shelfPrice: 1000000); // 100 Euro
    final productFull = Product(shelfPrice: 1000000, vat: FullVat());
    final productReduced = Product(shelfPrice: 1000000, vat: ReducedVat());
    final productNo = Product(shelfPrice: 1000000, vat: NoVat());
    final ci = CartItem(product: product, quantity: 2);
    final ciFull = CartItem(product: productFull, quantity: 2);
    final ciReduced = CartItem(product: productReduced, quantity: 2);
    final ciNo = CartItem(product: productNo, quantity: 2);
    expect(ci.vatValue, 200000); // 10 Euro
    expect(ciFull.vatValue, 200000); // 10 Euro
    expect(ciReduced.vatValue, 100000); // 5 Euro
    expect(ciNo.vatValue, 0);
  });

  test('The import duty reate can be read and is of the expected values', () {
    final productDefault = Product();
    final productDomestic = Product(origin: DomesticOrigin());
    final productInternational = Product(origin: InternationalOrigin());
    final ciDefault = CartItem(product: productDefault, quantity: 2);
    final ciDomestic = CartItem(product: productDomestic, quantity: 2);
    final ciInternational = CartItem(product: productInternational, quantity: 2);
    expect(ciDefault.importDutyRate, 0);
    expect(ciDomestic.importDutyRate, 0);
    expect(ciInternational.importDutyRate, 500);
  });

  test('The import duty value can be read and is of the expected values', () {
    final productDefault = Product();
    final productDomestic = Product(origin: DomesticOrigin(), shelfPrice: 1000000);
    final productInternational = Product(origin: InternationalOrigin(), shelfPrice: 1000000);
    final ciDefault = CartItem(product: productDefault, quantity: 2);
    final ciDomestic = CartItem(product: productDomestic, quantity: 2);
    final ciInternational = CartItem(product: productInternational, quantity: 2);
    expect(ciDefault.importDutyValue, 0);
    expect(ciDomestic.importDutyValue, 0);
    expect(ciInternational.importDutyValue, 100000);
  });
}
