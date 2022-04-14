import 'package:itemis/no2/entities/conference.dart';
import 'package:itemis/no2/entities/constraint.dart';
import 'package:itemis/no2/entities/talk.dart';
import 'package:itemis/no2/entities/track.dart';
import 'package:test/test.dart';

void main() {
  test('Conference can be constructed and has the desired attributes', () {
    final conference = Conference(tracks: [Track(name: 'test', minLength: 120, start: DateTime(2022, 1, 1, 8))]);
    expect(conference.tracks.length, 1);
  });

  test('Conference cannot be constructed with tracks that are overfilled', () {
    expect(() {
      Conference(
        tracks: [
          Track(
            name: 'test',
            minLength: 60,
            start: DateTime(2022, 1, 1, 8),
            talks: [
              const Talk(title: 'test1', duration: 45),
              const Talk(title: 'test2', duration: 45),
            ],
          ),
        ],
      );
    }, throwsException);
  });

  test('freeTimeMin and freeTimeMax work as expected', () {
    final conference = Conference(
      tracks: [
        Track(
          name: 'test',
          minLength: 60,
          maxLength: 90,
          start: DateTime(2022, 1, 1, 8),
          talks: [
            const Talk(title: 'test1', duration: 10),
            const Talk(title: 'test2', duration: 20),
          ],
        ),
      ],
    );
    expect(conference.tracks[0].freeTimeMin, 30);
    expect(conference.tracks[0].freeTimeMax, 60);
  });

  test('We can add a talk', () {
    final conference = Conference(
      tracks: [
        Track(
          name: 'test',
          minLength: 60,
          maxLength: 90,
          start: DateTime(2022, 1, 1, 8),
          talks: [
            const Talk(title: 'test1', duration: 10),
            const Talk(title: 'test2', duration: 20),
          ],
        ),
      ],
    );
    final talkToAdd = const Talk(title: 'test3', duration: 30);
    conference.tracks[0].addTalk(talkToAdd);
    expect(conference.tracks[0].talks.length, 3);
  });

  test('We cannot add a talk if this would exceed the maxLength', () {
    final conference = Conference(
      tracks: [
        Track(
          name: 'test',
          minLength: 50,
          start: DateTime(2022, 1, 1, 8),
          talks: [
            const Talk(title: 'test1', duration: 10),
            const Talk(title: 'test2', duration: 20),
          ],
        ),
      ],
    );
    expect(() {
      conference.tracks[0].addTalk(const Talk(title: 'test3', duration: 30));
    }, throwsException);
  });

  test('We can add a talk if there is just enough space', () {
    final conference = Conference(
      tracks: [
        Track(
          name: 'test',
          minLength: 50,
          start: DateTime(2022, 1, 1, 8),
          talks: [
            const Talk(title: 'test1', duration: 10),
            const Talk(title: 'test2', duration: 20),
          ],
        ),
      ],
    );
    expect(() {
      conference.tracks[0].addTalk(const Talk(title: 'test3', duration: 20));
    }, returnsNormally);
  });

  test('We cannot add a constrained talk to a non-fitting track', () {
    final conference = Conference(
      tracks: [
        Track(name: 'test', minLength: 100, start: DateTime(2022, 1, 1, 8), talks: [
          const Talk(title: 'test1', duration: 10),
          const Talk(title: 'test2', duration: 20),
        ], constraints: [
          Constraint.none,
          Constraint.beforeNoon
        ]),
      ],
    );
    expect(() {
      conference.tracks[0].addTalk(const Talk(title: 'test3', duration: 30, constraint: Constraint.afterNoon));
    }, throwsException);
  });
}
