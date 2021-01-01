import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quizigma_user.dart';
import 'package:quizigma/services/idatabase.dart';

class FirestoreDatabase implements IDatabase {
  final firestore = FirebaseFirestore.instance;

  final CollectionReference quizesCollection =
      FirebaseFirestore.instance.collection('Quizes');

  @override
  Future<void> addQuiz(Quiz quiz) async {
    final CollectionReference quizesCollection = firestore.collection('Quizes');

    await quizesCollection.doc(quiz.id).set({
      'category': quiz.category,
      'name': quiz.name,
      'timeInSeconds': quiz.timeInSeconds,
      'numofQuestions': quiz.numofQuestions,
      'startDate': quiz.startDate,
      'endDate': quiz.endDate,
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
      int timeInSeconds = snapshot.data()['timeInSeconds'];
      int numofQuestions = snapshot.data()['numofQuestions'];
      quiz = Quiz(
        category,
        name,
        questions,
        timeInSeconds,
        numofQuestions,
        startDate,
        endDate,
        quizId,
      );
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
      });
    });
  }

  Future<List<Question>> _getQuestions(String quizId) async {
    final CollectionReference questionsCollection =
        firestore.collection('Quizes').doc(quizId).collection('Questions');
    List<Question> questions = List<Question>();

    await questionsCollection.get().then((snapshot) {
      snapshot.docs.forEach((question) {
        int id = question.data()['id'];
        String text = question.data()['text'];
        List<String> answers = List<String>.from(question.data()['answers']);
        int correctAnswer = question.data()['correctAnswer'];

        questions.add(Question(id, text, answers, correctAnswer));
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

  List<Quiz> _quizListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Quiz.namedconstructor(
        doc.id ?? 0,
        doc.data()['category'] ?? '',
        doc.data()['name'] ?? '',
        doc.data()['timeInSeconds'] ?? 0,
        doc.data()['numofQuestions'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Quiz>> get quizes {
    return quizesCollection.snapshots().map(_quizListFromSnapshot);
  }

  CollectionReference getQuizWithId(String quizId) {
    final CollectionReference questionsCollection = FirebaseFirestore.instance
        .collection('Quizes')
        .doc(quizId)
        .collection('Questions');
    return questionsCollection;
  }

  List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Question.namedconstructor(
        doc.data()['id'],
        doc.data()['text'],
        List<String>.from(doc.data()['answers']),
        doc.data()['correctAnswer'],
      );
    }).toList();
  }

  Stream<List<Question>> getquestions(String quizId) {
    return getQuizWithId(quizId).snapshots().map(_questionListFromSnapshot);
  }

  @override
  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await quizesCollection.doc(docId).get();
      if (doc.exists) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
