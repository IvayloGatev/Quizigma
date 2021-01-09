import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/participate/answers_list.dart';
import 'question_tile.dart';
import 'package:quizigma/models/quiz.dart';

/* The file displays a ListView which contains every question & their possible 
answers. The question text and id are displayed by the 'QuestionTile' widget. 
The answers are provided to the user as radiobuttons that can be selected. */

class QuestionList extends StatefulWidget {
  final Quiz quiz;

  final Function(
      int score,
      List<String> selectedAnswersAsStringList,
      List<String> correctAnswersAsStringList,
      List<String> questionTextAsStringText) submitResults;
  QuestionList({this.quiz, this.submitResults});

  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  String category;
  Question question;
  int score = 0;

  // Data arrays used to show selections at a later date & calculate a score
  List<int> selectedAnswersAsIntList = List<int>();
  List<int> correctAnswersAsIntList = List<int>();
  List<String> questionTextAsStringList = List<String>();
  List<String> selectedAnswersAsStringList = List<String>();
  List<String> correctAnswersAsStringList = List<String>();

  // Compare array values, give score if they match
  int calculateScore(List<int> selections, List<int> answers) {
    int score = 0;
    for (int i = 0; i < answers.length; i++) {
      if (selections[i] == answers[i]) {
        score++;
      }
    }
    return score;
  }

  Widget build(BuildContext context) {
    // set the length of arrays
    correctAnswersAsIntList.length = widget.quiz.numofQuestions;
    selectedAnswersAsIntList.length = widget.quiz.numofQuestions;
    questionTextAsStringList.length = widget.quiz.numofQuestions;
    selectedAnswersAsStringList.length = widget.quiz.numofQuestions;
    correctAnswersAsStringList.length = widget.quiz.numofQuestions;

    final questions = Provider.of<List<Question>>(context);

    return questions == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: questions.length,
            itemBuilder: (context, index) {
              // Fill correct answer arrays
              correctAnswersAsIntList[index] = questions[index].correctAnswer;
              correctAnswersAsStringList[index] =
                  questions[index].answers[questions[index].correctAnswer];

              // Fill question text array
              questionTextAsStringList[index] = questions[index].text;

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.deepPurple,
                          width: 2,
                        )),
                        child: Column(
                          children: [
                            QuestionTile(question: questions[index]),
                            SizedBox(height: 2),
                            Column(children: [
                              AnswersAsRadioListTiles(
                                question: questions[index],
                                buttonSelected: (selectedListFromRadio,
                                    selectedStringList) {
                                  setState(() {
                                    // Get the selected answer arrays
                                    selectedAnswersAsIntList =
                                        selectedListFromRadio;
                                    selectedAnswersAsStringList =
                                        selectedStringList;

                                    // Calculate the score from current selection
                                    score = calculateScore(
                                        selectedAnswersAsIntList,
                                        correctAnswersAsIntList);

                                    // Submit results to "take_quiz"
                                    widget.submitResults(
                                        score,
                                        selectedAnswersAsStringList,
                                        correctAnswersAsStringList,
                                        questionTextAsStringList);
                                  });
                                },
                                selectedAnswersAsIntList:
                                    selectedAnswersAsIntList,
                                selectedAnswersAsStringList:
                                    selectedAnswersAsStringList,
                              )
                            ]),
                          ],
                        )),
                  ]);
            },
          );
  }
}
