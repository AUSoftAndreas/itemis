import 'package:itemis/no1/entities/money.dart';
import 'package:test/test.dart';

void main() {
  test('Money can be constructed and has the expected attribute.', () {
    final money = const Money(2500000);
    expect(money.amount, 2500000);
  });

  test('Money getters for numerical formats are working', () {
    final money = const Money(255555);
    final asEuroDouble = money.asEuroDouble;
    expect(asEuroDouble, 25.5555);
    final asEuroInt = money.asEuroInt;
    expect(asEuroInt, 26);
    final asCentInt = money.asCentInt;
    expect(asCentInt, 2556);
    final asCentDouble = money.asCentDouble;
    expect(asCentDouble, 2555.55);
  });

  test('Money getters with String return value are working', () {
    final money = const Money(27255555);
    final asEuroStringWithoutSymbol = money.asEuroStringWithoutSymbol;
    expect(asEuroStringWithoutSymbol, '2.725,56');
    final asEuroStringWithSymbol = money.asEuroStringWithSymbol;
    expect(asEuroStringWithSymbol, '2.725,56 €');
  });

  test('Money getters with String return value are working', () {
    final money = const Money(12355);
    final asEuroStringWithoutSymbol = money.asEuroStringWithoutSymbol;
    expect(asEuroStringWithoutSymbol, '1,24');
    final asEuroStringWithSymbol = money.asEuroStringWithSymbol;
    expect(asEuroStringWithSymbol, '1,24 €');
  });
}
