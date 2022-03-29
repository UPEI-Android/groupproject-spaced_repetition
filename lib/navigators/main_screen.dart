import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/screens/due_today_screen.dart';
import 'package:spaced_repetition_app/screens/home_screen.dart';
import 'package:spaced_repetition_app/screens/profile_screen.dart';
import 'package:spaced_repetition_app/screens/settings_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

///This class serves as a holder for the Bottom Navigation Bar present in the app
///Will serve as a means of global navigation for our app
///Regular Bottom Nav Bars unfortunately do not persist after putting a new page
///on the stack so we make use of this Persistent Nav Bar Package available at pub.dev
///It comes with its own navigator, state management and a bunch of other features to enable it to
///persist after a new page has been added on the stack.
///Please read the documentation @https://pub.dev/packages/persistent_bottom_nav_bar

class BottomNavigatorScreen extends StatelessWidget {
  BottomNavigatorScreen();

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  ///These represent a screen matched to the Icon in the Nav Bar
  ///They have to be in order to work properly
  final screens = [
    HomeScreen(),
    DueTodayScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  ///Items in the Nav Bar
  final items = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home, size: 30),
      title: ("Home"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.timer, size: 30),
      title: ("Due Today"),
      activeColorPrimary: Colors.red,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings, size: 30),
      title: ("Settings"),
      activeColorPrimary: Colors.green,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.person, size: 30),
      title: ("Profile"),
      activeColorPrimary: Colors.orange,
      inactiveColorPrimary: Colors.grey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: items,
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          //There are about 20 available styles
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
