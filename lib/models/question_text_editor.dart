import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';

class QuestionTextEditor {
  TextEditingController _questionTextController;
  List<TextEditingController> _answerTextControllers;

  QuestionTextEditor() {
    _questionTextController = TextEditingController();
    _answerTextControllers = List<TextEditingController>();

    for (int i = 0; i < Question.minAnswers; i++) {
      _answerTextControllers.add(TextEditingController());
    }
  }

  TextEditingController get questionTextController {
    return _questionTextController;
  }

  List<TextEditingController> get asnwerTextControllers {
    return _answerTextControllers;
  }

  TextEditingController getAnswerControlerByIndex(int index) {
    return _answerTextControllers[index];
  }
}
