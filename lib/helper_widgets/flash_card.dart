import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QCard extends StatelessWidget {
  late String cardText;

  //Attribute to determine which kind of card is it
  //0 for Question, 1 for answer
  late int type;

  QCard({required this.cardText, required this.type});

  @override
  Widget build(BuildContext context) {
    if (type == 0) {
      return Card(
        elevation: 10,
        child: Center(
          child: Text(cardText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      );
    } else {
      return Card(
        elevation: 10,
        child: Center(
          child: Text(cardText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.black)),
        ),
      );
    }
  }
}
