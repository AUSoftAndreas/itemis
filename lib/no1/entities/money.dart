import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

/// Class representing money values in this app.
/// It lacks all advanced features (like currencies).
class Money extends Equatable {
  /// The amount of money in centicents (100th of a cent).
  final int amount;

  /// Creates a money object representing a certain amount of money.
  const Money(this.amount);

  /// The amount of money, as a double value in cents.
  /// A value of 100.0 represents 1 Euro.
  double get asCentDouble => amount / 100;

  /// The amount of money, as a int value in cents.
  /// A value of 100 represents 1 Euro.
  int get asCentInt => (amount ~/ 100) + ((amount % 100) >= 50 ? 1 : 0);

  /// The amount of money, as a double value in Euro.
  /// A value of 1.0 represents 1 Euro.
  double get asEuroDouble => amount / 10000;

  /// The amount of money, as a int value in Euro.
  /// A value of 1 represents 1 Euro.
  int get asEuroInt => (amount ~/ 10000) + ((amount % 10000) >= 5000 ? 1 : 0);

  /// The amount of money, as a String value in Euro but without the Euro symbol.
  String get asEuroStringWithoutSymbol {
    final format = NumberFormat('#,##0.00');
    final formattedNumber = format.format(asEuroDouble);
    return formattedNumber.replaceAll(',', ';').replaceAll('.', ',').replaceAll(';', '.');
  }

  /// Equatable
  @override
  List<Object> get props => [amount];

  /// The amount of money, as a String value in Euro with the Euro symbol.
  String get asEuroStringWithSymbol => '$asEuroStringWithoutSymbol €';
}
