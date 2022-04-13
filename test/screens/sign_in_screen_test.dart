import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spaced_repetition_app/screens/sign_in_screen.dart';

void main() {
  Widget testSignInScreenWidget = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(home: new SignInScreen())
  );

  testWidgets('Sign In Screen Test',(WidgetTester tester) async {
    await tester.pumpWidget(testSignInScreenWidget);

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    print('All instructions show up');

    expect(find.text('Submit'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    print('All buttons show up');
  });
}