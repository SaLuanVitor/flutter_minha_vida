import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10), // Ajustando a margem para um layout mais bonito
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFA2C2E6), // Azul pastel
          foregroundColor: Colors.black, // Cor do texto do botão
          elevation: 5,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bordas arredondadas no botão
          ),
          
        ),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 16, // Tamanho de fonte um pouco maior
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
