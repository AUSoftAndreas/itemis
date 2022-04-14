import 'package:test/test.dart';

void main() {
  test('Arabic to Roman', () {
    final roman = Roman();
    expect(roman.translate(1), equals('I'));
    expect(roman.translate(5), equals('V'));
    expect(roman.translate(10), equals('X'));
    expect(roman.translate(50), equals('L'));
    expect(roman.translate(100), equals('C'));
    expect(roman.translate(500), equals('D'));
    expect(roman.translate(1000), equals('M'));
    expect(roman.translate(2), equals('II'));
    expect(roman.translate(3), equals('III'));
    expect(roman.translate(4), equals('IV'));
    expect(roman.translate(6), equals('VI'));
    expect(roman.translate(9), equals('IX'));
    expect(roman.translate(11), equals('XI'));
    expect(roman.translate(12), equals('XII'));
    expect(roman.translate(20), equals('XX'));
    expect(roman.translate(30), equals('XXX'));
    expect(roman.translate(40), equals('XL'));
    expect(roman.translate(42), equals('XLII'));
    expect(roman.translate(1944), equals('MCMXLIV'));
  });
}
