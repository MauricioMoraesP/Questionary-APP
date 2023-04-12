import 'package:flutter/material.dart';
import 'package:projectone/question.dart';
import 'answer.dart';

class Questionary extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionSelect;
  final void Function(int pontuacao) responder;

  Questionary({
    required this.question,
    required this.questionSelect,
    required this.responder,
  });

  bool get haveQuestionSelectedd {
    return questionSelect < question.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? respostas = haveQuestionSelectedd
        ? (question[questionSelect]['respostas'] as List<Map<String, Object>>?)
        : null;
    return Column(
      children: <Widget>[
        Question(
          question[questionSelect]['texto'].toString(),
          questionSelect: 0,
          question: [],
          responder: null,
        ),
        if (respostas != null)
          ...respostas
              .map((resp) => Answer(resp['texto'] as String,
                  () => responder(int.parse(resp['pontuação'].toString()))))
              .toList(),
      ],
    );
  }
}
