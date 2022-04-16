import 'package:itemis/no3/entities/catalog.dart';
import 'package:itemis/no3/entities/globbish.dart';
import 'package:itemis/no3/services/cli_interpreter.dart';
import 'package:itemis/no3/services/cli_interpreter_response.dart';
import 'package:test/test.dart';

void main() {
  test('Adding glob patterns', () {
    final globbish = Globbish();
    globbish.reset();
    var response = CliInterpreter.interpret('glob is I');
    expect(response, isA<CliInterpreterResponseDone>());
    response = CliInterpreter.interpret('prok is V');
    expect(response, isA<CliInterpreterResponseDone>());
    response = CliInterpreter.interpret('pish is X');
    expect(response, isA<CliInterpreterResponseDone>());
    response = CliInterpreter.interpret('tegj is L');
    expect(response, isA<CliInterpreterResponseDone>());
    response = CliInterpreter.interpret('hmpf is C');
    expect(response, isA<CliInterpreterResponseDone>());
    response = CliInterpreter.interpret('hyper is D');
    expect(response, isA<CliInterpreterResponseDone>());
    response = CliInterpreter.interpret('jmpf is M');
    expect(response, isA<CliInterpreterResponseDone>());
    expect(globbish.globToRoman, {
      'glob': 'I',
      'prok': 'V',
      'pish': 'X',
      'tegj': 'L',
      'hmpf': 'C',
      'hyper': 'D',
      'jmpf': 'M',
    });
  });

  test('Setting prices', () {
    final globbish = Globbish();
    final catalog = Catalog();
    globbish.reset();
    catalog.reset();
    CliInterpreter.interpret('glob is I');
    CliInterpreter.interpret('prok is V');
    CliInterpreter.interpret('pish is X');
    CliInterpreter.interpret('tegj is L');
    CliInterpreter.interpret('hmpf is C');
    CliInterpreter.interpret('hyper is D');
    CliInterpreter.interpret('jmpf is M');
    CliInterpreter.interpret('glob glob Silver is 34 Credits');
    CliInterpreter.interpret('glob prok Gold is 57800 Credits');
    CliInterpreter.interpret('pish Iron is 3910 Credits');
    expect(catalog.getPrice('Silver'), 17);
    expect(catalog.getPrice('Gold'), 14450);
    expect(catalog.getPrice('Iron'), 391);
  });

  test('Asking for number translations', () {
    final globbish = Globbish();
    final catalog = Catalog();
    globbish.reset();
    catalog.reset();
    CliInterpreter.interpret('glob is I');
    CliInterpreter.interpret('prok is V');
    CliInterpreter.interpret('pish is X');
    CliInterpreter.interpret('tegj is L');
    CliInterpreter.interpret('hmpf is C');
    CliInterpreter.interpret('hyper is D');
    CliInterpreter.interpret('jmpf is M');
    CliInterpreter.interpret('glob glob Silver is 34 Credits');
    CliInterpreter.interpret('glob prok Gold is 57800 Credits');
    CliInterpreter.interpret('pish Iron is 3910 Credits');
    var response = CliInterpreter.interpret('how much is pish tegj glob glob ?');
    expect(response, isA<CliInterpreterResponseAnswer>());
    expect((response as CliInterpreterResponseAnswer).answer, 'pish tegj glob glob is 42');
    response = CliInterpreter.interpret('how much is dumidum dumdida ?');
    expect(response, isA<CliInterpreterResponseUnknownCommand>());
  });

  test('Asking for prices', () {
    final globbish = Globbish();
    final catalog = Catalog();
    globbish.reset();
    catalog.reset();
    CliInterpreter.interpret('glob is I');
    CliInterpreter.interpret('prok is V');
    CliInterpreter.interpret('pish is X');
    CliInterpreter.interpret('tegj is L');
    CliInterpreter.interpret('hmpf is C');
    CliInterpreter.interpret('hyper is D');
    CliInterpreter.interpret('jmpf is M');
    CliInterpreter.interpret('glob glob Silver is 34 Credits');
    CliInterpreter.interpret('glob prok Gold is 57800 Credits');
    CliInterpreter.interpret('pish Iron is 3910 Credits');
    var response = CliInterpreter.interpret('how many Credits is glob prok Silver ?');
    expect(response, isA<CliInterpreterResponseAnswer>());
    expect((response as CliInterpreterResponseAnswer).answer, 'glob prok Silver is 68 Credits');
    response = CliInterpreter.interpret('how many Credits is hmpf Gold ?');
    expect((response as CliInterpreterResponseAnswer).answer, 'hmpf Gold is 1445000 Credits');
  });
}
