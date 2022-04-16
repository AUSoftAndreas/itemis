import 'dart:convert';
import 'dart:io';

import 'package:itemis/no3/services/cli_interpreter.dart';
import 'package:itemis/no3/services/cli_interpreter_response.dart';

void main(List<String> arguments) {
  String? line;
  line = stdin.readLineSync(encoding: utf8);
  while (line != null) {
    line = line.trim();
    final response = CliInterpreter.interpret(line);
    if (response is CliInterpreterResponseDone) {
    } else if (response is CliInterpreterResponseExit) {
      break;
    } else if (response is CliInterpreterResponseUnknownCommand) {
      print('I have no idea what you are talking about');
    } else if (response is CliInterpreterResponseAnswer) {
      print(response.answer);
    } else {
      throw Exception('Unknown response: $response');
    }
    line = stdin.readLineSync(encoding: utf8);
  }
}
