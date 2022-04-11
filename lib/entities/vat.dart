/// The regulations regarding VAT applicable to the product
abstract class Vat {
  /// Returns the VAT rate of the product
  int get vat;
}

/// Full VAT rate for the product
class FullVat implements Vat {
  const FullVat();

  @override
  int get vat => 10;
}

/// Reduced VAT rate for the product
class ReducedVat implements Vat {
  const ReducedVat();

  @override
  int get vat => 5;
}

/// No VAT rate for the product
class NoVat implements Vat {
  const NoVat();

  @override
  int get vat => 0;
}
