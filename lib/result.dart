import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void Function() reinicarQuestionario;

  Result(this.pontuacao, this.reinicarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28, color: Colors.red),
          ),
        ),
        TextButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          onPressed: reinicarQuestionario,
        )
      ],
    );
  }
}
