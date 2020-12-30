import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/quiz.dart';
import 'quiz_tile.dart';

class QuizList extends StatefulWidget {
  final String title;
  const QuizList({this.title});

  @override
  _QuizListState createState() => _QuizListState(title);
}

class _QuizListState extends State<QuizList> {
  Quiz quiz;
  final String title;

  _QuizListState(this.title);

  @override
  Widget build(BuildContext context) {
    final quizes = Provider.of<List<Quiz>>(context);
    return quizes == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: quizes.length,
            itemBuilder: (context, index) {
              if (quizes[index].category == title) {
                return QuizTile(
                  quiz: quizes[index],
                );
              } else
                return Container();
            });
  }
}
