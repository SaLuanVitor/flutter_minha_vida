import 'package:flutter/material.dart';

class Questao extends StatelessWidget{
  final String texto;

  const Questao(this.texto, {super.key});

  @override
    Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(50),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
    }
  }
