import 'package:itemis/no2/entities/conference.dart';
import 'package:itemis/no2/entities/constraint.dart';
import 'package:itemis/no2/entities/fixed_talk.dart';
import 'package:itemis/no2/entities/talk.dart';
import 'package:itemis/no2/entities/track.dart';

void main(List<String> arguments) {
  final tracks = [
    Track(
      name: 'Track 1 Vormittag',
      minLength: 180,
      start: DateTime(2022, 4, 16, 9, 0),
      fixedAfter: FixedTalk(
        start: DateTime(2022, 4, 16, 12, 0),
        end: DateTime(2022, 4, 16, 13, 0),
        title: 'Lunch',
      ),
      constraints: [Constraint.none, Constraint.beforeNoon],
    ),
    Track(
      name: 'Track 1 Nachmittag',
      minLength: 180,
      maxLength: 240,
      start: DateTime(2022, 4, 16, 13, 0),
      fixedAfter: FixedTalk(
        start: DateTime(2022, 4, 16, 17, 0),
        end: DateTime(2022, 4, 16, 18, 0),
        title: 'Networking Event',
      ),
      constraints: [Constraint.none, Constraint.afterNoon],
    ),
    Track(
      name: 'Track 2 Vormittag',
      minLength: 180,
      start: DateTime(2022, 4, 17, 9, 0),
      fixedAfter: FixedTalk(
        start: DateTime(2022, 4, 17, 12, 0),
        end: DateTime(2022, 4, 17, 13, 0),
        title: 'Lunch',
      ),
      constraints: [Constraint.none, Constraint.beforeNoon],
    ),
    Track(
      name: 'Track 2 Nachmittag',
      minLength: 180,
      maxLength: 240,
      start: DateTime(2022, 4, 17, 13, 0),
      fixedAfter: FixedTalk(
        start: DateTime(2022, 4, 17, 17, 0),
        end: DateTime(2022, 4, 17, 18, 0),
        title: 'Networking Event',
      ),
      constraints: [Constraint.none, Constraint.afterNoon],
    ),
  ];
  final talks = [
    const Talk(title: 'Writing Fast Tests Against Enterprise Rails', duration: 60),
    const Talk(title: 'Overdoing it in Python', duration: 45),
    const Talk(title: 'Lua for the Masses', duration: 30),
    const Talk(title: 'Ruby Errors from Mismatched Gem Versions', duration: 45),
    const Talk(title: 'Common Ruby Errors', duration: 45),
    const Talk(title: 'Rails for Python Developers'),
    const Talk(title: 'Communicating Over Distance', duration: 60),
    const Talk(title: 'Accounting-Driven Development', duration: 45),
    const Talk(title: 'Woah', duration: 30),
    const Talk(title: 'Sit Down and Write', duration: 30),
    const Talk(title: 'Pair Programming vs Noise', duration: 45),
    const Talk(title: 'Rails Magic', duration: 60),
    const Talk(title: 'Ruby on Rails: Why We Should Move On', duration: 60),
    const Talk(title: 'Clojure Ate Scala (on my project)', duration: 45),
    const Talk(title: 'Programming in the Boondocks of Seattle', duration: 30),
    const Talk(title: 'Ruby vs. Clojure for Back-End Development', duration: 30),
    const Talk(title: 'Ruby on Rails Legacy App Maintenance', duration: 60),
    const Talk(title: 'A World Without HackerNews', duration: 30),
    const Talk(title: 'User Interface CSS in Rails Apps', duration: 30)
  ];
  final conference = Conference.generate(tracks: tracks, talks: talks);
  conference.printProgram();
}
