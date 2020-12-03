import 'package:quizigma/models/category.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/quizigma_user.dart';

abstract class IDatabase {
  // A method which adds a new quiz to the database.
  Future<void> addQuiz(Quiz quiz);

  // A method which retrieves a quiz from the database.
  Future<Quiz> getQuiz(String quizId);

  // A method which updates the user data.
  Future<void> updateUser(QuizigmaUser user);

  //A method which retrives a user from the database.
  Future<QuizigmaUser> getUser(String uid);

  //A method which retrieves all the quizes from the same category.
  Future<List<String>> getQuizesFromCategory(String category);
}
