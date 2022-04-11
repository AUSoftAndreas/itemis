import 'package:test/test.dart';

void main() {
  test('We can instantiate a cart item', () {
    final cartItem = CartItem(product: Product());
    expect(cartItem, isA<CartItem>());
    expect(cartItem.quantity, 1);
    expect(cartItem.importDuty, isA<int>());
    expect(cartItem.vatRate, isA<int>());
  });
}
