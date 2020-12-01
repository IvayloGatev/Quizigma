import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/creator/question_tile.dart';

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  List<QuestionTile> questionTiles =
      new List.from(List.filled(Quiz.minQuestions, QuestionTile()));

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
        itemCount: questionTiles.length,
        itemBuilder: (context, i) {
          return Row(children: [
            Expanded(child: questionTiles[i]),
            questionTiles.length <= Quiz.minQuestions
                ? Container()
                : InkWell(
                    onTap: () {
                      setState(() {
                        questionTiles.removeAt(i);
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
          ]);
        },
      )),
      InkWell(
        onTap: () {
          setState(() {
            questionTiles.add(QuestionTile());
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
      )
    ]);
  }
}
