import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/quiz.dart';
import 'quiz_tile.dart';
import 'package:quizigma/services/firestore_database.dart';

class QuizList extends StatefulWidget {
  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  final _quizController = QuizController();
  Quiz quiz;
  String category;

  @override
  Widget build(BuildContext context) {
    final quizes = Provider.of<List<Quiz>>(context);
    return quizes == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: quizes.length,
            itemBuilder: (context, index) {
              return QuizTile(quiz: quizes[index]);
            },
          );
  }
}
/* Widget build(BuildContext context) {
    return FutureBuilder<List<Quiz>>(
      future: _quizController.getQuizesFromCategory(category),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(_quizController.getQuizesFromCategory('g').toString());
          //QuizTile(quiz: quiz);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

   andrei

  Widget build(BuildContext context) {
    //print(quizes.docs);
    var quizes = _quizController.quizes;

    return quizes == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: quizes.length,
            itemBuilder: (context, index) {
              return QuizTile(quiz: quizes[index]);
            },
          );
  }*/
