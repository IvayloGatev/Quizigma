import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/services/firestore_database.dart';

class QuizController extends ControllerMVC {
  factory QuizController() {
    if (_this == null) {
      _this = QuizController._();
    }
    return _this;
  }

  static QuizController _this;

  QuizController._();

  final database = FirestoreDatabase();

  // A method which adds a new quiz to the database.
  Future<void> addQuiz(Quiz quiz) async {
    return await database.addQuiz(quiz);
  }

  // A method which retrieves a quiz grom the database.
  Future<Quiz> getQuiz(String quizId) async {
    return await database.getQuiz(quizId);
  }
