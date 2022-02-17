import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/questions.dart';
import '../views/score_page/score_page.dart';

class QuizController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String name = '';

  void setName(value) {
    name = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    questions.shuffle();
  }

  final List<Question> questions = sampleData
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  bool isAnswered = false;
  int correctAnswer = 0;
  int selectedAnswer = 0;
  int questionNumber = 1;
  int numberOfCorrectAnswer = 0;

  PageController pageController = PageController();

  void checkAnswer({required Question question, required int selectedIndex}) {
    isAnswered = true;
    correctAnswer = question.answer;
    selectedAnswer = selectedIndex;

    if (correctAnswer == selectedAnswer) {
      numberOfCorrectAnswer++;
    }
    update();

    Future.delayed(const Duration(seconds: 2), () {
      isAnswered = false;
      if (questionNumber != questions.length) {
        pageController.nextPage(
            duration: const Duration(milliseconds: 250), curve: Curves.ease);
      } else {
        Get.to(() => ScorePage());
      }
    });
  }

  void updateQuestionNumber(int index) {
    questionNumber = index + 1;
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
  }
}
