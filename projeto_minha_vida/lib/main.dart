import 'package:flutter/material.dart';
import 'package:projeto_minha_vida/resultado.dart';
import 'package:projeto_minha_vida/questionario.dart';

void main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  String nomeCompleto = '';
  String profissao = '';

  final List<Map<String, Object>> perguntas = const [
    {
      'texto': 'Qual o nome completo do aluno?',
      'respostas': ['João Silva', 'Carlos Oliveira', 'Ana Costa', 'Pedro Souza'],
      'correta': 'João Silva',
      'imagem': '../../assets/images/aluno.jpeg', // Caminho da imagem
    },
    {
      'texto': 'Qual sua data de nascimento?',
      'respostas': ['12/05/2000', '15/03/1995', '18/09/2001', '22/07/1998'],
      'correta': '12/05/2000',
      'imagem': '../../assets/images/data_nascimento.jpg', // Caminho da imagem
    },
    {
      'texto': 'Qual o nome do seu pai?',
      'respostas': ['José Silva', 'Carlos Souza', 'Manuel Costa', 'Antônio Silva'],
      'correta': 'José Silva',
      'imagem': '../assets/images/pai.jpg', // Caminho da imagem
    },
    {
      'texto': 'Qual o nome da sua mãe?',
      'respostas': ['Maria Silva', 'Juliana Costa', 'Ana Souza', 'Patrícia Oliveira'],
      'correta': 'Maria Silva',
      'imagem': '../assets/images/mae.jpeg', // Caminho da imagem
    },
    {
      'texto': 'Qual a profissão que deseja seguir?',
      'respostas': ['Médico', 'Engenheiro', 'Advogado', 'Professor'],
      'correta': 'Médico',
      'imagem': '../assets/images/profissao.jpg', // Caminho da imagem
    },
  ];

  void responder(String resposta) {
    if (perguntaSelecionada == 0) nomeCompleto = resposta;
    if (perguntaSelecionada == 4) profissao = resposta;

    setState(() {
      perguntaSelecionada++;
    });
  }

  void reiniciarJogo() {
    setState(() {
      perguntaSelecionada = 0;
      nomeCompleto = '';
      profissao = '';
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas'] as List<String>
        : [];
    String imagemAtual = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['imagem'] as String
        : '';

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey[850],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFA2C2E6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minha Vida - Jogo de Perguntas'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Exibindo a imagem acima da pergunta
                if (imagemAtual.isNotEmpty)
                  Image.asset(
                    imagemAtual,
                    width: 200,
                    height: 200,
                  ),
                SizedBox(height: 10), // Espaçamento entre a imagem e a pergunta
                temPerguntaSelecionada
                    ? Questionario(
                        perguntas: perguntas,
                        perguntaSelecionada: perguntaSelecionada,
                        responder: () {
                          responder(respostas[0]);
                        },
                      )
                    : Resultado(
                        nomeCompleto: nomeCompleto,
                        profissao: profissao,
                        reiniciarJogo: reiniciarJogo,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
