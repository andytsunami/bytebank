import 'package:bytebank/models/seguro/seguro.dart';
import 'package:flutter/material.dart';
import 'formulario.dart';

const _tituloAppBar = "Seguros";

class ListaSeguro extends StatefulWidget {
  final List<Seguro> _seguros = List();

  @override
  State<StatefulWidget> createState() {
    return ListaSeguroState();
  }
}

class ListaSeguroState extends State<ListaSeguro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._seguros.length,
        itemBuilder: (context, indice) {
          final seguro = widget._seguros[indice];
          return ItemSeguro(seguro);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioSeguro();
              },
            ),
          );
          future.then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _atualiza(seguroRecebido) {
    if (seguroRecebido != null) {
      Future.delayed(
        Duration(seconds: 1),
        () {
          setState(
            () {
              widget._seguros.add(seguroRecebido);
            },
          );
        },
      );
    }
  }
}

class ItemSeguro extends StatelessWidget {
  final Seguro _seguro;

  ItemSeguro(this._seguro);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_seguro.valor.toString()),
        subtitle: Text(_seguro.conta.toString()),
      ),
    );
  }
}
