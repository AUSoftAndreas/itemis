abstract class Vat {
  int get vat;
}

class FullVat implements Vat {
  const FullVat();

  @override
  int get vat => 10;
}

class ReducedVat implements Vat {
  const ReducedVat();

  @override
  int get vat => 5;
}

class NoVat implements Vat {
  const NoVat();

  @override
  int get vat => 0;
}
