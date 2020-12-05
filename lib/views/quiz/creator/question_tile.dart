import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/views/quiz/creator/answer_list.dart';

class QuestionTile extends StatefulWidget {
  final QuestionTextEditor questionTextEditor;

  QuestionTile({this.questionTextEditor});

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: TextFormField(
            controller: widget.questionTextEditor.questionTextController,
            decoration: InputDecoration(hintText: 'Enter the question'),
            validator: (v) {
              if (v.trim().isEmpty) return 'Please enter the question';
              return null;
            },
          )),
      SizedBox(
        height: 500,
        child: AnswerList(
            answerEditingControllers:
                widget.questionTextEditor.asnwerTextControllers),
      ),
    ]);
  }
}
