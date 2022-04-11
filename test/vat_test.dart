import 'package:itemis/entities/vat.dart';
import 'package:test/test.dart';

void main() {
  test('FullVat can be constructred ', () {
    final fullVat = FullVat();
    expect(fullVat, isA<Vat>());
  });

  test('RecucedVat can be constructred ', () {
    final recuedVat = ReducedVat();
    expect(recuedVat, isA<Vat>());
  });

  test('FullVat can be constructred ', () {
    final noVat = NoVat();
    expect(noVat, isA<Vat>());
  });

  test('FullVat has a VAT of 10 (percent)', () {
    final fullVat = FullVat();
    expect(fullVat.vatRate, 1000);
  });

  test('ReducedVat has a VAT of 5 (percent)', () {
    final reducedVat = ReducedVat();
    expect(reducedVat.vatRate, 500);
  });

  test('NoVat has a VAT of 0 (percent)', () {
    final noVat = NoVat();
    expect(noVat.vatRate, 0);
  });
}
