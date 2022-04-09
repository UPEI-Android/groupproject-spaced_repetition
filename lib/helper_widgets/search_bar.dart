import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spaced_repetition_app/screens/search_screen.dart';

class AnimatedSearchBar extends StatefulWidget {
  AnimatedSearchBar();

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;
  TextEditingController searchValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 56 : 200,
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: kElevationToShadow[6]),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: !_folded
                      ? TextField(
                          controller: searchValue,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.blue[300]),
                              border: InputBorder.none),
                    onSubmitted: (value) {
                      pushNewScreen(
                        context,
                        screen: SearchScreen(searchTerm: value),
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                        )
                      : null)),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(_folded ? Icons.search : Icons.close, color: Colors.blue[900],),
                  ),
                onTap: (){
                    setState(() {
                      _folded = !_folded;
                    });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
