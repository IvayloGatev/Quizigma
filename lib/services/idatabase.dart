import 'package:quizigma/models/quiz.dart';

abstract class IDatabase {
  // A method which adds a new quiz to the database.
  Future<void> addQuiz(Quiz quiz);

  // A method which retrieves a quiz grom the database.
  Future<Quiz> getQuiz(String quizId);
}
