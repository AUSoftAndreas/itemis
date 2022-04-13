import 'package:itemis/no1/entities/cart.dart';
import 'package:itemis/no1/entities/cart_item.dart';
import 'package:itemis/no1/entities/origin.dart';
import 'package:itemis/no1/entities/product.dart';
import 'package:itemis/no1/entities/vat.dart';

void main(List<String> arguments) {
  /// The exmaples given by Atemis
  final cart1 = Cart();
  final cart2 = Cart();
  final cart3 = Cart();
  cart1.add(CartItem(
    product: Product(
      name: 'book',
      vat: const NoVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 124900,
    ),
  ));

  cart1.add(CartItem(
    product: Product(
      name: 'music CD',
      vat: const FullVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 149900,
    ),
  ));

  cart1.add(CartItem(
    product: Product(
      name: 'chocolate bar',
      vat: const NoVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 8500,
    ),
  ));

  cart2.add(CartItem(
    product: Product(
      name: 'imported box of chocolates',
      vat: const NoVat(),
      origin: const InternationalOrigin(),
      shelfPrice: 100000,
    ),
  ));

  cart2.add(CartItem(
    product: Product(
      name: 'imported bottle of perfume',
      vat: const FullVat(),
      origin: const InternationalOrigin(),
      shelfPrice: 475000,
    ),
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'imported bottle of perfume',
      vat: const FullVat(),
      origin: const InternationalOrigin(),
      shelfPrice: 279900,
    ),
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'bottle of perfume',
      vat: const FullVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 189900,
    ),
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'package of headache pills',
      vat: const NoVat(),
      origin: const DomesticOrigin(),
      shelfPrice: 97500,
    ),
  ));

  cart3.add(CartItem(
    product: Product(
      name: 'imported box of chocolates',
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
