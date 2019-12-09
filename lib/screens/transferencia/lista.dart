import 'package:bytebank/models/transferencia/transferencia.dart';
import 'package:flutter/material.dart';
import 'formulario.dart';

const _tituloAppBar = "Transferencias";

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _atualiza(transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          widget._transferencias.add(transferenciaRecebida);
        });
      });
    }
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
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}
