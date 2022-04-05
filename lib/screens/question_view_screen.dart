import 'package:flutter/material.dart';

import '../models/question_class.dart';

// import '../questions/question_class.dart';

class QuestionViewScreen extends StatefulWidget {
  late Question? question;

  QuestionViewScreen(Question? questionValue) {
    this.question = questionValue;
  }

  @override
  State<QuestionViewScreen> createState() => _QuestionViewScreenState();
}

class _QuestionViewScreenState extends State<QuestionViewScreen> {
  var ansIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: const Color(0xFFDC1A22),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${widget.question?.questionText}?",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(height: 10),
                    Visibility(
                      visible: ansIsVisible,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Text(
                        "Answer: ${widget.question?.answerText}",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ansIsVisible = !ansIsVisible;
                          });
                        }, child: Text("Show/Hide Answer")),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              ///Activate Spaced Repetition Algo and update
                              ///question.nextReview
                            },
                            child: Text("I Remember This")),
                        ElevatedButton(
                            onPressed: () {
                              ///Reset Step/streak
                            },
                            child: Text("I Don't Remember This"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
