import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/views/quiz/creator/answer_tile.dart';
import 'package:quizigma/views/quiz/creator/round_button.dart';

class AnswerList extends StatefulWidget {
  final QuestionTextEditor editor;

  AnswerList({this.editor});

  @override
  _AnswerListState createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList> {
  List<AnswerTile> _answerTiles;
  QuestionTextEditor _editor;

  @override
  void initState() {
    super.initState();

    _editor = widget.editor;
    _answerTiles = List<AnswerTile>();

    // Initialize the answer tiles.
    for (int i = 0; i < Question.minAnswers; i++) {
      _answerTiles.add(AnswerTile(
        key: ObjectKey(i),
        answerEditingController: _editor.answerTextControllers[i],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Display the coresponding number of answer tiles.
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _answerTiles.length,
        itemBuilder: (context, i) {
          return Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Radio(
                  groupValue: _editor.correctAnswer,
                  activeColor: Colors.green,
                  value: i,
                  onChanged: (int value) {
                    setState(() {
                      _editor.correctAnswer = value;
                    });
                  }),
              Expanded(child: _answerTiles[i]),
              _answerTiles.length <= Question.minAnswers
                  ? Container(
                      width: 30,
                    )
                  // Remove an answer.
                  : RoundButton(
                      onTap: () {
                        setState(() {
                          _editor.removeAnswerTextController(i);
                          _answerTiles.removeAt(i);
                          if (_editor.correctAnswer >= _answerTiles.length) {
                            _editor.correctAnswer--;
                          }
                        });
                      },
                      color: Colors.red,
                      icon: Icons.remove)
            ]),
          ]);
        },
      ),
      SizedBox(height: 10),
      _answerTiles.length >= Question.maxAnswers
          ? Container()
          // Add an answer.
          : RoundButton(
              onTap: () {
                setState(() {
                  _editor.answerTextControllers.add(TextEditingController());
                  _answerTiles.add(AnswerTile(
                    key: ObjectKey(_answerTiles.length),
                    answerEditingController: _editor.answerTextControllers[
                        _editor.answerTextControllers.length - 1],
                  ));
                });
              },
              color: Colors.green,
              icon: Icons.add),
    ]);
  }
}
