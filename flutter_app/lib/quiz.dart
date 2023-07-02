import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerChosen;
  final int questionIndex;

  Quiz(
      {required this.answerChosen,
      required this.questions,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
        questions[questionIndex]['questionText'],
      ),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        //using anonymous functions to pass in argurments to void functions.
        return Answer(() => answerChosen(answer['score']), answer['text']);
      }).toList(),
    ]);
  }
}
