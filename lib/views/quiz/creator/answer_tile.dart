import 'package:flutter/material.dart';
import 'package:quizigma/models/question_text_editor.dart';

class AnswerTile extends StatefulWidget {
  final QuestionTextEditor editor;
  final int index;

  AnswerTile({this.editor, this.index});

  @override
  _AnswerTileState createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: TextFormField(
        controller: widget.editor.answerTextControllers[widget.index],
        decoration: InputDecoration(hintText: 'Enter an answer'),
        validator: (v) {
          if (v.trim().isEmpty) return 'Please enter an answer';
          return null;
        },
      ),
    );
  }
}
