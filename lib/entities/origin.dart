/// Base clas for all kinds of origins.
abstract class Origin {
  /// Returns the import duty for this origin.
  int get importDutyRate;
}

/// Goods are of domestic origin.
class DomesticOrigin implements Origin {
  const DomesticOrigin();

  @override
  int get importDutyRate => 0;
}

/// Goods are of international origin
class InternationalOrigin implements Origin {
  const InternationalOrigin();

  @override
  int get importDutyRate => 500;
}
