import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/quiz_controller.dart';
import '../../themes.dart';
import 'components/build_question.dart';

class QuizPage extends StatelessWidget {
  QuizPage({
    Key? key,
  }) : super(key: key);
  final QuizController _quizController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _quizController,
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text.rich(
                  TextSpan(
                    text: 'Question ${_quizController.questionNumber}',
                    style: headingStyle,
                    children: [
                      TextSpan(text: '/${_quizController.questions.length}', style: subHeadingStyle),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index)=> _quizController.updateQuestionNumber(index),
                  controller: _quizController.pageController,
                    itemCount: _quizController.questions.length,
                    itemBuilder: (context, index) => BuildQuestionsCard(
                          question: _quizController.questions[index],
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
