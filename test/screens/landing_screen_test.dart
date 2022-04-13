import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spaced_repetition_app/screens/landing_screen.dart';

void main() {
  Widget testLandingScreenWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: new LandingScreen())
  );

  testWidgets('Landing Screen Test',(WidgetTester tester) async {
    await tester.pumpWidget(testLandingScreenWidget);

    expect(find.text('Lets Get you Started!'), findsOneWidget);
    expect(find.text('Are you a New Member?'), findsOneWidget);
    expect(find.text('Already have an account?'), findsOneWidget);
    print('All instructions show up');

    expect(find.text('Register'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);
    print('All buttons show up');
  });
}