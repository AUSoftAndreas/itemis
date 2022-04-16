import 'package:itemis/no3/entities/roman_arabic_number.dart';
import 'package:test/test.dart';

void main() {
  test('Arabic to Roman without the subtracting rule', () {
    expect(RomanArabicNumber(1).toRoman, equals('I'));
    expect(RomanArabicNumber(2).toRoman, equals('II'));
    expect(RomanArabicNumber(5).toRoman, equals('V'));
    expect(RomanArabicNumber(10).toRoman, equals('X'));
    expect(RomanArabicNumber(50).toRoman, equals('L'));
    expect(RomanArabicNumber(100).toRoman, equals('C'));
    expect(RomanArabicNumber(500).toRoman, equals('D'));
    expect(RomanArabicNumber(1000).toRoman, equals('M'));
    expect(RomanArabicNumber(2).toRoman, equals('II'));
    expect(RomanArabicNumber(3).toRoman, equals('III'));
    expect(RomanArabicNumber(6).toRoman, equals('VI'));
    expect(RomanArabicNumber(11).toRoman, equals('XI'));
    expect(RomanArabicNumber(12).toRoman, equals('XII'));
    expect(RomanArabicNumber(20).toRoman, equals('XX'));
    expect(RomanArabicNumber(30).toRoman, equals('XXX'));
    expect(RomanArabicNumber(3888).toRoman, equals('MMMDCCCLXXXVIII'));
  });

  test('Arabic to Roman with the subtracting rule', () {
    expect(RomanArabicNumber(4).toRoman, equals('IV'));
    expect(RomanArabicNumber(9).toRoman, equals('IX'));
    expect(RomanArabicNumber(40).toRoman, equals('XL'));
    expect(RomanArabicNumber(42).toRoman, equals('XLII'));
    expect(RomanArabicNumber(1944).toRoman, equals('MCMXLIV'));
  });

  test('Roman to Arabic', () {
    expect(RomanArabicNumber.fromRoman('I').arabic, equals(1));
    expect(RomanArabicNumber.fromRoman('II').arabic, equals(2));
    expect(RomanArabicNumber.fromRoman('V').arabic, equals(5));
    expect(RomanArabicNumber.fromRoman('X').arabic, equals(10));
    expect(RomanArabicNumber.fromRoman('L').arabic, equals(50));
    expect(RomanArabicNumber.fromRoman('C').arabic, equals(100));
    expect(RomanArabicNumber.fromRoman('D').arabic, equals(500));
    expect(RomanArabicNumber.fromRoman('M').arabic, equals(1000));
    expect(RomanArabicNumber.fromRoman('IV').arabic, equals(4));
    expect(RomanArabicNumber.fromRoman('IX').arabic, equals(9));
    expect(RomanArabicNumber.fromRoman('XL').arabic, equals(40));
    expect(RomanArabicNumber.fromRoman('XC').arabic, equals(90));
    expect(RomanArabicNumber.fromRoman('CD').arabic, equals(400));
    expect(RomanArabicNumber.fromRoman('CM').arabic, equals(900));
    expect(RomanArabicNumber.fromRoman('MCMXLIV').arabic, equals(1944));
    expect(RomanArabicNumber.fromRoman('MMMDCCCLXXXVIII').arabic, equals(3888));
  });
}
