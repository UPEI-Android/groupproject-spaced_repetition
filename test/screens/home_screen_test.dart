import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spaced_repetition_app/screens/home_screen.dart';

void main() {
  Widget testHomeScreenWidget = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(home: new HomeScreen())
  );

  testWidgets('Home Screen Tests',(WidgetTester tester) async {
    await tester.pumpWidget(testHomeScreenWidget);

    expect(find.text('Here are your courses'), findsOneWidget);
    print('All instructions show up');

    expect(find.text('Add New Course'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    print('All buttons show up');

    expect(find.byType(Expanded), findsOneWidget);
    print('All Expanded Sets show up');
  });
}