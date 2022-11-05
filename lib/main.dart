// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './questionario.dart';

import './resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontosTotais = 0;

  final List<Map<String, Object>> _pergunta = const [
    {
      'texto': 'Qual sua cor?',
      'resposta': [
        {'texto': 'preto', 'pontos': 10},
        {'texto': 'vermelho', 'pontos': 7},
        {'texto': 'rosa', 'pontos': 5},
        {'texto': 'roxo', 'pontos': 3},
      ]
    },
    {
      'texto': 'Qual seu nome?',
      'resposta': [
        {'texto': 'jota', 'pontos': 10},
        {'texto': 'beto', 'pontos': 7},
        {'texto': 'lu', 'pontos': 5},
        {'texto': 'lai', 'pontos': 3},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'cao', 'pontos': 10},
        {'texto': 'leao', 'pontos': 7},
        {'texto': 'vaca', 'pontos': 5},
        {'texto': 'veado', 'pontos': 3},
      ]
    },
    {
      'texto': 'Qual é o seu objeto favorito?',
      'resposta': [
        {'texto': 'porta', 'pontos': 10},
        {'texto': 'chave', 'pontos': 7},
        {'texto': 'ferro', 'pontos': 5},
        {'texto': 'livro', 'pontos': 3},
      ]
    }
  ];
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontosTotais += pontuacao;
      });
    }
  }

  void _reiniciarApp() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontosTotais = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _pergunta,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontosTotais, _reiniciarApp),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
