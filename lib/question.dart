import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String texto;
  Question(this.texto,
      {required int questionSelect,
      required List<Map<String, Object>> question,
      required void responder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
