import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/views/quiz/creator/answer_list.dart';
import 'package:google_fonts/google_fonts.dart';

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
            style: GoogleFonts.cabin(
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.7)),
            controller: widget.editor.questionTextController,
            decoration: InputDecoration(
              hintText: 'Enter the question',
              hintStyle: GoogleFonts.cabin(
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.7),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
            ),
            cursorColor: Colors.deepPurple,
            // Check if the question text field is empty.
            validator: (v) {
              if (v.trim().isEmpty) return 'Please enter the question';
              return null;
            },
          )),
      AnswerList(editor: widget.editor)
    ]);
  }
}
