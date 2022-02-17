import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quiz/controllers/quiz_controller.dart';
import 'package:my_quiz/views/name_page/name_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Quiz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NamePage());
  }
}
