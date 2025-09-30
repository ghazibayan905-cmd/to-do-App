class QuizModel {
  QuizModel(
      {required this.title,
      required this.id,
      required this.questions,
      this.quizStatus});

  String title;
  int id;
  QuizStatus? quizStatus;
  List<QuestionsModel> questions;
}

class QuestionsModel {
  QuestionsModel(
      {required this.question,
      required this.answers,
      required this.id,
      required this.idQuiz,
      required this.answerIdTrue,
      this.chooseAnswers});

  String question;
  List<AnswerModel> answers;
  int answerIdTrue;
  String? chooseAnswers;
  int id;
  int idQuiz;
}

class AnswerModel {
  AnswerModel({required this.answer, required this.id});

  String answer;
  int id;
}

enum QuizStatus { Bad, Good, VeryGood, Excellent }