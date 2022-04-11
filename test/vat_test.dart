import 'package:itemis/entities/vat.dart';
import 'package:test/scaffolding.dart';
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
}
