import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quiz_controller.dart';
import '../../themes.dart';

class ScorePage extends StatelessWidget {
  ScorePage({Key? key}) : super(key: key);
  final QuizController _quizController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        init: _quizController,
        builder: (context) {
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 100),
                 Image(
                   height: 300,
                  width: double.infinity,
                  image: _quizController.numberOfCorrectAnswer > 2
                      ? const AssetImage('assets/images/success.jpg')
                      : const AssetImage('assets/images/wrong.jpg'),
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 40),
                Center(
                    child: Text(
                  'Your Score ',
                  style: headingStyle,
                )),
                const SizedBox(height: 50),
                Text(
                  '${_quizController.numberOfCorrectAnswer * 10}/${_quizController.questions.length * 10}',
                  style: headingStyle,
                )
              ],
            ),
          );
        });
  }
}
