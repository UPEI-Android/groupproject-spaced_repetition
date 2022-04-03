import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spaced_repetition_app/helper_widgets/dialog_pop_up.dart';
import 'package:spaced_repetition_app/helper_widgets/snackbar.dart';
import 'package:spaced_repetition_app/screens/question_list_screen.dart';
import 'package:spaced_repetition_app/screens/settings_screen.dart';

///This will serve as the Home Screen
///It will provide users with an overview of their Created Courses
///It will also give them the ability to add new courses to the database and to
///also view the questions present in each course.
class HomeScreen extends StatefulWidget {
  const HomeScreen() : super();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> makeListCards(BuildContext context, List<String> courseList) {
    List<Widget> cards = [];

    if (courseList.length == 0) {
      //If the user has no courses created
      //This will be displayed instead
      cards.add(Center(
          child: Text(
        "You have no courses, Create One!",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )));
    } else {
      for (int i = 0; i < courseList.length; i++) {
        cards.add(Card(
            shadowColor: Colors.black,
            margin: EdgeInsets.all(10.0),
            child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                tileColor: Colors.orange,
                leading: Icon(
                  Icons.school,
                  size: 30,
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red,
                    ),
                  onPressed: (){
                    // TODO 5.1: Deleting a Course
                    ///Deleting a Course from DB Logic Goes in here,
                    ///A Cubit function will take the course Name,
                    ///delete it from the users DB and will then
                    ///emit this widget to refresh and display the updated
                    ///course list
                    ///in the ListView
                  },
                ),
                title: Text(courseList[i],
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                onTap: () {
                  //SnackBarCreator().showSnackBar(context, "You pressed me");
                  pushNewScreen(
                    context,
                    screen: QuestionListScreen(courseList[i]),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                })));
      }
    }

    return cards;
  }

  void printValues(String value1)
  {
    print(value1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO 3: Implement Course List Retriever
    /*
    Users need to be able to see all the courses they have created
    (As discussed earlier, these will hold the questions)
    Create a cubit that retrieves a List of Strings that hold all the values of
    the courses in the users profile, and then pass it into the variable
    "listFromCubit"
     */
    ///Dummy Lists for presentation
    ///This list will be replaced by a list provided by a cubit
    List<String> listFromCubit = [
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
                  // TODO 4: Retrieve Display Name from Database
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
                    // TODO 5: Adding an New Course
                    ///Adding New Course to DB Logic Goes in here, Cubit will then
                    ///emit this widget to refresh and display the new course
                    ///in the ListView
                    ///You will make use of this class, for "Add New Course".
                    ///The callback will need to take a function with a
                    ///String parameter (this will be the name of the course they are adding)
                    DialogBoxCreator().createDialogBox(context, "course", printValues);

                    ///You can call set state after to refresh page
                  },
                  child: Text("Add New Course")),
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
                    children: makeListCards(context, listFromCubit),
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
