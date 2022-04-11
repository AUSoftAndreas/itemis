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
      vat: NoVat(),
      origin: DomesticOrigin(),
      shelfPrice: 124900,
    ),
    quantity: 1,
  ));

  cart1.add(CartItem(
    product: Product(
      name: 'CD 1b',
      vat: FullVat(),
      origin: DomesticOrigin(),
      shelfPrice: 149900,
    ),
    quantity: 1,
  ));

  cart1.add(CartItem(
    product: Product(
      name: 'Chocolate Bar 1c',
      vat: NoVat(),
      origin: DomesticOrigin(),
      shelfPrice: 8500,
    ),
    quantity: 1,
  ));

  cart2.add(CartItem(
    product: Product(
      name: 'Imported box of chocolate 2a',
      vat: NoVat(),
      origin: InternationalOrigin(),
      shelfPrice: 100000,
    ),
    quantity: 1,
  ));

  cart2.add(CartItem(
    product: Product(
      name: 'Imported bottle of perfume 2b',
      vat: FullVat(),
      origin: InternationalOrigin(),
      shelfPrice: 475000,
    ),
    quantity: 1,
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'Imported bottle of perfume 3a',
      vat: FullVat(),
      origin: InternationalOrigin(),
      shelfPrice: 279900,
    ),
    quantity: 1,
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'Bottle of perfume 3b',
      vat: FullVat(),
      origin: DomesticOrigin(),
      shelfPrice: 189900,
    ),
    quantity: 1,
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'Packet of headache pills 3c',
      vat: NoVat(),
      origin: DomesticOrigin(),
      shelfPrice: 97500,
    ),
    quantity: 1,
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'Box of imported chocolate 3d',
      vat: NoVat(),
      origin: InternationalOrigin(),
      shelfPrice: 112500,
    ),
    quantity: 1,
  ));

  // print(cart1.receipt);
  // print('');
  // print(cart2.receipt);
  // print('');
  // print(cart3.receipt);
  // print('');
}
