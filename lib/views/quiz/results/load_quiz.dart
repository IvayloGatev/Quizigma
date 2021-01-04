import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'package:quizigma/views/quiz/participate/radio_buttons.dart';
import 'package:quizigma/views/quiz/participate/sticky_header.dart';
import 'package:quizigma/views/quiz/results/results.dart';
import 'package:quizigma/views/quiz/participate/questions_tile.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/questions_list.dart';
import 'package:quizigma/views/quiz/participate/sticky_header.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:quizigma/views/home/home.dart';

class LoadQuiz extends StatefulWidget {
  final Quiz quiz;

  final List<String> selectedListString;
  final List<String> correctListString;
  final List<String> questionNameString;

  LoadQuiz(
      {this.quiz,
      this.selectedListString,
      this.correctListString,
      this.questionNameString});

  _LoadQuizState createState() => _LoadQuizState();
}

class _LoadQuizState extends State<LoadQuiz> {
  @override
  int totalScore = 0;
  // List<int> selection = new List<int>();
  // List<int> answers = new List<int>();

  List<int> counter(int x) {
    List<int> counter = new List<int>(x);
    for (int i = 0; i < counter.length; i++) {
      counter[i] = i + 1;
    }
    return counter;
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // selection.length = widget.quiz.numofQuestions;
    // answers.length = widget.quiz.numofQuestions;
    // List<int> counter1;
    // counter1 = counter(widget.quiz.numofQuestions);
    return Column(
      children: <Widget>[
        // Container(
        //   color: Colors.yellow,
        //   width: width,
        //   height: 100,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: <Widget>[
        //       Text(
        //         'Checking answers for Quiz:',
        //         style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
        //       ),
        //       Text(
        //         '${widget.quiz.name}',
        //         style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
        //       ),
        //       Text(
        //         '${widget.quiz.category}',
        //         style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
        //       ),
        //     ],
        //   ),
        // ),
        Column(
            children: List<Widget>.generate(
          widget.quiz.numofQuestions,
          (int i) => Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        '${widget.questionNameString[i]}?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.selectedListString[i]}',
                        style: TextStyle(
                            color: (widget.selectedListString[i] ==
                                    widget.correctListString[i])
                                ? Colors.green
                                : Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      (widget.selectedListString[i] ==
                              widget.correctListString[i])
                          ? Text('')
                          : Row(
                              children: [
                                Text('Answer: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text('${widget.correctListString[i]}',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ],
                            )
                    ],
                  )
                ],
              )),
        )),
        SizedBox(height: 10),
        Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: RaisedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('Done'),
            color: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
