import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';

class Join extends StatelessWidget {
  final QuizController _controller = QuizController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Welcome to your Quiz"),
      ),
    );
  }
}
