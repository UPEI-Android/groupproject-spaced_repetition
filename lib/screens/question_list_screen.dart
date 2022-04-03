import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/helper_widgets/dialog_pop_up.dart';
import 'package:spaced_repetition_app/questions/question_class.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spaced_repetition_app/screens/question_view_screen.dart';

class QuestionListScreen extends StatelessWidget {
  late String cName;

  QuestionListScreen(String courseName) {
    this.cName = courseName;
  }

  List<Widget> makeQuestionCards(
      BuildContext context, List<Question> questionList) {
    List<Widget> cards = [];

    if (questionList.length == 0) {
      //If the user has no courses created
      //This will be displayed instead
      cards.add(Center(
          child: Text(
        "You have no Questions, Create One!",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )));
    } else {
      for (int i = 0; i < questionList.length; i++) {
        cards.add(Card(
            shadowColor: Colors.black,
            margin: EdgeInsets.all(10.0),
            child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                tileColor: Colors.orange,
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
                    // TODO 5.2: Deleting a Question
                    ///Deleting a question from DB Logic Goes in here,
                    ///A Cubit function will take the question object
                    ///and then search through the database to
                    ///delete it from the users DB and will then
                    ///emit this widget to refresh and display the updated
                    ///course list
                    ///in the ListView
                  },
                ),
                title: Text("Question: ${questionList[i].questionText}?",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
    print("${value1}, ${value2}, ${value3}, ${value4}");
  }
  ///This would eventually in the end use the a Cubit that will
  ///Take in a string course name and return a list of questions
  ///objects that we can populate on the screen
  @override
  Widget build(BuildContext context) {
    //TODO 6: Retrieve the Questions related to the CourseName
    /*
    A cubit that manages this state and retrieves all the questions with the
    cName (course name) variable. It will use this string to return a list of
    Questions (the variable questionList will hold this list) and then populate them on screen.
    This screen will be update to work with this functionality once TODO 6 has
    been reached and completed
     */

    //Dummy List for reference
    List<Question> questionsListFromCubit = [
      Question(
          questionText:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quam ligula, varius et efficitur nec, faucibus at lorem. In ut turpis nec mi pellentesque hendrerit. Maecenas vitae lectus nec nisi accumsan hendrerit. Suspendisse sed neque eget lectus condimentum porta. Praesent scelerisque sollicitudin nunc, sed tristique nibh dapibus ut. Nunc et nunc sit amet purus bibendum mollis. Fusce neque elit, molestie vitae est sed, vulputate aliquet eros. Integer fermentum tincidunt erat ut dapibus.",
          answerText: "Ninja Gaiden",
          courseName: cName,
          step: 1,
          duration: 14,
          nextReview: DateTime.now()),
      Question(
          questionText: "I am a man who likes to do nothing, what am I",
          answerText: "Demi",
          courseName: cName,
          step: 1,
          duration: 14,
          nextReview: DateTime.now()),
      Question(
          questionText: "Who has the greatest car in the Universe",
          answerText: "Batman",
          courseName: cName,
          step: 1,
          duration: 14,
          nextReview: DateTime.now()),
      Question(
          questionText:
              "I am the greatest ninja alive and my name starts with Ryu",
          answerText: "Ninja Gaiden",
          courseName: cName,
          step: 1,
          duration: 14,
          nextReview: DateTime.now()),

    ]; //Question list goes here

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
                  "There are currently ${questionsListFromCubit.length} questions",
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
                        makeQuestionCards(context, questionsListFromCubit),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
