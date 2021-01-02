import 'package:flutter/cupertino.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'package:quizigma/models/quiz.dart';

class StickyHeaderForQuiz extends StatefulWidget {
  @override
  final Quiz quiz;

  StickyHeaderForQuiz({this.quiz});

  _StickyHeaderForQuizState createState() => _StickyHeaderForQuizState();
}

class _StickyHeaderForQuizState extends State<StickyHeaderForQuiz> {
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '${widget.quiz.name}',
              style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
            ),
            Text(
              '${widget.quiz.category}',
              style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        Spacer(),
        QuestionTimer(quizTime: widget.quiz.timeInSeconds, quiz: widget.quiz),
      ],
    );
  }
}
