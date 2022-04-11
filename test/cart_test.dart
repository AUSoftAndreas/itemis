import 'package:itemis/entities/cart.dart';
import 'package:itemis/entities/cart_item.dart';
import 'package:itemis/entities/product.dart';
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
}
