import 'package:itemis/no2/entities/constraint.dart';
import 'package:itemis/no2/helpers/functions.dart';

/// A talk is an element of a track of a conference.
class Talk {
  /// The title of the talk.
  final String title;

  /// The length of the talk in minutes.
  final int duration;

  /// The constraint of the talk (e.g. "only afternoon")
  final Constraint constraint;

  /// Standard constructor for a talk, which is an element of a track of a
  /// conference.
  /// - [title]: The name of the talk.
  /// - [duration]: The length of the talk (in minutes)
  /// - [constraint]: A constraint that can apply to a talk. For example, a
  /// talk may be only scheduled in the afternoon.
  const Talk({
    this.title = '(ohne Titel)',
    this.duration = 5,
    this.constraint = Constraint.none,
  });

  /// Prints the list entry for this talk object.
  void printProgram(DateTime start) {
    print('${formatTime(start)} - ${formatTime(start.add(Duration(minutes: duration)))} - $title');
  }
}
