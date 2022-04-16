import 'package:itemis/no1/entities/cart.dart';
import 'package:itemis/no1/entities/cart_item.dart';
import 'package:itemis/no1/entities/origin.dart';
import 'package:itemis/no1/entities/product.dart';
import 'package:itemis/no1/entities/vat.dart';
import 'package:test/test.dart';

void main() {
  test('Shopping cart can be instantiated', () {
    final cart = Cart();
    expect(cart, isA<Cart>());
  });

  test('Product can be added to cart', () {
    final cart = Cart();
    expect(cart.items, isEmpty);
    cart.add(CartItem(product: Product()));
    expect(cart.items.length, 1);
  });

  test('Product can be removed from cart', () {
    final cart = Cart();
    expect(cart.items, isEmpty);
    final product = Product();
    final cartItem = CartItem(product: product);
    expect(cart.items.length, 0);
    cart.add(cartItem);
    expect(cart.items.length, 1);
    cart.remove(cartItem);
    expect(cart.items.length, 0);
  });

  test('Combined case', () {
    final cart = Cart();
    final productA = Product(shelfPrice: 1000000, vat: const FullVat(), origin: const DomesticOrigin());
    final productB = Product(shelfPrice: 2000000, vat: const ReducedVat(), origin: const InternationalOrigin());
    final cartItemA = CartItem(product: productA, quantity: 2);
    final cartItemB = CartItem(product: productB, quantity: 3);
    expect(cart.items.length, 0);
    cart.add(cartItemA);
    cart.add(cartItemB);
    expect(cart.items.length, 2);
    expect(cartItemA.priceNet, 1800000);
    expect(cartItemA.vatValue, 200000);
    expect(cartItemA.importDutyValue, 0);
    expect(cartItemB.priceNet, 5700000);
    expect(cartItemB.vatValue, 300000);
    expect(cartItemB.importDutyValue, 300000);
    expect(cart.priceNet, 7500000);
    expect(cart.vatValue, 500000);
    expect(cart.importDutyValue, 300000);
  });

  test('Empty receipt is as expected', () {
    final cart = Cart();
    final receipt = cart.toReceipt();
    expect(receipt, 'Receipt\n========\n========\nSales Taxes: 0,00 €\nTotal: 0,00 €\n');
  });
}
