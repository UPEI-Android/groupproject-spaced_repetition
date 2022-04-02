import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:spaced_repetition_app/helper_widgets/snackbar.dart';
import 'package:spaced_repetition_app/repositories/database.dart';
import 'package:spaced_repetition_app/screens/question_list_screen.dart';
import 'package:spaced_repetition_app/screens/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/User.dart';
import '../user/userModel.dart';

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
  UserData? usr;
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
      for (int i = 0; i < listFromCubit!.length; i++) {
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
                title: Text(listFromCubit![i],
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
  TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context, DatabaseAction db) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add a new Course'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  // valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter name of the course"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () async{
                  setState(() {
                    listFromCubit?.insert(0,_textFieldController.text);
                    // print(listFromCubit);
                    Navigator.pop(context);
                    _textFieldController.clear();
                  });
                  await db.updateCourses(listFromCubit!);
                },
              ),

            ],
          );
        });
  }
  List<String>? listFromCubit = [

  ];
  @override
  Widget build(BuildContext context) {
    DatabaseAction dbService = Provider.of<DatabaseAction>(context, listen: false);
     usr = dbService.getUser();
//

    dbService.loadUserDataCollectionFromFirebase(usr?.uid ?? "Null");

    return StreamBuilder<UserData>(
        stream: DatabaseAction(uid: usr?.uid).userData,
    builder: (context, snapshot) {
      if(snapshot.hasData) {
        UserData? userData = snapshot.data;
        listFromCubit = userData?.courses;
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
                      "Welcome ${userData?.name ?? "Null"}!",
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
                      onPressed: ()async {
                        // TODO 5: Adding an New Course
                        _displayTextInputDialog(context, dbService);
                        await dbService.updateCourses(listFromCubit!);

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
                            children: makeListCards(context, usr?.courses ?? []),
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
