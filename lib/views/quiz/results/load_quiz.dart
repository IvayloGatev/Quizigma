import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';
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
                                                      fontSize: 18,
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                    )),
                                                Text(
                                                    '${widget.correctListString[i]}',
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
