import 'package:itemis/no3/entities/globbish.dart';
import 'package:itemis/no3/entities/roman_arabic_number.dart';
import 'package:test/test.dart';

void main() {
  test('Defining and resetting glob patterns', () {
    final globbish = Globbish();
    globbish.add('glob', 'I');
    globbish.add('prok', 'V');
    globbish.add('pish', 'X');
    globbish.add('tegj', 'L');
    globbish.add('hmpf', 'C');
    globbish.add('hyper', 'D');
    globbish.add('jmpf', 'M');
    expect(globbish.globToRoman, {
      'glob': 'I',
      'prok': 'V',
      'pish': 'X',
      'tegj': 'L',
      'hmpf': 'C',
      'hyper': 'D',
      'jmpf': 'M',
    });
    expect(globbish.romanToGlob, {
      'I': 'glob',
      'V': 'prok',
      'X': 'pish',
      'L': 'tegj',
      'C': 'hmpf',
      'D': 'hyper',
      'M': 'jmpf',
    });
    globbish.reset();
    expect(globbish.globToRoman, isEmpty);
    expect(globbish.romanToGlob, isEmpty);
  });

  test('Translating glob patterns to roman numbers', () {
    final globbish = Globbish();
    globbish.add('glob', 'I');
    globbish.add('prok', 'V');
    globbish.add('pish', 'X');
    globbish.add('tegj', 'L');
    globbish.add('hmpf', 'C');
    globbish.add('hyper', 'D');
    globbish.add('jmpf', 'M');
    expect(globbish.getRomanArabicFromGlobbisch('glob'), RomanArabicNumber(1));
    expect(globbish.getRomanArabicFromGlobbisch('prok'), RomanArabicNumber(5));
    expect(globbish.getRomanArabicFromGlobbisch('pish'), RomanArabicNumber(10));
    expect(globbish.getRomanArabicFromGlobbisch('tegj'), RomanArabicNumber(50));
    expect(globbish.getRomanArabicFromGlobbisch('hmpf'), RomanArabicNumber(100));
    expect(globbish.getRomanArabicFromGlobbisch('hyper'), RomanArabicNumber(500));
    expect(globbish.getRomanArabicFromGlobbisch('jmpf'), RomanArabicNumber(1000));
    expect(globbish.getRomanArabicFromGlobbisch('glob glob'), RomanArabicNumber(2));
    expect(globbish.getRomanArabicFromGlobbisch('glob prok'), RomanArabicNumber(4));
    expect(globbish.getRomanArabicFromGlobbisch('glob pish'), RomanArabicNumber(9));
    expect(globbish.getRomanArabicFromGlobbisch('pish tegj'), RomanArabicNumber(40));
    expect(globbish.getRomanArabicFromGlobbisch('pish hmpf'), RomanArabicNumber(90));
    expect(globbish.getRomanArabicFromGlobbisch('hmpf hyper'), RomanArabicNumber(400));
    expect(globbish.getRomanArabicFromGlobbisch('hmpf jmpf'), RomanArabicNumber(900));
    expect(globbish.getRomanArabicFromGlobbisch('jmpf hmpf jmpf pish tegj glob prok'), RomanArabicNumber(1944));
    expect(
        globbish
            .getRomanArabicFromGlobbisch('jmpf jmpf jmpf hyper hmpf hmpf hmpf tegj pish pish pish prok glob glob glob'),
        RomanArabicNumber(3888));
  });
}
