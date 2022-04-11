/// Base clas for all kinds of origins.
abstract class Origin {}

/// Goods are of domestic origin.
class DomesticOrigin implements Origin {
  const DomesticOrigin();
}

/// Goods are of international origin
class InternationalOrigin implements Origin {
  const InternationalOrigin();
}
