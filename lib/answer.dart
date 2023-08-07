import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  //widget za odgovor kao dugme
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        width: 250,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[900])),
      onPressed: selectHandler,
    );
  }
}
