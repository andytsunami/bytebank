class Transferencia {
  final double valor;
  final int conta;

  Transferencia(
    this.valor,
    this.conta,
  );

  @override
  String toString() {
    return 'Transferencia{_valor: $valor, _conta: $conta}';
  }
}