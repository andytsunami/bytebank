import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencia(),
      theme: ThemeData(
        primaryColor: Colors.pink[800],
        accentColor: Colors.lightBlue[800],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[800],
          textTheme: ButtonTextTheme.primary,
        )
      )
    );
  }
}
