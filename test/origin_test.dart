import 'package:test/test.dart';

void main() {
  test('Can create domestic origin', () {
    final domesticOrigin = DomesticOrigin();
    expect(domesticOrigin, isA<Origin>());
  });
}
