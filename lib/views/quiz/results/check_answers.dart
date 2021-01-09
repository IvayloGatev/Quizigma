import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

/* This file displays the questions from the quiz, alongside the selection of 
the user. Should the selection be correct the border and the selection text will
highlight green. Otherwise they will be red and the correct answer will be shown. */

class CheckAnswers extends StatefulWidget {
  final Quiz quiz;

  final List<String> selectedAnswersAsStringList;
  final List<String> correctAnswersAsListString;
  final List<String> questionTextAsStringList;

  CheckAnswers(
      {this.quiz,
      this.selectedAnswersAsStringList,
      this.correctAnswersAsListString,
      this.questionTextAsStringList});

  _CheckAnswersState createState() => _CheckAnswersState();
}

class _CheckAnswersState extends State<CheckAnswers> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Column(
          children: [
            Container(
                width: width,
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10),
                  alignment: Alignment.centerLeft,
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
                        SizedBox(height: 10), // Space between the answer tiles
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: (widget.selectedAnswersAsStringList[i] ==
                                        widget.correctAnswersAsListString[i])
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
                                      Text(
                                          '${widget.questionTextAsStringList[i]}?',
                                          style: GoogleFonts.cabin(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '${widget.selectedAnswersAsStringList[i]}',
                                        style: GoogleFonts.cabin(
                                            color: (widget.selectedAnswersAsStringList[
                                                        i] ==
                                                    widget.correctAnswersAsListString[
                                                        i])
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
                                      (widget.selectedAnswersAsStringList[i] ==
                                              widget.correctAnswersAsListString[
                                                  i])
                                          ? Container()
                                          : Row(
                                              children: [
                                                Text('Answer: ',
                                                    style: GoogleFonts.cabin(
                                                      fontSize: 18,
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                    )),
                                                Text(
                                                    '${widget.correctAnswersAsListString[i]}',
                                                    style: GoogleFonts.cabin(
                                                        fontSize: 18,
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
          height: 5,
        ),
        Container(
          width: width,
          height: 40,
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
                style: GoogleFonts.cabin(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
