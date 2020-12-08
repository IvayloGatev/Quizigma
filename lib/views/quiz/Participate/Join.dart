import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/Participate/quiz_list.dart';

class Join extends StatelessWidget {
  final _quizController = QuizController();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Quiz>>.value(
      value: _quizController.quizes,
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Welcome to your Quiz"),
        ),
        body: QuizList(),
      ),
    );
  }
}
