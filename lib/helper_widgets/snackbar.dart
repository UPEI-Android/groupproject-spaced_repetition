import 'package:flutter/material.dart';

///This is a helper class that returns a context action to show a Snackbar
///to notify users that an action has been performed behind the scenes
class SnackBarCreator {
  SnackBarCreator();

  void showSnackBar(BuildContext context, String textValue) {
    var snackBar = SnackBar(
      content: Text(textValue,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
