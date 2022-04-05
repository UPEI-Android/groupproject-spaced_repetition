import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:spaced_repetition_app/helper_widgets/flash_card.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0),
                child: Text(
                  // TODO 4: Retrieve Display Name from Database
                  ///Display name would be provided by DB
                  ///Please include a method in the cubit to place it in here
                  "Tap Card to Reveal Answer",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: QCard(cardText: "${widget.question?.questionText}?", type: 0),
                  back: QCard(cardText: "${widget.question?.answerText}", type: 1),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      // body: Container(
      //   padding: EdgeInsets.all(20.0),
      //   color: const Color(0xFFDC1A22),
      //   child: Center(
      //     child: SingleChildScrollView(
      //       child: Card(
      //         color: Colors.white,
      //         child: Padding(
      //           padding: EdgeInsets.all(12),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Text("${widget.question?.questionText}?",
      //                   style: TextStyle(
      //                       fontSize: 30.0,
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.black)),
      //               SizedBox(height: 10),
      //               Visibility(
      //                 visible: ansIsVisible,
      //                 maintainSize: true,
      //                 maintainAnimation: true,
      //                 maintainState: true,
      //                 child: Text(
      //                   "Answer: ${widget.question?.answerText}",
      //                   style: TextStyle(color: Colors.black, fontSize: 20.0),
      //                 ),
      //               ),
      //               ElevatedButton(
      //                   onPressed: () {
      //                     setState(() {
      //                       ansIsVisible = !ansIsVisible;
      //                     });
      //                   }, child: Text("Show/Hide Answer")),
      //               SizedBox(height: 15),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   ElevatedButton(
      //                       onPressed: () {
      //                         ///Activate Spaced Repetition Algo and update
      //                         ///question.nextReview
      //                       },
      //                       child: Text("I Remember This")),
      //                   ElevatedButton(
      //                       onPressed: () {
      //                         ///Reset Step/streak
      //                       },
      //                       child: Text("I Don't Remember This"))
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
