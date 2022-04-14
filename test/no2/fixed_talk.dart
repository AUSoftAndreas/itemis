import 'package:itemis/no2/entities/fixed_talk.dart';
import 'package:test/test.dart';

void main() {
  test('Can construct FixedTalk with desired attributes', () {
    final fixed = FixedTalk(
      title: 'Title',
      start: DateTime(2022, 1, 1, 8),
      end: DateTime(2022, 1, 1, 9),
    );
    expect(fixed.start, DateTime(2022, 1, 1, 8));
    expect(fixed.end, DateTime(2022, 1, 1, 9));
    expect(fixed.title, 'Title');
  });
}
