import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spaced_repetition_app/helper_widgets/snackbar.dart';

///This is a helper class that returns a DialogBox
///We use this to collect information from the users
///It can return two types, A Question Dialog (type:question)
///A Course Dialog (type:course)
class DialogBoxCreator {
  DialogBoxCreator();

  ///Types: question, course
  dynamic createDialogBox(
      BuildContext context, String type, Function callbackOnSubmit,
      [String questionsCourse = "null"]) {
    TextEditingController courseName = TextEditingController();
    TextEditingController questionText = TextEditingController();
    TextEditingController questionAnswer = TextEditingController();
    TextEditingController durationPeriod = TextEditingController();

    if (type == "course") {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Add New Course"),
              content: TextField(
                controller: courseName,
                decoration: InputDecoration(
                    hintText: "What Course Would you like to add?"),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (courseName.text.length == 0) {
                        SnackBarCreator().showSnackBar(
                            context, "Field Empty, No Course Added!");
                        Navigator.of(context).pop();
                      } else {
                        callbackOnSubmit(courseName.text);
                        Navigator.of(context).pop();
                        SnackBarCreator()
                            .showSnackBar(context, "Course Added!");
                      }
                    },
                    child: Text("Submit"))
              ],
            );
          });
    } else if (type == "question") {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Add New Question"),
              content: Container(
                height: 200,
                child: Column(
                  children: [
                    TextField(
                      controller: questionText,
                      decoration:
                          InputDecoration(hintText: "What is the Question?"),
                    ),
                    TextField(
                      controller: questionAnswer,
                      decoration:
                          InputDecoration(hintText: "What is the answer?"),
                    ),
                    TextField(
                      controller: durationPeriod,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          hintText:
                              "Duration of Repetition?"), // Only numbers can be entered
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (questionText.text.length == 0 ||
                          durationPeriod.text.length == 0 ||
                          questionAnswer.text.length == 0 ||
                          (questionText.text.length == 0 &&
                              questionAnswer.text.length == 0 &&
                              durationPeriod.text.length == 0)) {
                        SnackBarCreator().showSnackBar(context,
                            "One or More Fields Empty, No Question Added!");
                        Navigator.of(context).pop();
                      } else {
                        callbackOnSubmit(questionsCourse, questionText.text,
                            questionAnswer.text, int.parse(durationPeriod.text));
                        Navigator.of(context).pop();
                        SnackBarCreator()
                            .showSnackBar(context, "Question Added!");
                      }
                    },
                    child: Text("Submit"))
              ],
            );
          });
    }
  }
}
