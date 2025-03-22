import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        temPerguntaSelecionada
            ? perguntas[perguntaSelecionada]['respostas'] as List<String>
            : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),

        ...respostas.map((t) => Resposta(t, responder)),
      ],
    );
  }
}
