import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///This Screen will provide users with Settings for the app
///that can be changed and customized to give them more
///control over the application.
///Future Implementation for application
class SettingsScreen extends StatelessWidget {
  const SettingsScreen();

  Widget buildOption(context, String textValue) {
    return Container(
      color: const Color(0xFFfdc3a9),
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("I do nothing yet"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close"))
                  ],
                );
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textValue,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("I do nothing yet"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"))
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDC1A22),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Center(
                  child: Text(
                "Settings",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Customize",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                height: 15,
                color: Colors.white,
                thickness: 2,
              ),
              SizedBox(height: 10),
              buildOption(context, "Change Tile Colors"),
              SizedBox(height: 10),
              buildOption(context, "Change Duration Time"),
              SizedBox(height: 10),
              buildOption(context, "Change Feature X"),
              SizedBox(height: 10),
              buildOption(context, "Change Feature Y"),
              SizedBox(height: 10),
              buildOption(context, "Change Feature Z"),
            ],
          ),
        ));
  }
}
