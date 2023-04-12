import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String texto;
  final void Function() onSelection;
  Answer(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        child: Text(texto),
        onPressed: onSelection,
      ),
    );
  }
}
