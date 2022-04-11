import 'package:itemis/entities/cart_item.dart';
import 'package:itemis/entities/product.dart';

class Cart {
  List<CartItem> items = [];

  void add(CartItem cartItem) {
    items.add(cartItem);
  }

  void remove(CartItem cartItem) {
    items.remove(cartItem);
  }
}
