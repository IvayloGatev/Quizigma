import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quiz.dart';

abstract class IDatabase {
  Future addQuiz(Quiz quiz);

  Quiz getQuiz(String id);

  Future<void> addQuestion(Question question);

  Question getQuestion(int id, String quizId);
}
