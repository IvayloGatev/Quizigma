import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quiz.dart';

abstract class IDatabase {
  Future addQuiz(String category, String name);

  Quiz getQuiz(String id);

  Future<void> addQuestion(Question question);

  Question getQuestion(String id, Quiz quiz);
}
