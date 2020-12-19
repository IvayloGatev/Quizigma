import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/quiz.dart';
import 'quiz_tile.dart';

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
