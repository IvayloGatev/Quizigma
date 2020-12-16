import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizigma/models/category.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quizigma_user.dart';
import 'package:quizigma/services/idatabase.dart';

class FirestoreDatabase implements IDatabase {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> addQuiz(Quiz quiz) async {
    final CollectionReference quizesCollection = firestore.collection('Quizes');

    await quizesCollection.doc(quiz.id).set({
      'category': quiz.category,
      'name': quiz.name,
      'startDate': quiz.startDate,
      'endDate': quiz.endDate
    });
    quiz.questions.forEach((question) async {
      await _addQuestions(quiz);
    });
  }

  @override
  Future<Quiz> getQuiz(String quizId) async {
    final CollectionReference quizesCollection = firestore.collection('Quizes');
    Quiz quiz;

    await quizesCollection.doc(quizId).get().then((snapshot) async {
      String category = snapshot.data()['category'];
      String name = snapshot.data()['name'];
      DateTime startDate = snapshot.data()['startDate'].toDate();
      DateTime endDate = snapshot.data()['endDate'].toDate();
      List<Question> questions = await _getQuestions(quizId);
      quiz = Quiz(category, name, questions, startDate, endDate, quizId);
    });

    return quiz;
  }

  Future<void> _addQuestions(Quiz quiz) async {
    final CollectionReference questionsCollection =
        firestore.collection('Quizes').doc(quiz.id).collection('Questions');

    quiz.questions.forEach((question) async {
      await questionsCollection.doc(question.id.toString()).set({
        'id': question.id,
        'text': question.text,
        'answers': question.answers,
        'correctAnswer': question.correctAnswer,
        'timeInSeconds': question.timeInSeconds
      });
    });
  }

  Future<List<Question>> _getQuestions(quizId) async {
    final CollectionReference questionsCollection =
        firestore.collection('Quizes').doc(quizId).collection('Questions');
    List<Question> questions = List<Question>();

    await questionsCollection.get().then((snapshot) {
      snapshot.docs.forEach((question) {
        int id = question.data()['id'];
        String text = question.data()['text'];
        List<String> answers = List<String>.from(question.data()['answers']);
        int correctAnswer = question.data()['correctAnswer'];
        int timeInSeconds = question.data()['timeInSeconds'];
        questions
            .add(Question(id, text, answers, correctAnswer, timeInSeconds));
      });
    });

    return questions;
  }

  @override
  Future<void> updateUser(QuizigmaUser user) async {
    final CollectionReference usersCollection = firestore.collection("Users");
    await usersCollection.doc(user.uid).set({
      'score': user.score,
      'bronzeMedals': user.bronzeMedals,
      'silverMedals': user.silverMedals,
      'goldMedals': user.goldMedals
    });
  }

  @override
  Future<QuizigmaUser> getUser(String uid) async {
    final CollectionReference usersCollection = firestore.collection("Users");
    QuizigmaUser user;

    await usersCollection.doc(uid).get().then((snapshot) async {
      int score = snapshot.data()['score'];
      int bronzeMedals = snapshot.data()['bronzeMedals'];
      int silverMedals = snapshot.data()['silverMedals'];
      int goldMedals = snapshot.data()['goldMedals'];
      user = QuizigmaUser.fromDatabase(
          uid, score, bronzeMedals, silverMedals, goldMedals);
    });

    return user;
  }


   @override
  Future<List<Quiz>> getQuizesFromCategory(String category) async {
    final CollectionReference quizesCollection = firestore.collection('Quizes');
    final List<Quiz> quizesIdFromCategory = List<Quiz>();
    int a = 0;

    await quizesCollection.get().then((snapshot) {
      snapshot.docs.forEach((doc) async {
        if (doc.data()['category'] == category) {
          Quiz quiz = await getQuiz(doc.id);
          quizesIdFromCategory.add(quiz);
          //print(quizesIdFromCategory[a].name);
          a++;
        }
      });
    });
    return quizesIdFromCategory;
  }

  final CollectionReference quizesTryCollection =
      FirebaseFirestore.instance.collection('Quizes');
  // get brews stream

  // brew list from snapshot
  List<Quiz> _quizListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Quiz.namedconstructor(
          id: doc.id ?? 0,
          category: doc.data()['category'] ?? '',
          name: doc.data()['name'] ?? '');
    }).toList();
  }

  Stream<List<Quiz>> get quizes {
    return quizesTryCollection.snapshots().map(_quizListFromSnapshot);
  }
}
