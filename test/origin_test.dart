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

  test('Import duty is 0 for domestic goods', () {
    final domesticOrigin = DomesticOrigin();
    expect(domesticOrigin.importDuty, 0);
  });

  test('Import duty is 5 for international goods', () {
    final domesticOrigin = InternationalOrigin();
    expect(domesticOrigin.importDuty, 500);
  });
}
