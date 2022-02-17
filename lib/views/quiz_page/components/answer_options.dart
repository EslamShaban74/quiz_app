import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/quiz_controller.dart';
import '../../../themes.dart';

class AnswerOptions extends StatelessWidget {
  AnswerOptions({
    Key? key,
    required this.answer,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String answer;
  final int index;
  final VoidCallback press;
  final QuizController _quizController = Get.find();

  Color get getColor {
    if (_quizController.isAnswered) {
      if (index == _quizController.correctAnswer) {
        return Colors.green;
      } else if (index == _quizController.selectedAnswer &&
          _quizController.selectedAnswer != _quizController.correctAnswer) {
        return Colors.red;
      }
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: _quizController,
      builder: (_) => InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: getColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${index + 1}. $answer',
                style: subTitleStyle.copyWith(color: Colors.grey),
              ),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color:
                      getColor == Colors.grey ? Colors.transparent : getColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: getColor),
                ),
                child: Icon(
                  getColor == Colors.grey ? null:
                    getColor == Colors.red ? Icons.close : Icons.check ,size: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
