import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/ui/view/weeks/week3/task_1_week3_controller.dart';
import 'package:testt/ui/view/weeks/week3/task_1_week_3.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Task1Week3Controller controller = Get.find<Task1Week3Controller>();
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('النتيجة'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 📝 النتيجة
            Text(
              'النتيجة النهائية',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Text(
              '${controller.countCorrectAnswer + 1} / ${controller.quiz[0].questions.length}',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // ✅ الحالة
            Text(
              controller.quiz[controller.currentQuiz].quizStatus!.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 50),

            // 🔘 الزرين
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.replay),
                  label: const Text('إعادة المحاولة'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    // ضع هنا كود إعادة الاختبار
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.home),
                  label: const Text('القائمة الرئيسية'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    controller.resetQuiz();
                    Get.off(() => Task1Week3());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
