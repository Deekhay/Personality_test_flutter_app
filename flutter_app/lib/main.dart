import 'package:flutter/material.dart';
import 'package:flutter_app/quiz.dart';
import 'package:flutter_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    // throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favourite colour?',
      'answers': [
        {'text': 'Red', 'score': 7},
        {'text': 'Blue', 'score': 3},
        {'text': 'Black', 'score': 5},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 5},
        {'text': 'Lion', 'score': 1}
      ]
    },
    {
      'questionText': 'Who is your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 7},
        {'text': 'Kay', 'score': 4},
        {'text': 'Lovina', 'score': 6},
        {'text': 'Angela', 'score': 2}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    //set state recalls the build widget to rebuild the UI
    // when the resetQuiz function is called.
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerChosen(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('You did it!');
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerChosen: _answerChosen,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
