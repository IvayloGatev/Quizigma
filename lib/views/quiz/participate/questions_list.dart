import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'questions_tile.dart';
import 'package:quizigma/services/firestore_database.dart';

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
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
