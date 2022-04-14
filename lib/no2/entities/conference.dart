import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:itemis/no2/entities/exceptions.dart';
import 'package:itemis/no2/entities/talk.dart';
import 'package:itemis/no2/entities/track.dart';

/// A conference is a collection of tracks which are each a collection of
/// talks.
class Conference extends Equatable {
  /// List of the tracks that make up the Conference
  final List<Track> tracks;

  /// Standard constructor for a conference which is a collection of tracks.
  /// - [tracks]: The tracks that are part of this conference.
  const Conference({
    required this.tracks,
  });

  /// Generate a conference from a list of tracks and a list of talks. This will
  /// trigger an automatic arranging of the talks on the tracks. This routine
  /// throws an Exception if the talks cannot be arranged on the tracks.
  factory Conference.generate({required List<Talk> talks, required List<Track> tracks}) {
    if (tracks.fold<int>(0, (x, track) => x + track.maxLength) < talks.fold<int>(0, (x, talk) => x + talk.duration)) {
      throw NotEnoughSpaceForAllTalksException();
    }
    // All tracks are sorted from highest to lowest.
    talks.sort((a, b) => -a.duration.compareTo(b.duration));
    while (talks.isNotEmpty) {
      // We are searching for tracks that have just the space available for a combination of two talks.
      for (var i = 0; i < talks.length; i++) {
        for (var j = i + 1; j < talks.length; j++) {
          if (i < 0) i = 0;
          if (j < 1) j = 1;
          final sumDuration = talks[i].duration + talks[j].duration;
          final track = tracks.firstWhereOrNull((t) =>
              t.constraints.contains(talks[i].constraint) &&
              t.constraints.contains(talks[j].constraint) &&
              t.freeTimeMax == sumDuration);
          if (track != null) {
            // Found a perfect match. Adding the talks.
            track.addTalk(talks.removeAt(j));
            track.addTalk(talks.removeAt(i));
            i--;
            j--;
          }
        }
      }
      if (talks.isNotEmpty) {
        // After assigning the perfect fits, we are looking for the first (longest) talks and assign it to the
        // track with the most available time.
        final track = tracks.fold<Track?>(null, (p, e) => e.freeTimeMax > (p?.freeTimeMax ?? 0) ? e : p);
        if (track != null) {
          if (track.freeTimeMax > talks[0].duration) {
            track.addTalk(talks.removeAt(0));
          } else {
            throw NotEnoughSpaceForAllTalksException();
          }
        }
      }
    }
    tracks.sort((a, b) => a.start.compareTo(b.start));
    return Conference(tracks: tracks);
  }

  /// Prints the program for the conference. Uses the Track.print method
  /// internally.
  void printProgram() {
    print('Conference program:');
    print('===================');
    print('');
    for (final track in tracks) {
      track.printProgram();
      print('');
    }
  }

  /// Equatable
  @override
  List<Object?> get props => [tracks];
}
