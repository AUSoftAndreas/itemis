import 'package:itemis/entities/cart_item.dart';

/// Represents the entire cart of the user.
class Cart {
  /// Constructs one Cart.
  /// - [items]: The items in the cart. If no items are given, the cart is empty.
  Cart({List<CartItem>? items}) : items = items ?? [];

  /// The items in the cart.
  final List<CartItem> items;

  /// The total net price of the cart. Equals the sum of the net prices of all items.
  get priceNet => items.fold<int>(0, (previousValue, element) => previousValue + element.priceNet);

  /// The total VAT tax amaount of the cart. Equals the sum of the VAT amounts of all items.
  get vatValue => items.fold<int>(0, (previousValue, element) => previousValue + element.vatValue);

  /// The total import duty amaount of the cart. Equals the sum of the import duty amounts of all items.
  get importDutyValue => items.fold<int>(0, (previousValue, element) => previousValue + element.importDutyValue);

  /// Adds a [CartItem] to the cart.
  void add(CartItem cartItem) {
    items.add(cartItem);
  }

  /// Removes a [CartItem] from the cart.
  void remove(CartItem cartItem) {
    items.remove(cartItem);
  }

  String toReceipt() {
    final sb = StringBuffer();
    sb.writeln('Receipt');
    sb.writeln('========');
    for (final item in items) {
      // sb.writeln(item.toReceipt());
    }
    sb.writeln('========');
    sb.writeln('Total');
    sb.writeln('  net: ${priceNet}');
    sb.writeln('  VAT: ${vatValue}');
    sb.writeln('  import duty: ${importDutyValue}');
    return sb.toString();
  }
}
