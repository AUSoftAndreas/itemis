import 'package:itemis/entities/cart.dart';
import 'package:itemis/entities/cart_item.dart';
import 'package:itemis/entities/origin.dart';
import 'package:itemis/entities/product.dart';
import 'package:itemis/entities/vat.dart';
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
    final productA = Product(priceNet: 1000000, vat: FullVat(), origin: DomesticOrigin());
    final productB = Product(priceNet: 2000000, vat: ReducedVat(), origin: InternationalOrigin());
    final cartItemA = CartItem(product: productA, quantity: 2);
    final cartItemB = CartItem(product: productB, quantity: 3);
    expect(cart.items.length, 0);
    cart.add(cartItemA);
    cart.add(cartItemB);
    expect(cart.items.length, 2);
    expect(cartItemA.priceNet, 2000000);
    expect(cartItemA.vatValue, 200000);
    expect(cartItemA.importDutyValue, 0);
    expect(cartItemA.priceGross, 2200000);
    expect(cartItemB.priceNet, 6000000);
    expect(cartItemB.vatValue, 300000);
    expect(cartItemB.importDutyValue, 300000);
    expect(cartItemB.priceGross, 6600000);
    expect(cart.priceNet, 8000000);
    expect(cart.vatValue, 500000);
    expect(cart.importDutyValue, 300000);
    expect(cart.priceGross, 8800000);
  });
}
