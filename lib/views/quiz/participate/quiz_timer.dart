import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/results/results.dart';
import 'dart:async';
import 'package:quizigma/services/firestore_database.dart';

/* This file creates the widget displaying the time the user has to complete
the quiz. Upon timer ending, the user will be routed to the score screen.
Unanswered questions will be treated as wrong answers. */

class QuizTimer extends StatefulWidget {
  final int quizTime;
  final int score;
  final List<String> selectedAnswersAsStringList;
  final List<String> correctAnswersAsStringList;
  final List<String> questionTextAsStringList;
  final Quiz quiz;

  QuizTimer(
      {this.quizTime,
      this.quiz,
      this.score,
      this.selectedAnswersAsStringList,
      this.correctAnswersAsStringList,
      this.questionTextAsStringList});

  @override
  _QuizTimerState createState() => _QuizTimerState();
}

const TWO_PI = 3.14 * 2;

class _QuizTimerState extends State<QuizTimer> {
  int _counter;
  Timer _timer;

  int totalScore = 0;
  List<Question> questions = new List<Question>();
  List<String> selectedAnswerAsStringList = new List<String>();
  List<String> correctAnswerAsStringList = new List<String>();
  List<String> questionTextAsStringList = new List<String>();

  // Method obtains all the questions in the quiz for future use
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

    selectedAnswerAsStringList.length = widget.quiz.numofQuestions;
    correctAnswerAsStringList.length = widget.quiz.numofQuestions;
    questionTextAsStringList.length = widget.quiz.numofQuestions;

    selectedAnswerAsStringList = widget.selectedAnswersAsStringList;
    correctAnswerAsStringList = widget.correctAnswersAsStringList;
    questionTextAsStringList = widget.questionTextAsStringList;

    final size = 75.0;

    // Onscreen timer
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
                            center: Alignment.center,
                            colors: [Colors.white, Colors.white24])
                        .createShader(rect);
                  },
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: Image.asset("assets/images/radial_scale.png")
                                .image)),
                  ),
                ),
                Center(
                  child: Container(
                    width: size - 20,
                    height: size - 20,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.white, blurRadius: 2)
                        ]),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$_counter',
                          style: GoogleFonts.cabin(
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              color: Colors.white),
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

  // Method to control the timer on screen
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

          // Once timer hits 0 after 1s delay open the results screen
          _timer = new Timer(const Duration(seconds: 1), () {
            // Obtain the questions in the quiz
            getQuestions(widget.quiz.id);
            Future.delayed(const Duration(milliseconds: 300), () {
              /* Data lists containing answer selection, correct answer & question name 
              are filled and passed to the score screen for future use */
              for (int i = 0; i < selectedAnswerAsStringList.length; i++) {
                if (selectedAnswerAsStringList[i] == null) {
                  selectedAnswerAsStringList[i] = 'No answer selected';
                }
              }
              for (int i = 0; i < correctAnswerAsStringList.length; i++) {
                if (correctAnswerAsStringList[i] == null) {
                  correctAnswerAsStringList[i] =
                      questions[i].answers[questions[i].correctAnswer];
                }
              }
              for (int i = 0; i < questionTextAsStringList.length; i++) {
                if (questionTextAsStringList[i] == null) {
                  questionTextAsStringList[i] = questions[i].text;
                }
              }

              // Pass the data to the results screen
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            quiz: widget.quiz,
                            score: widget.score,
                            selectedAnswersAsStringList:
                                selectedAnswerAsStringList,
                            correctAnswersAsStringList:
                                correctAnswerAsStringList,
                            questionTextAsStringList: questionTextAsStringList,
                          )));
            });
          });
        }
      });
    });
  }

  // Dispose of question timer when not needed
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  // Start timer as soon as quiz loads
  void initState() {
    super.initState();
    int seconds = widget.quizTime;
    _startTimer(seconds);
  }
}
