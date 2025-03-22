import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String nomeCompleto;
  final String profissao;
  final void Function() reiniciarJogo; // Função para reiniciar o jogo

  const Resultado({
    super.key,
    required this.nomeCompleto,
    required this.profissao,
    required this.reiniciarJogo, // Recebe a função de reiniciar o jogo
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mensagem final do jogo
          Text(
            'Parabéns, caro $profissao $nomeCompleto, você concluiu o jogo!',
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Botão para reiniciar o jogo
          ElevatedButton(
            onPressed: reiniciarJogo, // Chama a função de reiniciar o jogo
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA2C2E6), // Azul pastel
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ),
            child: const Text(
              'Reiniciar Jogo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
