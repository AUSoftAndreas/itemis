import 'package:equatable/equatable.dart';
import 'package:itemis/no1/entities/cart_item.dart';
import 'package:itemis/no1/entities/money.dart';

/// Represents the entire cart of the user.
class Cart extends Equatable {
  /// Constructs one Cart.
  /// - [items]: The items in the cart. If no items are given, the cart is empty.
  Cart({List<CartItem>? items}) : items = items ?? [];

  /// The items in the cart.
  final List<CartItem> items;

  /// The total net price of the cart. Equals the sum of the net prices of all items.
  int get priceNet => items.fold<int>(0, (previousValue, element) => previousValue + element.priceNet);

  /// The total VAT tax amaount of the cart. Equals the sum of the VAT amounts of all items.
  int get vatValue => items.fold<int>(0, (previousValue, element) => previousValue + element.vatValue);

  /// The total import duty amaount of the cart. Equals the sum of the import duty amounts of all items.
  int get importDutyValue => items.fold<int>(0, (previousValue, element) => previousValue + element.importDutyValue);

  /// The total gross price of the cart, including the sales tax. Equals the sum of the gross prices of all items.
  int get priceIncludingImportDuty =>
      items.fold<int>(0, (previousValue, element) => previousValue + element.priceIncludingImportDuty);

  /// Adds a [CartItem] to the cart.
  void add(CartItem cartItem) {
    items.add(cartItem);
  }

  /// Removes a [CartItem] from the cart.
  void remove(CartItem cartItem) {
    items.remove(cartItem);
  }

  /// Returns the receipt for the cart as a String.
  String toReceipt() {
    final sb = StringBuffer();
    sb.writeln('Receipt');
    sb.writeln('========');
    for (final item in items) {
      sb.writeln(item.toReceipt());
    }
    sb.writeln('========');
    sb.writeln('Sales Taxes: ${Money(vatValue + importDutyValue).asEuroStringWithSymbol}');
    sb.writeln('Total: ${Money(priceIncludingImportDuty).asEuroStringWithSymbol}');
    return sb.toString();
  }

  @override
  List<Object> get props => [items];
}
