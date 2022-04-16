// ignore_for_file: avoid_classes_with_only_static_members

import 'package:itemis/no3/entities/catalog.dart';
import 'package:itemis/no3/entities/globbish.dart';
import 'package:itemis/no3/entities/roman_arabic_number.dart';
import 'package:itemis/no3/services/cli_interpreter_response.dart';

/// Class handling the interpretation of CLI commands.
abstract class CliInterpreter {
  /// Interpret a CLI line.
  static CliInterpreterResponse interpret(String line) {
    final globbish = Globbish();
    final catalog = Catalog();
    if (line.isEmpty) {
      return CliInterpreterResponseUnknownCommand();
    }
    final lineParts = line.split(' ');
    if (lineParts.length == 1 && lineParts[0] == 'exit') {
      return CliInterpreterResponseExit();
    } else if (lineParts.length == 3 &&
        lineParts[1] == 'is' &&
        RomanArabicNumber.romanCiphers.containsKey(lineParts[2])) {
      globbish.add(lineParts[0], lineParts[2]);
      return CliInterpreterResponseDone();
    } else if (lineParts.length >= 5 &&
        lineParts[lineParts.length - 3] == 'is' &&
        int.tryParse(lineParts[lineParts.length - 2]) != null &&
        lineParts[lineParts.length - 1] == 'Credits') {
      final credits = int.tryParse(lineParts[lineParts.length - 2]);
      final globNumberString = lineParts.sublist(0, lineParts.length - 4).join(' ');
      final globNumber = globbish.getRomanArabicFromGlobbisch(globNumberString);
      if (globNumber == null) {
        return CliInterpreterResponseUnknownCommand();
      }
      catalog.setPrice(lineParts[lineParts.length - 4], credits! / globNumber.arabic);
      return CliInterpreterResponseDone();
    } else if (lineParts.length >= 5 &&
        lineParts[0] == 'how' &&
        lineParts[1] == 'much' &&
        lineParts[2] == 'is' &&
        lineParts[lineParts.length - 1] == '?') {
      final globNumberString = lineParts.sublist(3, lineParts.length - 1).join(' ');
      final globNumber = globbish.getRomanArabicFromGlobbisch(globNumberString);
      if (globNumber == null) {
        return CliInterpreterResponseUnknownCommand();
      }
      return CliInterpreterResponseAnswer('$globNumberString is ${globNumber.arabic}');
    } else if (lineParts.length >= 7 &&
        lineParts[0] == 'how' &&
        lineParts[1] == 'many' &&
        lineParts[2] == 'Credits' &&
        lineParts[3] == 'is' &&
        lineParts[lineParts.length - 1] == '?') {
      final material = lineParts[lineParts.length - 2];
      final globNumberString = lineParts.sublist(4, lineParts.length - 2).join(' ');
      final globNumber = globbish.getRomanArabicFromGlobbisch(globNumberString);
      if (globNumber == null) {
        return CliInterpreterResponseUnknownCommand();
      }
      final globNumberArabic = globNumber.arabic;
      final price = catalog.getPrice(lineParts[lineParts.length - 2]);
      final calcDouble = globNumberArabic * price;
      final calcInt = calcDouble == calcDouble.roundToDouble() ? calcDouble.toInt() : null;
      return CliInterpreterResponseAnswer('$globNumberString $material is ${calcInt ?? calcDouble} Credits');
    }
    return CliInterpreterResponseUnknownCommand();
  }
}
