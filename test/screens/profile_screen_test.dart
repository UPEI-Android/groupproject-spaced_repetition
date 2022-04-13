import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spaced_repetition_app/screens/profile_screen.dart';

void main() {
  Widget testProfileScreenWidget = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(home: new ProfileScreen())
  );

  testWidgets('Profile Screen Test',(WidgetTester tester) async {
    await tester.pumpWidget(testProfileScreenWidget);

    expect(find.text('Edit Profile'), findsOneWidget);

    expect(find.text('Display Name'), findsOneWidget);
    expect(find.text('What do you want to change the display name to?'), findsOneWidget);

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Change Email to?'), findsOneWidget);

    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Change Password To?'), findsOneWidget);
    print('All instructions show up');

    expect(find.text('Submit'), findsOneWidget);
    expect(find.text('Sign Out'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);
    print('All buttons show up');
  });
}