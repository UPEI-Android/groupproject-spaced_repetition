import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spaced_repetition_app/screens/question_list_screen.dart';
import 'package:spaced_repetition_app/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen() : super();

  List<Widget> makeListCards(BuildContext context, List<String> courseList) {
    List<Widget> cards = [];
    for (int i = 0; i < courseList.length; i++) {
      cards.add(Card(
          shadowColor: Colors.black,
          margin: EdgeInsets.all(10.0),
          child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              tileColor: Colors.yellowAccent,
              leading: Icon(
                Icons.school,
                size: 30,
              ),
              title: Text(courseList[i],
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                pushNewScreen(
                  context,

                  ///This would eventually in the end use the a Cubit that will
                  ///Take in a string course name and return a list of questions
                  ///objects that we can populate on the screen
                  screen: QuestionListScreen(courseList[i]),
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              })));
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    ///Dummy List for presentation
    ///This list will be replaced by a list provided by a cubit
    List<String> list = [
      "Mathematics",
      "Physics",
      "Chemistry",
      "Biology",
      "Programming",
      "Swimming",
      "Writing",
      "Singing"
    ];

    return Scaffold(
      body: Container(
        color: const Color(0xFFDC1A22),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 80.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Text(
                  ///Display name would be provided by DB
                  ///Please include a method in the cubit to place it in here
                  "Welcome <DISPLAY NAME HERE>!",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: Text(
                  "Here are your courses",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    ///Adding New Course Logic Goes in here, Cubit will then
                    ///emit this widget to refresh and display the new course
                    ///in the ListView
                  },
                  child: Text("Add New Course")),
              Expanded(
                  child: SizedBox(
                height: 200.0,
                child: Scrollbar(
                  isAlwaysShown: true,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: makeListCards(context, list),
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
