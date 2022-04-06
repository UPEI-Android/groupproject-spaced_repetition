import 'package:flutter/material.dart';
// <<<<<<< HEAD
import 'package:provider/provider.dart';
// import 'package:spaced_repetition_app/models/question_class.dart';

import '../models/User.dart';
import '../models/question_class.dart';
import '../repositories/database.dart';
// =======
import 'package:spaced_repetition_app/helper_widgets/dialog_pop_up.dart';
// import 'package:spaced_repetition_app/questions/question_class.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spaced_repetition_app/screens/question_view_screen.dart';
// >>>>>>> dev

class QuestionListScreen extends StatelessWidget {
  late String cName;

  DatabaseAction? dbService;
  QuestionListScreen(String courseName) {
    this.cName = courseName;
    // List<Question> questionList = questionListAll.where((element) => element.courseName.toLowerCase() == cName.toLowerCase().trim()).toList();
    // this.questionList = questionListAll.where((element) => element.courseName.toLowerCase() == cName.toLowerCase().trim()).toList();

  }

  List<Widget> makeQuestionCards(
      BuildContext context, List<Question> questionList) {
    List<Widget> cards = [];

    print(cName.toLowerCase());
    if (questionList.length == 0) {
      //If the user has no courses created
      //This will be displayed instead
      cards.add(Center(
          child: Text(
        "You have no Questions, Create One!",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )));
    } else {
      for (int i = 0; i < questionList.length ; i++) {
        cards.add(Card(
            shadowColor: Colors.black,
            elevation: 10,
            margin: EdgeInsets.all(10.0),
            child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                tileColor: const Color(0xFFfdc3a9),
                leading: Icon(
                  Icons.art_track,
                  size: 40,
                ),
                isThreeLine: true,
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: () {

                  },
                ),
                title: Text("Question: ${questionList[i].questionText}?",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                subtitle: Text(
                    "Next Due On: ${questionList[i].nextReview.day}/${questionList[i].nextReview.month}/${questionList[i].nextReview.year}",),
                onTap: () {
                  //SnackBarCreator().showSnackBar(context, "You pressed me");
                  pushNewScreen(
                    context,
                    screen: QuestionViewScreen(questionList[i]),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                })));
      }
    }

    return cards;
  }

  void printValues(String value1, String value2, String value3, int value4)
  {
    dbService?.addQuestion(cName, value2, value3, value4);
    print("${value1}, ${value2}, ${value3}, ${value4}");

  }
  ///This would eventually in the end use the a Cubit that will
  ///Take in a string course name and return a list of questions
  ///objects that we can populate on the screen
  @override
  Widget build(BuildContext context) {
    dbService = Provider.of<DatabaseAction>(context, listen: false);
    UserData? usr = dbService?.getUser();
     List<Question>? questionList = usr?.indexCards;
    // List<Question>? questionListFilter = questionList?.where((element) => element.courseName.toLowerCase() == cName.toLowerCase().trim()).toList();
    // print(questionListFilter?.length);
    return StreamBuilder<UserData>(
        stream: DatabaseAction(uid: usr?.uid).userData,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        UserData? userData = snapshot.data;
        print(userData?.indexCards);
        questionList = userData?.indexCards;
        questionList = questionList?.where((element) => element.courseName.toLowerCase() == cName.toLowerCase().trim()).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text("${cName}"),
            centerTitle: true,
            backgroundColor: Colors.redAccent,
          ),
          body: Container(
            color: const Color(0xFFDC1A22),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Questions in the ${cName} course",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                    child: Text(
                      "There are currently ${questionList?.length} question(s) in this stack",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // TODO 5.3: Adding an New Question
                        ///Adding New Question to DB Logic Goes in here, Cubit will then
                        ///emit this widget to refresh and display the new course
                        ///in the ListView
                        DialogBoxCreator().createDialogBox(context, "question", printValues, cName);
                      },
                      child: Text("Add New Question")),
                  /*
              A "Delete Course" Button would follow here eventually once we can
              get the basic question functionality and spaced repetition algo.
              working
               */
                  Expanded(
                      child: SizedBox(
                        height: 200.0,
                        child: Scrollbar(
                          isAlwaysShown: true,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children:
                            makeQuestionCards(context, questionList!),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      }
      return CircularProgressIndicator();
    });


  }
}
