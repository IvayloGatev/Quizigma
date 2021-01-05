import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/views/quiz/creator/creator.dart';
import 'package:quizigma/views/quiz/participate/categories_screen.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';
import 'package:quizigma/views/quiz/participate/quiz_id.dart';
import 'package:quizigma/views/quiz/results/check_answers.dart';
import 'package:quizigma/views/quiz/results/results.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';

class Home extends StatelessWidget {
  final _controller = HomeController();
  //Question question = Question(1, 'Question', ['1', '2'], 0);
  Quiz quiz = Quiz(
      'Literature',
      'Randomly long name to see how long text is really shown because, honestly  i dont know what it will look like, how about',
      [
        Question(
            1,
            'Randomly long question1 to see how long text is really shown because, honestly  i dont know what it will look like, how about',
            ['q1Answer 1', 'q1Answer 2'],
            0),
        Question(
            2,
            'Randomly long question2 to see how long text is really shown because, honestly  i dont know what it will look like, how about',
            ['q2Answer 1', 'q2Answer 2'],
            0)
      ],
      30,
      5);

  List<String> selectionString = ['q1Answer 1', 'q2Answer 2'];
  List<String> correctString = ['Correct Answer', 'q2Answer 2'];
  List<String> questionNameString = [
    'Randomly long question1 to see how long text is really shown because, honestly  i dont know what it will look like, how about',
    'Randomly long question2 to see how long text is really shown because, honestly  i dont know what it will look like, how about'
  ];

  int score = 1;
  Quiz quizForUI = Quiz(
      'Extremely long randomly selected category to see what happens',
      'Extremely long randomly selected name to see what happens',
      [
        Question(1, 'What is the name of the biggest human bone',
            ['Femur', 'Frontal bone', 'Humerus', 'Trapezium'], 0),
        Question(2, 'Which is the strongest Human muscle',
            ['Tongue', 'Heart', 'Masseter', 'Soleus'], 2),
        Question(3, 'How many bones an adult Human has',
            ['187', '234', '206', '199'], 2)
      ],
      25,
      3);
  @override
  Widget build(BuildContext context) {
    selectionString.length = 2;
    correctString.length = 2;
    questionNameString.length = 2;
    return Scaffold(
        //backgroundColor: Colors.purple[50],
        appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).translate('home_title') + 'Quizigma',
              style: GoogleFonts.cabin(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            backgroundColor: Colors.deepPurple,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                //color: Colors.white,
                label: Text(
                  AppLocalizations.of(context).translate('logout_label'),
                ),
                onPressed: () async {
                  await _controller.signOut();
                },
              )
            ]),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 15),
                Container(
                  width: 200,
                  child: RaisedButton(
                    //height: 70.00,
                    //minWidth: 100.00,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Create a Quiz",
                      style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizCreator(
                                    category: 'Other',
                                  )));
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: RaisedButton(
                    //height: 70.00,
                    //minWidth: 100.00,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Quiz Categories",
                      style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesScreen()));
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: RaisedButton(
                    //height: 70.00,
                    //minWidth: 100.00,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text("Join Quiz by ID",
                        style: GoogleFonts.cabin(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                        textAlign: TextAlign.center),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuizID()));
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: RaisedButton(
                    //height: 70.00,
                    //minWidth: 100.00,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text("Test answer page",
                        style: GoogleFonts.cabin(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                        textAlign: TextAlign.center),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckAnswersPage(
                                  quiz,
                                  selectionString,
                                  correctString,
                                  questionNameString)));
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: RaisedButton(
                    //height: 70.00,
                    //minWidth: 100.00,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text("Test Score page",
                        style: GoogleFonts.cabin(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                        textAlign: TextAlign.center),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Results(
                                    quiz: quiz,
                                    score: score,
                                    selectionListString: selectionString,
                                    correctListString: correctString,
                                    questionName: questionNameString,
                                  )));
                    },
                  ),
                ),
              ]),
        ));
  }
}
