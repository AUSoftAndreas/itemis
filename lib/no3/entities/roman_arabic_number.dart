import 'package:equatable/equatable.dart';

/// Handles numbers and their roman and arabic representations.
class RomanArabicNumber extends Equatable {
  /// The arabic representation of the number.
  final int arabic;

  /// All defined roman number literals.
  static const romanCiphers = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };

  /// Constructs a new [RomanArabicNumber] with the given [arabic] value.
  RomanArabicNumber(this.arabic) {
    if (arabic < 0 || arabic > 3999) {
      throw ArgumentError('Arabic number must be between 0 and 3999');
    }
  }

  /// Constructs a new [RomanArabicNumber] with the given [arabic] value.
  factory RomanArabicNumber.fromArabic(int arabic) => RomanArabicNumber(arabic);

  /// Constructs a new [RomanArabicNumber] with the given [roman] value.
  factory RomanArabicNumber.fromRoman(String roman) {
    // Subtracting rule
    var changedRoman = roman.replaceAll('IV', 'IIII');
    changedRoman = changedRoman.replaceAll('IX', 'VIIII');
    changedRoman = changedRoman.replaceAll('XL', 'XXXX');
    changedRoman = changedRoman.replaceAll('XC', 'LXXXX');
    changedRoman = changedRoman.replaceAll('CD', 'CCCC');
    changedRoman = changedRoman.replaceAll('CM', 'DCCCC');
    var arabic = 0;
    for (var i = 0; i < changedRoman.length; i++) {
      final c = changedRoman[i];
      arabic += romanCiphers[c] ?? 0;
    }
    return RomanArabicNumber(arabic);
  }

  /// Returns the roman representation of this object.
  String get toRoman {
    if (arabic == 0) {
      return '';
    }
    var remaining = arabic;
    var roman = '';
    while (remaining >= 1000) {
      remaining -= 1000;
      roman = '${roman}M';
    }
    while (remaining >= 500) {
      remaining -= 500;
      roman = '${roman}D';
    }
    while (remaining >= 100) {
      remaining -= 100;
      roman = '${roman}C';
    }
    while (remaining >= 50) {
      remaining -= 50;
      roman = '${roman}L';
    }
    while (remaining >= 10) {
      remaining -= 10;
      roman = '${roman}X';
    }
    while (remaining >= 5) {
      remaining -= 5;
      roman = '${roman}V';
    }
    while (remaining >= 1) {
      remaining -= 1;
      roman = '${roman}I';
    }
    if (remaining != 0) {
      throw Exception('Invalid result after roman translation');
    }
    // Subtracting rule
    roman = roman.replaceAll('DCCCC', 'CM');
    roman = roman.replaceAll('CCCC', 'CD');
    roman = roman.replaceAll('LXXXX', 'XC');
    roman = roman.replaceAll('XXXX', 'XL');
    roman = roman.replaceAll('VIIII', 'IX');
    roman = roman.replaceAll('IIII', 'IV');
    return roman;
  }

  /// Returns the arabic representation of this object.
  int get toArabic => arabic;

  /// Equatable
  @override
  List<Object> get props => [arabic];
}
