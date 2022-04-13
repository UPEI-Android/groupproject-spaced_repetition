import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spaced_repetition_app/screens/register_screen.dart';

void main() {
  Widget testRegScreenWidget = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(home: new RegisterScreen())
  );

  testWidgets('Register Screen Test',(WidgetTester tester) async {
    await tester.pumpWidget(testRegScreenWidget);

    expect(find.text('Display Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    print('All instructions show up');

    expect(find.text('Submit'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    print('All buttons show up');
  });
}