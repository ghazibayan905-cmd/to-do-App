import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/ui/view/result/result.dart';
import 'package:testt/ui/view/weeks/week3/task_1_week3_controller.dart';
import 'package:testt/ui/view/weeks/week3/widget/custom_container_answ.dart';

class Task1Week3 extends StatelessWidget {
  const Task1Week3({super.key});

  @override
  Widget build(BuildContext context) {
    Task1Week3Controller controller = Get.put(Task1Week3Controller());
    controller.initLists();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        if (controller.currentQuestion > 0) {
          controller.currentQuestion--;
          controller.countCorrectAnswer--;
          controller.update();
        } else {}
      },
      child: Scaffold(
        appBar: Appbar(title: "Dart Language"),
        body: GetBuilder<Task1Week3Controller>(
          builder: (c) {
            return Column(
              children: [
                Text(
                  (controller.currentQuestion + 1).toString() +
                      "/" +
                      controller.quiz[0].questions.length.toString(),
                ),
                // LinearProgressIndicator(),
                Text(
                  controller
                      .quiz[0]
                      .questions[controller.currentQuestion]
                      .question,
                ),

                ...List.generate(
                  controller
                      .quiz[0]
                      .questions[controller.currentQuestion]
                      .answers
                      .length,
                  (index) {
                    return CustomContainerAnsw(
                      groupValue: controller
                          .quiz[0]
                          .questions[controller.currentQuestion]
                          .chooseAnswers,
                      answer: controller
                          .quiz[0]
                          .questions[controller.currentQuestion]
                          .answers[index]
                          .answer,
                      onChanged: (value) {
                        controller
                                .quiz[0]
                                .questions[controller.currentQuestion]
                                .chooseAnswers =
                            value;
                        controller.update();
                      },
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller
                            .quiz[0]
                            .questions[controller.currentQuestion]
                            .chooseAnswers !=
                        null) {
                      if (controller.quiz[0].questions.length !=
                          controller.currentQuestion + 1) {
                        controller
                            .quiz[controller.currentQuiz]
                            .questions[controller.currentQuestion]
                            .answers
                            .forEach((ans) {
                              if (ans.answer ==
                                  controller
                                      .quiz[controller.currentQuiz]
                                      .questions[controller.currentQuestion]
                                      .chooseAnswers) {
                                controller.isCorrectAnswer[controller
                                        .currentQuestion] =
                                    ans.id ==
                                    controller
                                        .quiz[controller.currentQuiz]
                                        .questions[controller.currentQuestion]
                                        .answerIdTrue;
                              }
                            });

                        controller.currentQuestion++;
                        controller.update();
                      } else {
                        controller.quiz[0].questions.forEach((question) {
                          print(question.chooseAnswers);
                        });
                        controller.handleFinishQuiz();
                        Get.off(() => ResultPage());
                      }
                    } else {
                      Get.snackbar("failes", "please");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    iconColor: AppColors.mainColor,
                  ),
                  child: Text("Next"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
