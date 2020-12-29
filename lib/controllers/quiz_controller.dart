import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizigma/models/question.dart';
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

  // A method which retrieves a quiz from the database.
  Future<Quiz> getQuiz(String quizId) async {
    return await database.getQuiz(quizId);
  }

  // A method which retrieves a quiz from the database.
  CollectionReference getQuizWithId(String quizId) {
    return database.getQuizWithId(quizId);
  }

  // A method which retrieves the questions of a quiz from the database.
  List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Question.namedconstructor(
          doc.data()['id'],
          doc.data()['text'],
          List<String>.from(doc.data()['answers']),
          doc.data()['correctAnswer'],
          doc.data()['timeInSeconds']);
    }).toList();
  }

//  // A method which retrieves the questions of a quiz from the database.
//   List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.docs.map((doc) {
//       return Question.namedconstructor(doc.data()['id'],
//       doc.data()['text'],
//           List<String>.from(doc.data()['answers']));
//     }).toList();
//   }
  // A method which retrieves the questions of a quiz from the database.
  Stream<List<Question>> getquestions(String quizId) {
    return getQuizWithId(quizId).snapshots().map(_questionListFromSnapshot);
  }
}
