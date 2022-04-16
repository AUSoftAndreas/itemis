import 'package:equatable/equatable.dart';

/// Base class for all CLI interpreter responses.
abstract class CliInterpreterResponse {}

/// Response for an unknown command.
class CliInterpreterResponseUnknownCommand implements CliInterpreterResponse {}

/// Reponse if the instruction was understood and acted upon
class CliInterpreterResponseDone implements CliInterpreterResponse {}

/// Response if the instruction was understood and acted upon and there is a response answer for the user
class CliInterpreterResponseAnswer extends Equatable implements CliInterpreterResponse {
  /// The answer to the user.
  final String answer;

  /// Constructs this answer to the user
  const CliInterpreterResponseAnswer(this.answer);

  /// Equatable
  @override
  List<Object> get props => [answer];
}

/// Response if the user wanted the application to end
class CliInterpreterResponseExit implements CliInterpreterResponse {}
