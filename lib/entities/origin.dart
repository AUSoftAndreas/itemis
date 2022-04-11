/// Base clas for all kinds of origins.
abstract class Origin {
  /// Returns the import duty for this origin.
  int get importDuty;
}

/// Goods are of domestic origin.
class DomesticOrigin implements Origin {
  const DomesticOrigin();

  @override
  int get importDuty => 0;
}

/// Goods are of international origin
class InternationalOrigin implements Origin {
  const InternationalOrigin();

  @override
  int get importDuty => 5;
}
