import 'package:flutter/material.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/creator/question_tile.dart';
import 'package:quizigma/views/quiz/creator/round_button.dart';

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
        questionTiles.add(QuestionTile(key: ObjectKey(i), editor: _editors[i]));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: questionTiles.length,
          itemBuilder: (context, i) {
            return Container(
                margin: const EdgeInsets.all(2.0),
                padding: const EdgeInsets.all(2.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.deepPurple)),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10, top: 10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: questionTiles[i]),
                          questionTiles.length <= Quiz.minQuestions
                              ? Container(
                                  width: 30,
                                )
                              : RoundButton(
                                  onTap: () {
                                    setState(() {
                                      _editors.removeAt(i);
                                      questionTiles.removeAt(i);
                                    });
                                  },
                                  color: Colors.deepPurple,
                                  icon: Icons.remove)
                        ]),
                  )
                ]));
          }),
      SizedBox(height: 15),
      RoundButton(
          onTap: () {
            setState(() {
              _editors.add(QuestionTextEditor());
              questionTiles.add(QuestionTile(
                  key: ObjectKey(questionTiles.length), editor: _editors.last));
            });
          },
          color: Colors.deepPurple,
          icon: Icons.add)
    ]);
  }
}
