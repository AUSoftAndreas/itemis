import 'package:itemis/no2/entities/constraint.dart';
import 'package:itemis/no2/entities/talk.dart';
import 'package:test/test.dart';

void main() {
  test('Talk can be constructed, has title, length, constraints', () {
    final talk = const Talk();
    expect(talk, isA<Talk>());
    expect(talk.title, '(ohne Titel)');
    expect(talk.duration, 5);
    expect(talk.constraint, Constraint.none);
  });
}
