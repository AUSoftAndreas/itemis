import 'package:equatable/equatable.dart';

/// Class representing money values in this app.
/// It lacks all advanced features (like currencies).
class Money extends Equatable {
  /// Creates a money object representing a certain amount of money.
  const Money(this.amount);

  /// The amount of money in centicents (100th of a cent).
  final int amount;

  double get asEuroDouble => amount / 10000;

  int get asEuroInt => (amount ~/ 10000) + ((amount % 10000) >= 5000 ? 1 : 0);

  double get asCentDouble => amount / 100;

  int get asCentInt => (amount ~/ 100) + ((amount % 100) >= 50 ? 1 : 0);

  /// Equatable
  @override
  List<Object> get props => [amount];
}
