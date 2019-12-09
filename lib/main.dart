import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaTransferencia());
  }
}

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencias = List();


  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferencias"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();

          }));
          future.then((transferenciaRecebida){
            if(transferenciaRecebida != null){
              widget._transferencias.add(transferenciaRecebida);
            }
            debugPrint("Entrou no then???");
            debugPrint("$transferenciaRecebida");
          });
        },
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

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State{

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
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Editor(rotulo: "Numero da conta", dica: "000", controlador: _controladorCampoNumeroConta),
                Editor(rotulo: "Valor",dica: "0.00", controlador: _controladorCampoValor,icone: Icons.monetization_on),
                RaisedButton(
                  child: Text("Confirmar"),
                  onPressed: () => _criaTransferencia(ctx),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _criaTransferencia(BuildContext ctx) {
    final int conta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (valor != null && conta != null) {
      final transferenciaCriada = Transferencia(valor, conta);
      debugPrint("$transferenciaCriada");
      Navigator.pop(ctx, transferenciaCriada);

      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text("$transferenciaCriada"),
      ));

    }
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


