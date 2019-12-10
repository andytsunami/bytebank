import 'package:bytebank/screens/seguro/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaSeguro(),
      theme: ThemeData(
        primaryColor: Colors.pink[800],
        accentColor: Colors.pink[400],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.pink[400],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
