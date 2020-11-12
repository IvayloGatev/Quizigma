import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/services/idatabase.dart';

class FirestoreDatabase implements IDatabase {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> addQuiz(Quiz quiz) async {
    final CollectionReference quizesCollection = firestore.collection('Quizes');

    await quizesCollection.doc(quiz.id).set({
      'id': quiz.id,
      'category': quiz.category,
      'name': quiz.name,
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
      String id = snapshot.data()['id'];
      String category = snapshot.data()['category'];
      String name = snapshot.data()['name'];
      List<Question> questions = await _getQuestions(quizId);
      quiz = Quiz(category, name, questions, id);
    });

    return quiz;
  }

  // A method which adds a list of questions,
  // assosiated with a certain quiz, to the database.
  Future<void> _addQuestions(Quiz quiz) async {
    final CollectionReference questionsCollection =
        firestore.collection('Quizes').doc(quiz.id).collection('Questions');

    quiz.questions.forEach((question) async {
      await questionsCollection.doc(question.id.toString()).set({
        'id': question.id,
        'text': question.text,
        'answers': question.answers,
        'correctAnswer': question.correctAnswer
      });
    });
  }

  // A method which retrieves a list of questions,
  // assosiated with a certain quiz, from the database.
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
        questions.add(Question(id, text, answers, correctAnswer));
      });
    });

    return questions;
  }
}
