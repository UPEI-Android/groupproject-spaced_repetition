import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///This is the question class.
///This class contains the question, the answer and the chosen date that the question will pop up.
///The date will be chosen by divide the input of the time interval the user want
///by 10-20-40-70-100% of the interval based on the spaced repetition method.

class Question{
  //question related
  String _questionText;
  String _answerText;

  //date related
  int _period;
  String nextDate;
  int temp1 = 10;
  int temp2 = 0;
  int skip = 0;
  dynamic chosenDate;
  dynamic finalDate;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  //constructor for question class
  Question(this._questionText, this._answerText, this._period, this.nextDate){}

  //get the question
  String get questionText => _questionText;

  //set the question text
  set questionText(String value) {_questionText = value;}

  //get the answer
  String get answerText => _answerText;

  //set the answer text
  set answerText(String value) {_answerText = value;}

  //get the period of time
  int get period => _period;

  //set the period of time the question will show up and set the final date right after
  set period(int value) {
    _period = value;
    finalDate = DateTime.now().add(Duration(days: _period));
  }

  //get the next date the question will show up. String nextDate can be changed into datetime if needed
  String get getNextDate{ return nextDate;}

  //Choose the next dates for the question to pop up depending on if the user remember the answer. Always set (remember = true) when the user set up the question for the 1st time
  void choosingNextDate(bool remember){
    if(remember == true){ //if the user remembers the answer
      temp1 = temp1 + temp2;
      skip = (period*(temp1/100)).toInt();
      while(skip == 0){ //if the period is less than 10 days, some first skipped day will be 0 so we need to keep increasing "skip" to at least 1
        temp1 = temp1 + temp2;
        skip = (period*(temp1/100)).toInt();
        temp2 = temp2 + 10;
      }
      chosenDate = DateTime.now().add(Duration(days: skip));
      nextDate = formatter.format(chosenDate);
      temp2 = temp2 + 10;
    }
    else if (remember == false){ //if the user doesn't remember the answer
      if (period < 10){ //if the time period is less than 10 days, the next date will always be the next day
        chosenDate = DateTime.now().add(Duration(days: 1));
      }
      else{//if the time period is 10 days or more, the next date will be 10% of the period from now
        chosenDate = DateTime.now().add(Duration(days: (period*0.1).toInt()));
      }
      nextDate = formatter.format(chosenDate);
    }
    //check if time period is reached. If not, move on. If yes, next time the question show up will be the final date of the period
    if(chosenDate.isAfter(finalDate)){
      nextDate = formatter.format(finalDate);
    }
  }

}