/// Base clas for all kinds of origin markers.
abstract class Origin {
  /// Returns the import duty for this origin.
  int get importDutyRate;
}

/// Marker showing that the good which owns it, is a domestic good.
class DomesticOrigin implements Origin {
  /// Contructs a "domestic origin" marker.
  const DomesticOrigin();

  @override
  int get importDutyRate => 0;
}

/// Marker showing that the good which owns it, is an international good.
class InternationalOrigin implements Origin {
  /// Contructs a "international origin" marker.
  const InternationalOrigin();

  @override
  int get importDutyRate => 500;
}
