import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      body: ListaTransferencia(),
      appBar: AppBar(
        title: Text("Transferencias"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    )));

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ItemTransferencia(Transferencia(1.000, 1000)),
      ItemTransferencia(Transferencia(2.000, 1000)),
      ItemTransferencia(Transferencia(3.000, 1000)),
      ItemTransferencia(Transferencia(4.000, 1000)),
      ItemTransferencia(Transferencia(5.000, 1000)),
      ItemTransferencia(Transferencia(6.000, 1000)),
      ItemTransferencia(Transferencia(7.000, 1000)),
    ]);
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia._valor.toString()),
        subtitle: Text(this._transferencia._conta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double _valor;
  final int _conta;

  Transferencia(this._valor, this._conta);
}
