
import 'package:flutter_test/flutter_test.dart';
import 'package:spaced_repetition_app/questions/question_class.dart';

void main(){
  final DateTime testDate = DateTime.now();
  final testQuestion = new Question(
      questionText: "what is this app about",
      answerText:"spaced repetition",
      courseName:"cs3130",
      step: 5,
      duration: 30,
      nextReview: testDate
  );

  group('Test Question', () {
    test('Check question text', () {
      expect(testQuestion.returnQuestionText, "what is this app about");
      print('question text shows up correctly');
    });

    test('Check answer text', () {
      expect(testQuestion.returnQuestionAns, "spaced repetition");
      print('answer text shows up correctly');
    });

    test('Check question current step', () {
      expect(testQuestion.returnStep, 5);
      print('step is correct');
    });

    test('Check question duration', () {
      expect(testQuestion.returnDuration, 30);
      print('duration is correct');
    });

    test('Check next review date', () {
      expect(testQuestion.returnNextReview, testDate);
      print('next review date shows up correctly');
    });
  });
}