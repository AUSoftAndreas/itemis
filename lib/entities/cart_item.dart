import 'package:equatable/equatable.dart';
import 'package:itemis/entities/product.dart';

/// Represents one cart item, one entry to a Cart
class CartItem extends Equatable {
  /// Constructs one cart item, one entry to a Cart
  const CartItem({
    required this.product,
    this.quantity = 1,
  });

  /// The product
  final Product product;

  /// The quantity of the product
  final int quantity;

  /// The net price of the CartItem. Equals the product price multiplied by the quantity.
  int get priceNet => product.priceNet * quantity;

  /// The import duty rate for the CartItem. Equals the import duty rate of the underlying product.
  int get importDutyRate => product.importDutyRate;

  /// The import duty amaount for the CartItem. Equals the import duty amount of the
  /// underlying product multiplied by the quantity.
  int get importDutyValue => product.importDutyValue * quantity;

  /// The VAT rate for the CartItem. Equals the VAT rate of the underlying product.
  int get vatRate => product.vatRate;

  /// The VAT amount for the CartItem. Equals the VAT amount of the underlying product
  /// multiplied by the quantity.
  int get vatValue => product.vatValue * quantity;

  /// Equatable
  @override
  List<Object> get props => [product, quantity];
}
