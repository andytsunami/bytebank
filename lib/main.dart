import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: <Widget>[
          Text(
            'Bem vindo ao ByteBank',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Palmeiras não tem mundial!',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Palmeiras não tem mundial!',
            textDirection: TextDirection.ltr,
          ),
          Column(
            children: <Widget>[
              Text(
                "Texto filho.....",
                textDirection: TextDirection.ltr,
              )
            ],
          )
        ],
      ),
    );
