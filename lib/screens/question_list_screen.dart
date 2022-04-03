import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaced_repetition_app/models/question_class.dart';

import '../models/User.dart';
import '../repositories/database.dart';

class QuestionListScreen extends StatelessWidget {

  late String cName;

  QuestionListScreen(String  courseName)
  {
    this.cName = courseName;
  }

  ///This would eventually in the end use the a Cubit that will
  ///Take in a string course name and return a list of questions
  ///objects that we can populate on the screen
  @override
  Widget build(BuildContext context) {
    DatabaseAction dbService = Provider.of<DatabaseAction>(context, listen: false);
    UserData usr = dbService.getUser();
    //TODO 6: Retrieve the Questions related to the CourseName
    /*
    A cubit that manages this state and retrieves all the questions with the
    cName (course name) variable. It will use this string to return a list of
    Questions (the variable questionList will hold this list) and then populate them on screen.
    This screen will be update to work with this functionality once TODO 6 has
    been reached and completed
     */
    List<Question> questionsList = [];

    return Scaffold(
      appBar: AppBar(
        title: Text("${cName}"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: const Color(0xFFDC1A22),
      body: Center(child: Text("This is the ${cName} Question List page")),
    );
  }
}
