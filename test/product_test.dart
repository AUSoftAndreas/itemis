import 'package:itemis/entities/product.dart';
import 'package:test/test.dart';

void main() {
  test('Product can be instantiated', () {
    final product = Product();
    expect(product, isA<Product>());
  });
}
