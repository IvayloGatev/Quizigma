import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/views/quiz/creator/answer_list.dart';

class QuestionTile extends StatefulWidget {
  final QuestionTextEditor editor;

  QuestionTile({Key key, this.editor}) : super(key: key);

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(left: 10, right: 10.0),
          child: TextFormField(
            controller: widget.editor.questionTextController,
            decoration: InputDecoration(hintText: 'Enter the question'),
            validator: (v) {
              if (v.trim().isEmpty) return 'Please enter the question';
              return null;
            },
          )),
      SizedBox(
        height: 400,
        child: AnswerList(editor: widget.editor),
      ),
    ]);
  }
}
