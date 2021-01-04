import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'package:quizigma/views/quiz/participate/radio_buttons.dart';
import 'package:quizigma/views/quiz/participate/sticky_header.dart';
import 'package:quizigma/views/quiz/results/results.dart';
import 'questions_tile.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';
import 'questions_list.dart';
import 'sticky_header.dart';
import 'package:sticky_headers/sticky_headers.dart';

class TakeQuiz extends StatefulWidget {
  final Quiz quiz;

  TakeQuiz({this.quiz});

  _TakeQuizState createState() => _TakeQuizState();
}

class _TakeQuizState extends State<TakeQuiz> {
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print('init');
  // }

  // @override
  // void dispose() {
  //   //_timer.cancel();

  //   super.dispose();
  //   print('dispose');
  // }

  int totalScore = 0;

  List<String> selectionString = new List<String>();
  List<String> answersString = new List<String>();
  List<String> questionNameString = new List<String>();

  Widget build(BuildContext context) {
    selectionString.length = widget.quiz.numofQuestions;
    answersString.length = widget.quiz.numofQuestions;
    questionNameString.length = widget.quiz.numofQuestions;

    for (int i = 0; i < selectionString.length; i++) {
      if (selectionString[i] == null) {
        selectionString[i] = 'No answer selected';
      }
    }

    // for (int i = 0; i < answersString.length; i++) {
    //   if (answersString[i] == null) {
    //     answersString[i] = widget.quiz.questions[i].correctAnswer.toString();
    //   }
    // }
    // for (int i = 0; i < questionNameString.length; i++) {
    //   if (questionNameString[i] == null) {
    //     questionNameString[i] = widget.quiz.questions[i].text;
    //   }
    // }

    print(answersString.toString());
    print(selectionString.toString());
    print(questionNameString.toString());

    return StickyHeader(
        header: Container(
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          padding: EdgeInsets.only(left: 10),
          child: StickyHeaderForQuiz(
            quiz: widget.quiz,
            score: totalScore,
            selectionList: selectionString,
            correctList: answersString,
            questionName: questionNameString,
          ),
        ),
        content: Column(
          children: [
            Container(
              // width: width,
              // height: height * 0.685,
              color: Colors.white,

              //width and height fields manadatory so the questionlist can load into the screen
              //takes height of quiz with most questions
              //how to do this dynamically?

              child: QuestionList(
                quiz: widget.quiz,
                submit: (scoreFromList, selectionsFromListString,
                    answersFromListString, questionNameList) {
                  setState(() {
                    // get the score
                    totalScore = scoreFromList;

                    selectionString = selectionsFromListString;
                    answersString = answersFromListString;
                    questionNameString = questionNameList;
                    // print(selectionString.toString());
                    // print(totalScore);
                    // print(selection.toString());
                    // print(answers.toString());
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              //  color: Colors.deepPurple,
              child: RaisedButton(
                onPressed: () {
                  // checkAnswers([0, 0, 0, 0], widget.quiz);
                  //      print('pushed button $totalScore');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Results(
                                quiz: widget.quiz,
                                score: totalScore,
                                selectionListString: selectionString,
                                correctListString: answersString,
                                questionName: questionNameString,
                              )));
                  // how to get radio button values and check for final score
                  // pass score when timer hits 0?
                },
                child: Text('Submit'),
                color: Colors.yellow,
                
              ),
            )
          ],
        ));
  }
}
