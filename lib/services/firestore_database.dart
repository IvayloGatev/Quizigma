import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/services/idatabase.dart';
import 'package:random_string/random_string.dart';

class FirestoreDatabase implements IDatabase {
  final CollectionReference quizesCollection =
      FirebaseFirestore.instance.collection('Quizes');

  final firestore = FirebaseFirestore.instance;

  @override
  Future addQuiz(Quiz quiz) async {
    return await quizesCollection.doc().set({
      'id': quiz.id,
      'category': quiz.category,
      'name': quiz.name,
    }); //Ivo
  }

  @override
  Quiz getQuiz(String id) {
    // TODO: implement addQuestion
    throw UnimplementedError(); //Andrei
  }

  @override
  Future<void> addQuestion(Question question) {
    // TODO: implement addQuestion
    throw UnimplementedError(); // Sevde
  }

  @override
  Question getQuestion(int id, String quizId) {
    // TODO: implement getQuestion
    throw UnimplementedError(); //Ivo
  }
}

// getQuizData(String quizCatalog) async {
//   print(firestore
//       .collection("Catalog")
//       .doc(quizCatalog)
//       .collection("Quiz")
//       .doc());
//   return await firestore
//       .collection("Catalog")
//       .doc(quizCatalog)
//       .collection("Quiz")
//       .get();
// }
