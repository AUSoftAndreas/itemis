import 'package:itemis/entities/money.dart';
import 'package:test/test.dart';

void main() {
  test('Money can be constructed and has the expected attribute.', () {
    final money = Money(2500000);
    expect(money.amount, 2500000);
  });
}
