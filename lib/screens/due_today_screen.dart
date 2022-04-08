import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaced_repetition_app/models/question_class.dart';

// import 'package:spaced_repetition_app/questions/question_class.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spaced_repetition_app/screens/question_view_screen.dart';

import '../helper_widgets/search_bar.dart';
import '../models/User.dart';
import '../repositories/database.dart';

///This Screen shows the Questions the user will have due on the
///current day.
class DueTodayScreen extends StatelessWidget {
  DatabaseAction? dbService;

  DueTodayScreen();

  List<Widget> makeQuestionCards(
      BuildContext context, List<Question> questionList) {
    List<Widget> cards = [];

    if (questionList.length == 0) {
      //If the user has no courses created
      //This will be displayed instead
      cards.add(Center(
          child: Text(
        "You have no Questions due today",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )));
    } else {
      for (int i = 0; i < questionList.length; i++) {
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
                title: Text("Question: ${questionList[i].questionText}?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                subtitle: Text(
                  "Next Due On: ${questionList[i].nextReview.day}/${questionList[i].nextReview.month}/${questionList[i].nextReview.year}",
                ),
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

  @override
  Widget build(BuildContext context) {
    ///A cubit that returns a list of questions that are due on the current day
    ///Just pass it into the variable "dueTodayList"
    ///  DatabaseAction? dbService;
    dbService = Provider.of<DatabaseAction>(context, listen: false);
    UserData? usr = dbService?.getUser();
    List<Question>? dueTodayList = usr?.indexCards;
    // List<Question> dueTodayList = [];
    return StreamBuilder<UserData>(
        stream: DatabaseAction(uid: usr?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            print(userData?.indexCards);
            dueTodayList = userData?.indexCards;
            dueTodayList = dueTodayList
                ?.where(
                    (element) => element.nextReview.day == DateTime.now().day)
                .toList();
            return Scaffold(
              body: Container(
                color: const Color(0xFFDC1A22),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                        child: Text(
                          "Questions Due Today",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
                        child: Text(
                          "There are currently ${dueTodayList?.length} questions",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AnimatedSearchBar(),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 200.0,
                        child: Scrollbar(
                          isAlwaysShown: true,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: makeQuestionCards(context, dueTodayList!),
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
