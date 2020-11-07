import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/services/idatabase.dart';

class FirestoreDatabase implements IDatabase {
  @override
  Future<void> addQuestion(Question question) {
    // TODO: implement addQuestion
    throw UnimplementedError();
  }

  @override
  Future<void> addQuiz(Quiz quiz) {
    // TODO: implement addQuiz
    throw UnimplementedError();
  }

  @override
  Question getQuestion(String id, Quiz quiz) {
    // TODO: implement getQuestion
    throw UnimplementedError();
  }

  @override
  Quiz getQuiz(String id) {
    // TODO: implement getQuiz
    throw UnimplementedError();
  }
}
