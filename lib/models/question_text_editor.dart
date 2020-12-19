import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';

class QuestionTextEditor {
  TextEditingController _questionTextController;
  List<TextEditingController> _answerTextControllers;
  int _correctAnswer;

  QuestionTextEditor() {
    _questionTextController = TextEditingController();
    _answerTextControllers = List<TextEditingController>();
    _correctAnswer = 0;

    for (int i = 0; i < Question.minAnswers; i++) {
      _answerTextControllers.add(TextEditingController());
    }
  }

  TextEditingController get questionTextController {
    return _questionTextController;
  }

  List<TextEditingController> get answerTextControllers {
    return _answerTextControllers;
  }

  int get correctAnswer {
    return _correctAnswer;
  }

  set correctAnswer(int value) {
    _correctAnswer = value;
  }
}
