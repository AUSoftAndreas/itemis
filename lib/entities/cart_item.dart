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

  int get priceNet => product.priceNet * quantity;

  int get importDutyRate => product.importDutyRate;

  int get importDutyValue => product.importDutyValue * quantity;

  int get vatRate => product.vatRate;

  int get vatValue => product.vatValue * quantity;

  int get priceGross => product.priceGross * quantity;
}
