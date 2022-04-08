import 'package:flutter/material.dart';

///This class is a work in progress
class SearchScreen extends StatelessWidget {
  final searchTerm;

  //late List<Card> listItems;

  SearchScreen({required this.searchTerm});

  // List<Card> filterList(String value, List<Card> originalList)
  // {
  //   late List<Card> filteredList;
  //
  //   //
  //
  //   return filteredList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          color: const Color(0xFFDC1A22),
          child: Center(
              child: Column(children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Your search term was \"${searchTerm}\"",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Text(
                "This Feature is Coming Soon",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ]))),
    );
  }
}
