import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/results/results.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';
import 'question_list.dart';
import 'custom_sticky_header.dart';
import 'package:sticky_headers/sticky_headers.dart';

/* When called, this file will create a widget which is the entire quiz the user
will see and play with. The quiz is comprised by a StickyHeader containing the 
quiz name, category & timer. Followed by the ListView containing the questions and
their answers. Finally at the bottom, there is a submit button which confirms selection
and routes the user to the results page. */

class LoadQuiz extends StatefulWidget {
  final Quiz quiz;

  LoadQuiz({this.quiz});

  _LoadQuizState createState() => _LoadQuizState();
}

class _LoadQuizState extends State<LoadQuiz> {
  List<Question> questions = new List<Question>();

  // Method to obtain the quiz via its ID, to load data at a later point
  getQuestions(String id) async {
    FirestoreDatabase firestoreDatabase = FirestoreDatabase();
    List<Question> val = await firestoreDatabase.getQuestions(id);
    setState(() {
      questions = val;
    });
  }

  int totalScore = 0;

  List<String> selectedAnswersAsStringList = new List<String>();
  List<String> correctAnswersAsStringList = new List<String>();
  List<String> questionTextAsStringList = new List<String>();

  Widget build(BuildContext context) {
    // Fix length of the data arrays
    selectedAnswersAsStringList.length = widget.quiz.numofQuestions;
    correctAnswersAsStringList.length = widget.quiz.numofQuestions;
    questionTextAsStringList.length = widget.quiz.numofQuestions;

    double width = MediaQuery.of(context).size.width;
    return StickyHeader(
        header: Container(
          width: width,
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 6.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
          padding: EdgeInsets.only(left: 10),
          // Send the current data to the widget
          child: StickyHeaderBody(
            quiz: widget.quiz,
            score: totalScore,
            selectedAnswersAsStringList: selectedAnswersAsStringList,
            correctAnswersAsStringList: correctAnswersAsStringList,
            questionTextAsStringList: questionTextAsStringList,
          ),
        ),
        content: Column(
          children: [
            Container(
              child: QuestionList(
                quiz: widget.quiz,
                submitResults: (scoreFromList, selectionsFromListString,
                    answersFromListString, questionNameList) {
                  setState(() {
                    // Get the score from the radio buttons
                    totalScore = scoreFromList;
                    selectedAnswersAsStringList = selectionsFromListString;
                    correctAnswersAsStringList = answersFromListString;
                    questionTextAsStringList = questionNameList;
                  });
                },
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                onPressed: () {
                  // Load the questions from the quiz
                  getQuestions(widget.quiz.id);

                  Future.delayed(const Duration(milliseconds: 300), () {
                    // Check arrays for null values and fill accordingly
                    for (int i = 0;
                        i < selectedAnswersAsStringList.length;
                        i++) {
                      if (selectedAnswersAsStringList[i] == null) {
                        selectedAnswersAsStringList[i] = 'No answer selected';
                      }
                    }
                    for (int i = 0;
                        i < correctAnswersAsStringList.length;
                        i++) {
                      if (correctAnswersAsStringList[i] == null) {
                        correctAnswersAsStringList[i] =
                            questions[i].answers[questions[i].correctAnswer];
                      }
                    }
                    for (int i = 0; i < questionTextAsStringList.length; i++) {
                      if (questionTextAsStringList[i] == null) {
                        questionTextAsStringList[i] = questions[i].text;
                      }
                    }

                    // Pass results to results page
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results(
                                  quiz: widget.quiz,
                                  score: totalScore,
                                  selectedAnswersAsStringList:
                                      selectedAnswersAsStringList,
                                  correctAnswersAsStringList:
                                      correctAnswersAsStringList,
                                  questionTextAsStringList:
                                      questionTextAsStringList,
                                )));
                  });
                },
                child: Text(
                  'Submit',
                  style: GoogleFonts.cabin(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                color: Colors.deepPurple,
              ),
            )
          ],
        ));
  }
}
