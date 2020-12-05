import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/creator/answer_tile.dart';

class AnswerList extends StatefulWidget {
  final List<TextEditingController> answerEditingControllers;

  AnswerList({this.answerEditingControllers});

  @override
  _AnswerListState createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList> {
  List<AnswerTile> answerTiles;
  List<TextEditingController> _answerEditingControllers;

  @override
  void initState() {
    super.initState();

    answerTiles = List<AnswerTile>();
    _answerEditingControllers = widget.answerEditingControllers;

    for (int i = 0; i < Question.minAnswers; i++) {
      answerTiles.add(
          AnswerTile(answerEditingController: _answerEditingControllers[i]));
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
              Expanded(child: answerTiles[i]),
              answerTiles.length <= Question.minAnswers
                  ? Container()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          answerTiles.removeAt(i);
                          _answerEditingControllers.removeAt(i);
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
                  _answerEditingControllers.add(TextEditingController());
                  answerTiles.add(AnswerTile(
                      answerEditingController: _answerEditingControllers.last));
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
