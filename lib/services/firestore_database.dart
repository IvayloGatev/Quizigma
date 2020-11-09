import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/services/idatabase.dart';
import 'package:random_string/random_string.dart';

class FirestoreDatabase implements IDatabase {
  final CollectionReference quizCollection =
      FirebaseFirestore.instance.collection('Test_Quiz');

  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> addQuestion(Question question) {
    // TODO: implement addQuestion
    throw UnimplementedError();
  }

  @override
  Future addQuiz(String quizCategory, String quizName) async {
    var quizId = randomAlphaNumeric(8);
    //print('Your Quiz ID is:' + quizId);
    return await quizCollection.doc().set({
      'category': quizCategory,
      'id': quizId,
      'name': quizName,
    });
  } //addQuizSample

  getQuizData(String quizCatalog) async {
    print(firestore
        .collection("Catalog")
        .doc(quizCatalog)
        .collection("Quiz")
        .doc());
    return await firestore
        .collection("Catalog")
        .doc(quizCatalog)
        .collection("Quiz")
        .get();
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
