import 'package:equatable/equatable.dart';
import 'package:itemis/no2/entities/constraint.dart';
import 'package:itemis/no2/entities/exceptions.dart';
import 'package:itemis/no2/entities/fixed_talk.dart';
import 'package:itemis/no2/entities/talk.dart';

/// A Track is a certain stretch of time at a conference.
class Track extends Equatable {
  /// The name of the track
  final String name;

  /// The Constraints this track can fulfill
  final List<Constraint> constraints;

  /// The minimum length of this track
  final int minLength;

  /// The maximum length of this track
  final int maxLength;

  /// The start time of this track.
  final DateTime start;

  /// A fixed appointment that takes place before track program starts.
  final FixedTalk? fixedBefore;

  /// A fixed appointment that takes place after track program ends.
  final FixedTalk? fixedAfter;

  /// The list of talks that are the program of the track.
  final List<Talk> talks;

  /// Standard constructor for a track.
  /// - [name]: The name of the track.
  /// - [minLength]: The minimum length of the track (in minutes).
  /// - [maxLength]: The maximum length of the track (in minutes).
  /// - [start]: The start time of the track.
  /// - [fixedBefore]: The fixed talk that will be held at the start of the track.
  /// - [fixedAfter]: The fixed talk that will be held at the end of the track.
  /// - [talks]: The talks that are scheduled on this track.
  /// - [constraints]: The potential constraints talks may possess while still
  /// being accepted for this track.
  Track({
    required this.name,
    required this.minLength,
    required this.start,
    this.fixedAfter,
    this.fixedBefore,
    this.constraints = const [Constraint.none],
    List<Talk>? talks,
    int? maxLength,
  })  : talks = talks ?? <Talk>[],
        maxLength = maxLength ?? minLength {
    if (freeTimeMax < 0) throw TrackTooLongException();
    for (final t in this.talks) {
      if (!constraints.contains(t.constraint)) {
        throw ConstrainedTalkAddedToTrackException();
      }
    }
    if (fixedBefore != null) {
      if (fixedBefore!.end.isAfter(start)) {
        throw FixedTalkEndAfterTrackStart();
      }
    }
    if (fixedAfter != null) {
      if (fixedAfter!.start.isBefore(start.add(Duration(minutes: this.maxLength)))) {
        throw FixedTalkStartBeforeTrackEnd();
      }
    }
  }

  /// The maximum free (not already taken up by scheduled talks) length in
  /// minutes for this track.
  int get freeTimeMax => maxLength - talks.fold<int>(0, (x, talk) => x + talk.duration);

  /// The minimum free (not already taken up by scheduled talks) length in
  /// minutes for this track.
  int get freeTimeMin => minLength - talks.fold<int>(0, (x, talk) => x + talk.duration);

  /// Adds one talk to this track.
  /// This routine will block you from adding a
  /// - [talk]: The talk to add.
  /// - Throws exception if the talk could not be added because the alotted time for
  /// the track would be depleted.
  /// - Throws exception if the track constraints do not match the
  /// talk constraint (e.g. if the talk can only take place in the afternoon but it
  /// is a morning track).
  void addTalk(Talk talk) {
    if (freeTimeMax < talk.duration) {
      throw TrackTooLongException();
    }
    if (!constraints.contains(talk.constraint)) {
      throw ConstrainedTalkAddedToTrackException();
    }
    talks.add(talk);
  }

  /// Prints the list entry for this track. Uses talk.print.
  void printProgram() {
    print(name);
    print('-------------------');
    if (fixedBefore != null) {
      fixedBefore!.printProgram();
    }
    var start = this.start;
    for (final talk in talks) {
      talk.printProgram(start);
      start = start.add(Duration(minutes: talk.duration));
    }
    if (fixedAfter != null) {
      fixedAfter!.printProgram();
    }
  }

  /// Equatable
  @override
  List<Object?> get props => [
        name,
        constraints,
        minLength,
        maxLength,
        start,
        fixedBefore,
        fixedAfter,
        talks,
      ];
}
