import 'package:itemis/entities/cart.dart';
import 'package:itemis/entities/cart_item.dart';
import 'package:itemis/entities/origin.dart';
import 'package:itemis/entities/product.dart';
import 'package:itemis/entities/vat.dart';

void main(List<String> arguments) {
  /// The exmaples given by Atemis
  final cart1 = Cart();
  final cart2 = Cart();
  final cart3 = Cart();
  cart1.add(CartItem(
    product: Product(
      name: 'Book 1a',
      vat: const NoVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 124900,
    ),
  ));

  cart1.add(CartItem(
    product: Product(
      name: 'CD 1b',
      vat: const FullVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 149900,
    ),
  ));

  cart1.add(CartItem(
    product: Product(
      name: 'Chocolate Bar 1c',
      vat: const NoVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 8500,
    ),
  ));

  cart2.add(CartItem(
    product: Product(
      name: 'Imported box of chocolate 2a',
      vat: const NoVat(),
      origin: const InternationalOrigin(),
      shelfPrice: 100000,
    ),
  ));

  cart2.add(CartItem(
    product: Product(
      name: 'Imported bottle of perfume 2b',
      vat: const FullVat(),
      origin: const InternationalOrigin(),
      shelfPrice: 475000,
    ),
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'Imported bottle of perfume 3a',
      vat: const FullVat(),
      origin: const InternationalOrigin(),
      shelfPrice: 279900,
    ),
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'Bottle of perfume 3b',
      vat: const FullVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 189900,
    ),
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'Packet of headache pills 3c',
      vat: const NoVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 97500,
    ),
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'Box of imported chocolate 3d',
      vat: const NoVat(),
      origin: const InternationalOrigin(),
      shelfPrice: 112500,
    ),
  ));

  print(cart1.toReceipt());
  print('');
  print(cart2.toReceipt());
  print('');
  print(cart3.toReceipt());
  print('');
}
