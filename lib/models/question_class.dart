import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Question{
  final String questionText;
  final String answerText;
  final String courseName;
  final int step;
  final int duration;
  final DateTime nextReview;
  const Question(this.questionText,this.answerText,this.courseName,this.step,this.duration,this.nextReview);
  factory Question.fromMap(Map<dynamic,dynamic> map ){
    if(map['questionText'] == null){
      return Question('default', 'default','default',0,0, DateTime.now());
    }
    else{

      String questionText = map ['questionText'] as String;
      String answerText = map ['answerText'] as String;
      String courseName = map['courseName'] as String;
      int step = map ['step'] as int;
      int duration = map['duration'] as int;

      DateTime nextReview = (map['nextReview'] as Timestamp).toDate();

      return Question(questionText, answerText, courseName, step, duration,  nextReview);
    }

  }
  Map toJson() => {
    'questionText' : questionText,
    'answerText' : answerText,
    'courseName' : courseName,
    'step' : step,
    'duration' : duration,
    'nextReview' : nextReview
  };
}