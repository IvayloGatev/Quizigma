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
          padding: const EdgeInsets.only(right: 10.0, left: 10),
          child: TextFormField(
            controller: widget.editor.questionTextController,
            decoration: InputDecoration(
              hintText: 'Enter the question',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple)),
            ),
            cursorColor: Colors.purple,
            validator: (v) {
              if (v.trim().isEmpty) return 'Please enter the question';
              return null;
            },
          )),
      AnswerList(editor: widget.editor)
    ]);
  }
}
