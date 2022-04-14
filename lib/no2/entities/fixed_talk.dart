import 'package:equatable/equatable.dart';
import 'package:itemis/no2/entities/exceptions.dart';
import 'package:itemis/no2/helpers/functions.dart';

/// Before and after a track, there can be fixedTalks. These are talks that
/// will be held at a specified time in any case.
class FixedTalk extends Equatable {
  /// The time at which the talk starts.
  final DateTime start;

  /// The time at which the talk ends.
  final DateTime end;

  /// The name of the talk
  final String title;

  /// Standard constructor for a fixed talk.
  FixedTalk({required this.start, required this.end, required this.title}) {
    if (start.isAfter(end)) throw FixedTalkStartAfterEndException();
  }

  /// Prints the list entry for this FixedTalk object.
  void printProgram() {
    print('${formatTime(start)} - ${formatTime(end)} - $title');
  }

  /// Equatable
  @override
  List<Object> get props => [start, end, title];
}
