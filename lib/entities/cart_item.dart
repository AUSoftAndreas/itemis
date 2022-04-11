import 'package:itemis/entities/product.dart';

/// Represents one cart item, one entry to a ShoppingCart
class CartItem {
  /// The product
  final Product product;

  /// The quantity of the product
  final int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  int get importDuty => product.importDutyRate;

  int get vatRate => product.vatRate;
}
