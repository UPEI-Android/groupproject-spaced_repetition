import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/questions/question_class.dart';

///This Screen shows the Questions the user will have due on the
///current day.
class DueTodayScreen extends StatelessWidget {

  //late List<Question> dueTodayList;

  DueTodayScreen(/*List<Question> list*/);
  // {
  //   this.dueTodayList = list;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDC1A22),
      body: Center(child: Text("I am the Due Today Page")),
    );
  }
}
