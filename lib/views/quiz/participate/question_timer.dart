import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quiz.dart';
import 'categories_screen.dart';
import 'package:quizigma/views/quiz/results/results.dart';
import 'dart:async';
import 'package:quizigma/services/firestore_database.dart';

class QuestionTimer extends StatefulWidget {
  final int quizTime;
  final int score;
  // final List<String> selectionList;
  // final List<String> correctList;
  // final List<String> questionName;
  final Quiz quiz;

  QuestionTimer({
    this.quizTime,
    this.quiz,
    this.score,
    //this.selectionList,
    //this.correctList,
    //this.questionName
  });

  @override
  _QuestionTimerState createState() => _QuestionTimerState();
}

const TWO_PI = 3.14 * 2;

class _QuestionTimerState extends State<QuestionTimer> {
  int _counter;
  Timer _timer;
  List<Question> questions = new List<Question>();
  int totalScore = 0;
  List<String> selectionString = new List<String>();
  List<String> answersString = new List<String>();
  List<String> questionNameString = new List<String>();

  getQuestions(String id) async {
    FirestoreDatabase firestoreDatabase = FirestoreDatabase();
    List<Question> val = await firestoreDatabase.getQuestions(id);
    setState(() {
      questions = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    int seconds = widget.quizTime;
    selectionString.length = widget.quiz.numofQuestions;
    answersString.length = widget.quiz.numofQuestions;
    questionNameString.length = widget.quiz.numofQuestions;
    final size = 75.0;

    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(16),
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(seconds: (seconds)),
        builder: (context, value, child) {
          return Container(
            width: size,
            height: size,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                        startAngle: 0.0,
                        endAngle: TWO_PI,
                        stops: [value, value],
                        // 0.0 , 0.5 , 0.5 , 1.0
                        center: Alignment.center,
                        colors: [
                          Colors.purple[600],
                          Colors.grey.withAlpha(55)
                        ]).createShader(rect);
                  },
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.yellow,
                        image: DecorationImage(
                            image: Image.asset("assets/images/radial_scale.png")
                                .image)),
                  ),
                ),
                Center(
                  child: Container(
                    width: size - 15,
                    height: size - 15,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        (_counter < 10)
                            ? Text(
                                '$_counter',
                                style:
                                    TextStyle(fontSize: 28, color: Colors.red),
                              )
                            : Text(
                                '$_counter',
                                style: TextStyle(fontSize: 28),
                              ),
                      ],
                    )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _startTimer(int timeInSeconds) {
    _counter = timeInSeconds;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();

          _timer = new Timer(const Duration(seconds: 1), () {
            getQuestions(widget.quiz.id);

            Future.delayed(const Duration(milliseconds: 300), () {
              for (int i = 0; i < selectionString.length; i++) {
                if (selectionString[i] == null) {
                  selectionString[i] = 'No answer selected';
                }
              }
              for (int i = 0; i < answersString.length; i++) {
                if (answersString[i] == null) {
                  answersString[i] =
                      questions[i].answers[questions[i].correctAnswer];
                }
              }
              for (int i = 0; i < questionNameString.length; i++) {
                if (questionNameString[i] == null) {
                  questionNameString[i] = questions[i].text;
                }
              }
              print(selectionString.toString());
              print(answersString.toString());
              print(questionNameString.toString());
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            quiz: widget.quiz,
                            score: widget.score,
                            selectionListString: selectionString,
                            correctListString: answersString,
                            questionName: questionNameString,
                          )));
            });
          });
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    print('dispose');
  }

  void initState() {
    super.initState();
    print('init');

    int seconds = widget.quizTime;

    _startTimer(seconds);
  }
}
