class Seguro {
  final double valor;
  final int conta;

  Seguro(
    this.valor,
    this.conta,
  );

  @override
  String toString() {
    return 'Transferencia{_valor: $valor, _conta: $conta}';
  }
}