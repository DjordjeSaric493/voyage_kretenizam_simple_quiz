import "package:flutter/material.dart";
import "package:hexcolor/hexcolor.dart";
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//lista sa pitanjima , broji od nule
class _MyAppState extends State<MyApp> {
  static const _data = [
    {
      'questionText': '1. Znaš koja je šansa da se ti rodiš?',
      'answers': [
        {'text': 'Mala', 'score': -2},
        {'text': 'Abnormalno mala', 'score': 10},
        {'text': 'Pola-pola', 'score': -2},
        {'text': 'Velika', 'score': -2},
      ]
    },
    {
      'questionText': '2. Nastavi dalje: Jer imaš?',
      'answers': [
        {'text': 'Milion kao nekih drugih', 'score': -2},
        {'text': 'Milion kao  drugih drugih bukvalno kao ', 'score': -2},
        {
          'text': 'Milion tih kao nekih drugih drugih bukvalno ko ko',
          'score': 10
        },
        {
          'text': 'Milion tih kao nekih drugih drugih bukvalno isto ko ko',
          'score': 0
        },
      ]
    },
    {
      'questionText': ' 3. Nastavi dalje: Koji se:',
      'answers': [
        {'text': 'Bore', 'score': -2},
        {'text': 'Takmiče', 'score': 10},
        {'text': 'Trkaju', 'score': -2},
        {'text': 'Trude', 'score': -2},
      ]
    },
    {
      'questionText': '4. Nastavi dalje: Da dođuu do toga da se:',
      'answers': [
        {'text': 'rode', 'score': 10},
        {'text': 'pojave', 'score': -2},
        {'text': 'stvore', 'score': -2},
        {'text': 'ožive', 'score': -2},
      ]
    },
    {
      'questionText': '5. Nastavi dalje: I kao baš si see ti:',
      'answers': [
        {
          'text': 'Pronašao',
          'score': -2,
        },
        {'text': 'Rodio', 'score': 10},
        {'text': 'Stvorio', 'score': -2},
      ]
    }
  ];
//index i skor
  var _indexQuestion = 0;
  double _totalScore = 0.00;

  void _answerQuestion(double score) {
    _totalScore += score;
    //stanje widgeta->kako se menja index, prebacuje na drugi
    setState(() {
      _indexQuestion += 1;
    });
  }

  //restartuje sve
  void _restart() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  //front end deo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              title: Image.asset("asseti\blejaž.jpg", width: 140, scale: 0.4)
              /*  Align(
              alignment: Alignment.center,
              child: Text(
                "Voyage Đinđara mim motivejšnl quiz",
                style: TextStyle(
                  color: HexColor("#F5FFF0"),
                ),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 39, 231, 0), */
              ),
          body: Align(
              alignment: Alignment.center,
              //teraj kviz akko nisi sve odgovorio
              child: (_indexQuestion <= 4 && _indexQuestion >= 0)
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      indexQuestion: _indexQuestion,
                      data: _data)
                  //u suprotnom prikaži rezultat pa posle restartuj sve
                  : Result(_totalScore, _restart))),
    );
  }
}
