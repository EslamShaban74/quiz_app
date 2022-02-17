import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/quiz_controller.dart';
import '../../../models/questions.dart';
import '../../../themes.dart';
import 'answer_options.dart';

class BuildQuestionsCard extends StatelessWidget {
  BuildQuestionsCard({Key? key, required this.question}) : super(key: key);
  final Question question;
  final QuizController _quizController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
            )
          ]),
      child: Column(
        children: [
          Text(
            question.question,
            style: titleStyle,
          ),
          const SizedBox(height: 20),
          ...List.generate(
            question.options.length,
            (index) => AnswerOptions(
              index: index,
              answer: question.options[index],
              press: () {
                _quizController.checkAnswer(
                    question: question, selectedIndex: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
