import 'package:equatable/equatable.dart';

/// Base clas for all kinds of origin markers.
abstract class Origin {
  /// Returns the import duty for this origin.
  /// The import duty rate is represented in 100th of a percent.
  /// For example, a rate of 100 means 1% and a rate of 500 means 5%.
  int get importDutyRate;
}

/// Marker showing that the good which owns it, is a domestic good.
class DomesticOrigin extends Equatable implements Origin {
  /// Contructs a "domestic origin" marker.
  const DomesticOrigin();

  @override
  int get importDutyRate => 0;

  /// Equatable
  @override
  List<Object> get props => [];

  /// Equatable
  @override
  bool get stringify => true;
}

/// Marker showing that the good which owns it, is an international good.
class InternationalOrigin extends Equatable implements Origin {
  /// Contructs a "international origin" marker.
  const InternationalOrigin();

  @override
  int get importDutyRate => 500;

  /// Equatable
  @override
  List<Object> get props => [];

  /// Equatable
  @override
  bool get stringify => true;
}
