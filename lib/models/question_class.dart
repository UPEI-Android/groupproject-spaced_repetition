import 'package:flutter/material.dart';

class Question{
  final String questionText;
  final String answerText;
  final int step;
  final int duration;
  final DateTime nextReview;
  const Question(this.questionText,this.answerText,this.step,this.duration,this.nextReview);
  factory Question.fromMap(Map<dynamic,dynamic> map ){
    String questionText = map ['questionText'] as String;
    String answerText = map ['answerText'] as String;
    int step = map ['step'] as int;
    int duration = map['duration'] as int;
    DateTime nextReview = map['nextReview'] as DateTime;
    return Question(questionText, answerText, step, duration,  nextReview);
  }
}