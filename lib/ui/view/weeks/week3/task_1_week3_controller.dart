import 'package:get/get.dart';
import 'package:testt/core/model/week_3_model.dart';

class Task1Week3Controller extends GetxController {
  int currentQuestion = 0;
  int currentQuiz = 0;
  double spinnerValue = 0.0;
  int countCorrectAnswer = 0;
  List<int> selectedAnswers = [];
  List<bool> isCorrectAnswer = [];

  List<QuizModel> quiz = [
    QuizModel(
      title: 'Dart Language',
      id: 1,
      questions: [
        QuestionsModel(
          question: 'What is the common file extension for Dart files',
          answers: [
            AnswerModel(id: 1, answer: '.dart'),
            AnswerModel(id: 2, answer: '.d'),
            AnswerModel(id: 3, answer: '.dartfile'),
            AnswerModel(id: 4, answer: '.dartcode'),
          ],
          id: 1,
          idQuiz: 1,
          answerIdTrue: 1,
        ),
        QuestionsModel(
          question: 'Which of the following is an immutable data type in Dart',
          answers: [
            AnswerModel(id: 1, answer: 'List'),
            AnswerModel(id: 2, answer: 'Map'),
            AnswerModel(id: 3, answer: 'String'),
            AnswerModel(id: 4, answer: 'Set'),
          ],
          id: 2,
          idQuiz: 1,
          answerIdTrue: 3,
        ),
        QuestionsModel(
          question: 'What is the main purpose of the async keyword in Dart',
          answers: [
            AnswerModel(id: 1, answer: 'To declare a constant variable'),
            AnswerModel(id: 2, answer: ' To define a synchronous function'),
            AnswerModel(id: 3, answer: 'To handle asynchronous operations'),
            AnswerModel(id: 4, answer: 'To create a new class'),
          ],
          id: 3,
          idQuiz: 1,
          answerIdTrue: 3,
        ),
        QuestionsModel(
          question: 'What is Dart primarily used for',
          answers: [
            AnswerModel(id: 1, answer: 'Web development'),
            AnswerModel(id: 2, answer: 'Mobile app development'),
            AnswerModel(id: 3, answer: 'Server-side programming'),
            AnswerModel(id: 4, answer: ' All of the above'),
          ],
          id: 4,
          idQuiz: 1,
          answerIdTrue: 4,
        ),
        QuestionsModel(
          question: 'Which company developed Dart',
          answers: [
            AnswerModel(id: 1, answer: 'Microsoft'),
            AnswerModel(id: 2, answer: 'Google'),
            AnswerModel(id: 3, answer: 'Apple'),
            AnswerModel(id: 4, answer: 'Facebook'),
          ],
          id: 5,
          idQuiz: 1,
          answerIdTrue: 2,
        ),
      ],
    ),
    QuizModel(
      title: 'Designs & Graphics',
      id: 2,
      questions: [
        QuestionsModel(
          question: 'What is the primary purpose of graphic design',
          answers: [
            AnswerModel(id: 1, answer: 'To create art for galleries'),
            AnswerModel(id: 2, answer: 'To communicate messages visually'),
            AnswerModel(id: 3, answer: 'To make products'),
            AnswerModel(id: 4, answer: 'To write code'),
          ],
          id: 1,
          idQuiz: 1,
          answerIdTrue: 2,
        ),
        QuestionsModel(
          question: 'Which software is widely used for vector graphic design',
          answers: [
            AnswerModel(id: 1, answer: 'Adobe Photoshop'),
            AnswerModel(id: 2, answer: ' Adobe Illustrator'),
            AnswerModel(id: 3, answer: 'CorelDRAW'),
            AnswerModel(id: 4, answer: 'Both B and C'),
          ],
          id: 2,
          idQuiz: 2,
          answerIdTrue: 4,
        ),
        QuestionsModel(
          question: 'What does "RGB" stand for in color theory',
          answers: [
            AnswerModel(id: 1, answer: 'Red, Green, Blue'),
            AnswerModel(id: 2, answer: 'Red, Gold, Blue'),
            AnswerModel(id: 3, answer: 'Red, Gray, Black'),
            AnswerModel(id: 4, answer: ' Red, Green, Black'),
          ],
          id: 3,
          idQuiz: 2,
          answerIdTrue: 1,
        ),
        QuestionsModel(
          question: 'What is the main purpose of a mood board in design',
          answers: [
            AnswerModel(id: 1, answer: 'To finalize a design concept'),
            AnswerModel(id: 2, answer: 'To gather inspiration and ideas'),
            AnswerModel(id: 3, answer: 'To present the final product'),
            AnswerModel(id: 4, answer: 'To create a marketing plan'),
          ],
          id: 4,
          idQuiz: 2,
          answerIdTrue: 2,
        ),
        QuestionsModel(
          question: 'What does "CMYK" stand for in printing',
          answers: [
            AnswerModel(id: 1, answer: 'Cyan, Magenta, Yellow, Black'),
            AnswerModel(id: 2, answer: 'Cyan, Magenta, Yellow, Key'),
            AnswerModel(id: 3, answer: 'Color, Magenta, Yellow, Key'),
            AnswerModel(id: 4, answer: 'Cyan, Magenta, Yellow, K'),
          ],
          id: 5,
          idQuiz: 2,
          answerIdTrue: 1,
        ),
      ],
    ),
  ];

  void selectAnswer(int answerId) {
    selectedAnswers[currentQuestion] = answerId;
    update();
  }

  // void isCorrect(bool iscorret) {
  //   isCorrectAnswer[currentQuestion] = iscorret;
  //   update();
  // }

  initLists() {
    selectedAnswers = List.filled(quiz[currentQuiz].questions.length, -1);
    isCorrectAnswer = List.filled(quiz[currentQuiz].questions.length, false);

    update();
  }

  void increaseSlider() {
    if (spinnerValue < 1) {
      spinnerValue =
          spinnerValue + ((100 / quiz[currentQuiz].questions.length) * 0.01);
    }
    update();
  }

  resetQuiz() {
    countCorrectAnswer = 0;
    currentQuiz = 0;
    currentQuestion = 0;
    spinnerValue = 0.0;
    initLists();
    update();
  }

  handleFinishQuiz() {
    for (bool status in isCorrectAnswer) {
      if (status) {
        countCorrectAnswer = countCorrectAnswer + 1;
      }
    }
    int score =
        ((100 / quiz[currentQuiz].questions.length) * (countCorrectAnswer + 1))
            .toInt();
    if (score >= 0 && score < 50) {
      quiz[currentQuiz].quizStatus = QuizStatus.Bad;
    }
    if (score >= 50 && score < 70) {
      quiz[currentQuiz].quizStatus = QuizStatus.Good;
    }
    if (score >= 70 && score < 90) {
      quiz[currentQuiz].quizStatus = QuizStatus.VeryGood;
    }
    if (score >= 90 && score <= 100) {
      quiz[currentQuiz].quizStatus = QuizStatus.Excellent;
    }
    update();
  }
}
