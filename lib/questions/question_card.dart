import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/questions/question_class.dart';

///This will serve as a widget to display a question on the UI of the app

class QuestionCard{

  late Question questionValue;
  QuestionCard(Question question)
  {
    this.questionValue = question;
  }

}
