import 'package:itemis/entities/money.dart';
import 'package:test/test.dart';

void main() {
  test('Money can be constructed and has the expected attribute.', () {
    final money = Money(2500000);
    expect(money.amount, 2500000);
  });

  test('Money getters are working', () {
    final money = Money(255555);
    final asEuroDouble = money.asEuroDouble;
    expect(asEuroDouble, 25.5555);
    final asEuroInt = money.asEuroInt;
    expect(asEuroInt, 26);
    final asCentInt = money.asCentInt;
    expect(asCentInt, 2556);
    final asCentDouble = money.asCentDouble;
    expect(asCentDouble, 2555.55);
    // final asEuroStringWithSymbol = money.asEuroStringWithSymbol;
    // expect(asEuroStringWithSymbol, '25,56 €');
  });
}
