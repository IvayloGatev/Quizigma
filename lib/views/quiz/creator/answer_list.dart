import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/views/quiz/creator/answer_tile.dart';

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
                  : InkWell(
                      onTap: () {
                        setState(() {
                          _editor.removeAnswerTextController(i);
                          _answerTiles.removeAt(i);
                          if (_editor.correctAnswer >= _answerTiles.length) {
                            _editor.correctAnswer--;
                          }
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    )
            ]),
          ]);
        },
      ),
      SizedBox(height: 10),
      _answerTiles.length >= Question.maxAnswers
          ? Container()
          : InkWell(
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
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
    ]);
  }
}
