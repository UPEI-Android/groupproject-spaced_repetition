import 'package:flutter/material.dart';

class QuestionListScreen extends StatelessWidget {

  late String cName;

  QuestionListScreen(String  courseName)
  {
    this.cName = courseName;
  }

  @override
  Widget build(BuildContext context) {
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
