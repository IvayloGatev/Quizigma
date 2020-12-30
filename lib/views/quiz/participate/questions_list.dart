import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'questions_tile.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';

class QuestionList extends StatefulWidget {
  @override
  final Quiz quiz;
  QuestionList({this.quiz});

  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  String category;
  Question question;
  int selectedRadio = -1;
  int case2Value1 = 0;
  int case2Value2 = 1;

  int case3Value1 = 0;
  int case3Value2 = 1;
  int case3Value3 = 2;

  int questionCounter;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   final questions = Provider.of<List<Question>>(context);
  //   return questions == null
  //       ? Center(child: CircularProgressIndicator())
  //       : ListView.builder(
  //           itemCount: questions.length,
  //           itemBuilder: (context, index) {
  //             return QuestionTile(question: questions[index]);
  //           },
  //         );
  // }

  Widget build(BuildContext context) {
    final questions = Provider.of<List<Question>>(context);
    return questions == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              questionCounter = index + 1;

              return Container(
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('Question $questionCounter',
                              style: TextStyle(
                                fontSize: 22,
                              )),
                          QuestionTimer(
                            quizTime: widget.quiz.timeInSeconds,
                          ),
                        ],
                      ),
                      QuestionTile(question: questions[index]),
                      _getAnswers(questions[index]),
                      RaisedButton(
                        onPressed: () {
                          _checkAnswer(questions[index].correctAnswer);
                        },
                        child: Text('Submit'),
                        color: Colors.deepPurple,
                      )
                    ],
                  ));
            },
          );
  }

  bool _checkAnswer(int x) {
    print('correct answer $x');
    print('selected $selectedRadio');
    if (selectedRadio == x) {
      print("correct");

      return true;
    }
    print("false");
    return false;
  }

  Column _getAnswers(Question question) {
    int i = -1;
    do {
      i++;
      switch (question.answers.length) {
        case 2:
          print('case 2');
          return Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[0],
                  ),
                  value: case2Value1,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[1],
                  ),
                  value: case2Value2,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              )
            ],
          );

          break;
        case 3:
          print('case 3');
          return Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[0],
                  ),
                  value: case3Value1,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[1],
                  ),
                  value: case3Value2,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[2],
                  ),
                  value: case3Value3,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              )
            ],
          );
          break;
        case 4:
          print('case 4');
          return Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[0],
                  ),
                  value: 0,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[1],
                  ),
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[2],
                  ),
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[3],
                  ),
                  value: 3,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              )
            ],
          );
          break;
        case 5:
          print('case 5');
          return Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[0],
                  ),
                  value: 0,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[1],
                  ),
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[2],
                  ),
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[3],
                  ),
                  value: 3,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile(
                  title: Text(
                    question.answers[4],
                  ),
                  value: 4,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  },
                ),
              )
            ],
          );
          break;
        default:
          return Column(children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: RadioListTile(
                title: Text(
                  question.answers[0],
                ),
                value: 1,
                groupValue: selectedRadio,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadio(val);
                },
              ),
            )
          ]);
      }
    } while (question.answers.length > i);
  }
}
