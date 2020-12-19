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
  List<AnswerTile> answerTiles;

  @override
  void initState() {
    super.initState();

    answerTiles = List<AnswerTile>();

    for (int i = 0; i < Question.minAnswers; i++) {
      answerTiles.add(AnswerTile(editor: widget.editor, index: i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
        itemCount: answerTiles.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, i) {
          return Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Radio(
                  groupValue: widget.editor.correctAnswer,
                  value: i,
                  onChanged: (int value) {
                    setState(() {
                      widget.editor.correctAnswer = value;
                    });
                  }),
              Expanded(child: answerTiles[i]),
              answerTiles.length <= Question.minAnswers
                  ? Container()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          widget.editor.answerTextControllers.removeAt(i);
                          answerTiles.removeAt(i);
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
      )),
      answerTiles.length >= Question.maxAnswers
          ? Container()
          : InkWell(
              onTap: () {
                setState(() {
                  int index = widget.editor.answerTextControllers.length;
                  widget.editor.answerTextControllers
                      .add(TextEditingController());
                  answerTiles.add(AnswerTile(
                    editor: widget.editor,
                    index: index,
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
