import 'package:itemis/entities/cart_item.dart';
import 'package:itemis/entities/product.dart';

class Cart {
  List<CartItem> items = [];

  get priceNet => items.fold<int>(0, (previousValue, element) => previousValue + element.priceNet);

  get vatValue => items.fold<int>(0, (previousValue, element) => previousValue + element.vatValue);

  get importDutyValue => items.fold<int>(0, (previousValue, element) => previousValue + element.importDutyValue);

  void add(CartItem cartItem) {
    items.add(cartItem);
  }

  void remove(CartItem cartItem) {
    items.remove(cartItem);
  }
}
