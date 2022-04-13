/// The regulations regarding VAT applicable to the product
abstract class Vat {
  /// Returns the VAT rate of the product in 100th percent.
  /// (A value of 100 means 1% VAT).
  int get vatRate;
}

/// Full VAT rate for the product
class FullVat implements Vat {
  /// Constructs an object representing a full VAT rate.
  const FullVat();

  @override
  int get vatRate => 1000; // 10%
}

/// Reduced VAT rate for the product
class ReducedVat implements Vat {
  /// Constructs an object representing a reduced VAT rate.
  const ReducedVat();

  @override
  int get vatRate => 500; // 5%
}

/// No VAT rate for the product
class NoVat implements Vat {
  /// Constructs an object representing a no VAT rate.
  const NoVat();

  @override
  int get vatRate => 0; // 0%
}
