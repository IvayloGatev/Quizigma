import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quiz.dart';
import 'questions_tile.dart';

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  Quiz quiz;
  String category;
  Question question;

  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<List<Question>>(context);
    return questions == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return QuestionTile(question: questions[index]);
            },
          );
  }
}
