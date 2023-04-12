import 'package:flutter/material.dart';
import 'package:projectone/result.dart';
import './questionary.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _questionSelect = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuação': 2},
        {'texto': 'Vermelho', 'pontuação': 4},
        {'texto': 'Verde', 'pontuação': 8},
        {'texto': 'Branco', 'pontuação': 1}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuação': 10},
        {'texto': 'Cobra', 'pontuação': 5},
        {'texto': 'Girafa', 'pontuação': 3},
        {'texto': 'Leão', 'pontuação': 1}
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', "pontuação": 10},
        {'texto': 'João', "pontuação": 5},
        {'texto': 'Leo', "pontuação": 3},
        {'texto': 'Pedro', "pontuação": 2},
      ]
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _questionSelect++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _questionSelect = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get haveQuestionSelected {
    return _questionSelect < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = haveQuestionSelected
        ? (_perguntas[_questionSelect]['respostas']
            as List<Map<String, Object>>)
        : [];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: haveQuestionSelected
              ? Questionary(
                  question: _perguntas,
                  questionSelect: _questionSelect,
                  responder: _responder,
                )
              : Result(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
