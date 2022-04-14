import 'package:itemis/no2/entities/constraint.dart';
import 'package:itemis/no2/entities/fixed_talk.dart';
import 'package:itemis/no2/entities/track.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Track can be constructed, has the desired attributes',
    () {
      final track = Track(
          name: 'Name',
          minLength: 50,
          start: DateTime(2022, 1, 1, 8),
          constraints: [Constraint.none, Constraint.beforeNoon],
          fixedAfter: FixedTalk(title: 'Title', start: DateTime(2022, 1, 1, 9), end: DateTime(2022, 1, 1, 10)));
      expect(track.name, 'Name');
      expect(track.minLength, 50);
      expect(track.start, DateTime(2022, 1, 1, 8));
      expect(track.fixedAfter!.title, 'Title');
      expect(track.fixedAfter!.start, DateTime(2022, 1, 1, 9));
      expect(track.fixedAfter!.end, DateTime(2022, 1, 1, 10));
      expect(track.constraints, [Constraint.none, Constraint.beforeNoon]);
    },
  );
}
