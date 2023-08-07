import 'package:flutter/material.dart';
import './question.dart';
import 'package:hexcolor/hexcolor.dart';

class Result extends StatelessWidget {
  final double resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    final score = num.parse(resultScore.toStringAsFixed(2));
    //nadam sse da ne o da objašnjavam 💀
    if (score <= 10.00) {
      resultText = 'Imaš $score pojena 💀! \n Odgledaj ponovo Voyageta';
    } else if (score > 10.00 && score <= 25.00) {
      resultText = 'Video si prvi put i imaš $score pojena ! ';
    } else if (score > 25.00 && score <= 40.00) {
      resultText = 'Imaš $score poena 💜! \n Dobra si osoba';
    } else {
      resultText = 'Imaš $score pojena! \n Pozovi psihologa, treba ti 💀💀!';
    }

    return resultText;
  }

  //ovo dugme zaa ponovo pokretannje kviza
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: 360,
                      child: Question(
                        resultPhrase,
                      ),
                    )),
                ElevatedButton(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      'PONOVO!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: HexColor("#FEFEFE"),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple)),
                  onPressed: resetHandler,
                )
              ],
            )));
  }
}
