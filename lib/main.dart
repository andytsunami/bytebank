import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FormularioTransferencia());
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferencias"),
      ),
      body: Column(children: <Widget>[
        ItemTransferencia(Transferencia(1.000, 1000)),
        ItemTransferencia(Transferencia(2.000, 1000)),
        ItemTransferencia(Transferencia(3.000, 1000)),
        ItemTransferencia(Transferencia(4.000, 1000)),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
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

  @override
  String toString() {
    return 'Transferencia{_valor: $_valor, _conta: $_conta}';
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario Transferencia"),
      ),
      body: Builder(
        builder: (BuildContext ctx){
          return Column(
            children: <Widget>[
              Editor(rotulo: "Numero da conta", dica: "000", controlador: _controladorCampoNumeroConta),
              Editor(rotulo: "Valor",dica: "0.00", controlador: _controladorCampoValor,icone: Icons.monetization_on),
              RaisedButton(
                child: Text("Confirmar"),
                onPressed: () {
                  final int conta = int.tryParse(_controladorCampoNumeroConta.text);
                  final double valor = double.tryParse(_controladorCampoValor.text);

                  if (valor != null && conta != null) {
                    final transferenciaCriada = Transferencia(valor, conta);
                    debugPrint("$transferenciaCriada");

                    Scaffold.of(ctx).showSnackBar(SnackBar(
                      content: Text("$transferenciaCriada"),
                    ));

                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}

class Editor extends StatelessWidget{

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextField(
       controller: this.controlador,
       style: TextStyle(fontSize: 24.0),
       decoration: InputDecoration(
           labelText: rotulo, hintText: dica, icon: icone != null ? Icon(icone) : null),
       keyboardType: TextInputType.number,
     ),
   );
  }




}
