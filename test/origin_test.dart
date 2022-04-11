import 'package:itemis/entities/origin.dart';
import 'package:test/test.dart';

void main() {
  test('Can create domestic origin', () {
    final domesticOrigin = DomesticOrigin();
    expect(domesticOrigin, isA<Origin>());
  });

  test('Can create international origin', () {
    final internationalOrigin = InternationalOrigin();
    expect(internationalOrigin, isA<Origin>());
  });
}
