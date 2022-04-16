import 'package:equatable/equatable.dart';
import 'package:itemis/no3/entities/roman_arabic_number.dart';

/// Translates globbish numbers to RomanArabic numbers.
class Globbish with EquatableMixin {
  static final Globbish _instance = Globbish._();

  /// Maps globbish phrases to roman number literals.
  Map globToRoman = <String, String>{};

  /// Maps roman number literals to globbish phrases.
  Map romanToGlob = <String, String>{};

  /// Singleton constructor.
  factory Globbish() => _instance;

  Globbish._();

  /// Resets the globbish dictionary.
  void reset() {
    globToRoman.clear();
    romanToGlob.clear();
  }

  /// Adds a globbish phrase to the dictionary.
  void add(String glob, String roman) {
    globToRoman[glob] = roman;
    romanToGlob[roman] = glob;
  }

  /// Returns the RomanArabicNumber for a globbish phrase.
  RomanArabicNumber? getRomanArabicFromGlobbisch(String glob) {
    final globParts = glob.split(' ');
    var roman = '';
    for (var globPart in globParts) {
      if (globToRoman.containsKey(globPart)) {
        roman += globToRoman[globPart];
      } else {
        return null;
      }
    }
    return RomanArabicNumber.fromRoman(roman);
  }

  /// Equatable
  @override
  List<Object?> get props => [globToRoman, romanToGlob];
}
