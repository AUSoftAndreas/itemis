/// The regulations regarding VAT applicable to the product
abstract class Vat {
  /// Returns the VAT rate of the product in 100th percent.
  /// (A value of 100 means 1% VAT).
  int get vatRate;
}

/// Full VAT rate for the product
class FullVat implements Vat {
  const FullVat();

  @override
  int get vatRate => 1000; // 10%
}

/// Reduced VAT rate for the product
class ReducedVat implements Vat {
  const ReducedVat();

  @override
  int get vatRate => 500; // 5%
}

/// No VAT rate for the product
class NoVat implements Vat {
  const NoVat();

  @override
  int get vatRate => 0; // 0%
}
