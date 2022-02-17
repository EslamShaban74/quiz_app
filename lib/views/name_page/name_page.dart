import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quiz_controller.dart';
import '../../themes.dart';
import '../quiz_page/quiz_page.dart';

class NamePage extends StatelessWidget {
  NamePage({Key? key}) : super(key: key);
  final QuizController _controller = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetBuilder(
        init: _controller,
        builder: (_) => Scaffold(

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Image(
                      image: AssetImage('assets/images/welcome.jpg'),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Welcome to MCQ quiz!',
                      style: headingStyle,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Please Enter your name',
                      style: titleStyle,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    buildForm(context),
                    const SizedBox(height: 30),
                    buildElevatedButton(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context) {
    return ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.blue;
                          }
                          return Colors.blue;
                        },
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50),
                      ),
                    ),
                    onPressed: ()  {
                      FocusScope.of(context).unfocus();
                      final isValid = formKey.currentState!.validate();
                      if (isValid) {
                        formKey.currentState!.save();
                        final message = 'Welcome ${_controller.name}';
                        Get.snackbar(
                          'Done!',
                          message,
                          colorText: Colors.white,
                          backgroundColor: Colors.green,
                          snackPosition: SnackPosition.BOTTOM,
                          borderRadius: 15,
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                          duration: const Duration(milliseconds: 1500),
                        );

                        Get.to(() => QuizPage());
                      }
                    },
                    child: Text(
                      'Let\'s start! ',
                      textAlign: TextAlign.center,
                      style: subTitleStyle,
                    ),
                  );
  }

  Form buildForm(BuildContext context) {
    return Form(
                    key: formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name can\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onSaved: (value) {
                        _controller.setName(value);
                      },
                      onFieldSubmitted: (value){
                        FocusScope.of(context).unfocus();
                        final isValid = formKey.currentState!.validate();
                        if (isValid) {
                          formKey.currentState!.save();
                          final message = 'Welcome ${_controller.name}';
                          Get.snackbar(
                            'Done!',
                            message,
                            colorText: Colors.white,
                            backgroundColor: Colors.green,
                            snackPosition: SnackPosition.BOTTOM,
                            borderRadius: 15,
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),
                            duration: const Duration(milliseconds: 1500),
                          );

                          Get.to(() => QuizPage());
                        }
                      },
                    ),
                  );
  }
}
