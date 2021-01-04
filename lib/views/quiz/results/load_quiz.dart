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
import 'package:google_fonts/google_fonts.dart';

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

  // List<int> counter(int x) {
  //   List<int> counter = new List<int>(x);
  //   for (int i = 0; i < counter.length; i++) {
  //     counter[i] = i + 1;
  //   }
  //   return counter;
  // }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Column(
          children: [
            Container(
                width: width,
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    // border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    '${widget.quiz.name}',
                    style: GoogleFonts.cabin(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ))
          ],
        ),
        Column(
            children: List<Widget>.generate(
                widget.quiz.numofQuestions,
                (int i) => Column(
                      children: [
                        SizedBox(height: 10), // space between the answer tiles
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: (widget.selectedListString[i] ==
                                        widget.correctListString[i])
                                    ? Colors.green[800]
                                    : Colors.red[600],
                                blurRadius: 4.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('${widget.questionNameString[i]}?',
                                          style: GoogleFonts.cabin(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '${widget.selectedListString[i]}',
                                        style: GoogleFonts.cabin(
                                            color: (widget.selectedListString[
                                                        i] ==
                                                    widget.correctListString[i])
                                                ? Colors.green[800]
                                                : Colors.red[600],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      (widget.selectedListString[i] ==
                                              widget.correctListString[i])
                                          ? Container()
                                          : Row(
                                              children: [
                                                Text('Answer: ',
                                                    style: GoogleFonts.cabin(
                                                      fontSize: 16,
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                    )),
                                                Text(
                                                    '${widget.correctListString[i]}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ],
                    ))),
        SizedBox(
          height: 0,
        ),
        Container(
          width: width,
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('Done',
                style: TextStyle(
                  color: Colors.white,
                )),
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
