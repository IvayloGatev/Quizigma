import 'package:flutter/material.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/creator/answer_list.dart';
import 'package:quizigma/views/quiz/creator/question_tile.dart';

class QuestionList extends StatefulWidget {
  final List<QuestionTextEditor> editors;

  QuestionList({this.editors});

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  List<QuestionTile> questionTiles;
  List<QuestionTextEditor> _editors;

  @override
  void initState() {
    super.initState();

    setState(() {
      questionTiles = List<QuestionTile>();
      _editors = widget.editors;

      for (int i = 0; i < Quiz.minQuestions; i++) {
        _editors.add(QuestionTextEditor());
        questionTiles.add(QuestionTile(questionTextEditor: _editors[i]));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
        itemCount: questionTiles.length,
        itemBuilder: (context, i) {
          return Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Expanded(child: questionTiles[i]),
              questionTiles.length <= Quiz.minQuestions
                  ? Container()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          questionTiles.removeAt(i);
                          _editors.removeAt(i);
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
      InkWell(
        onTap: () {
          setState(() {
            _editors.add(QuestionTextEditor());
            questionTiles.add(QuestionTile(questionTextEditor: _editors.last));
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
