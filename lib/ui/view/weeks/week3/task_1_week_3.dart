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
        }
      },
      child: Scaffold(
        appBar: Appbar(title: "Dart Language"),
        body: GetBuilder<Task1Week3Controller>(
          builder: (c) {
            final totalQuestions = controller.quiz[0].questions.length;
            final currentQuestion = controller.currentQuestion + 1;
            final progress = currentQuestion / totalQuestions;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 22,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          width: MediaQuery.of(context).size.width * progress,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Center(
                          child: Text(
                            "$currentQuestion / $totalQuestions",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// نص السؤال
                  Text(
                    controller
                        .quiz[0]
                        .questions[controller.currentQuestion]
                        .question,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// خيارات الإجابة
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
                  const SizedBox(height: 20),

                  /// زر "التالي"
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
                        Get.snackbar(
                          "تنبيه",
                          "الرجاء اختيار إجابة قبل المتابعة",
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
