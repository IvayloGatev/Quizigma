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
  final List<int> selectionList;
  final List<int> correctList;
  final List<String> selectedListString;
  final List<String> correctListString;
  final List<String> questionNameString;

  LoadQuiz(
      {this.quiz,
      this.selectionList,
      this.correctList,
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
    List<int> counter1;
    counter1 = counter(widget.quiz.numofQuestions);
    return Column(
      children: <Widget>[
        Container(
          color: Colors.deepPurple[100],
          width: width,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Checking answers for Quiz:',
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic, color: Colors.black45),
              ),
              Text(
                '${widget.quiz.name}',
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic, color: Colors.black45),
              ),
              Text(
                '${widget.quiz.category}',
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic, color: Colors.black45),
              ),
            ],
          ),
        ),
        Column(
            children: List<Widget>.generate(
          widget.quiz.numofQuestions,
          (int i) => Card(
            color: (widget.selectedListString[i] == widget.correctListString[i])
                ? Colors.green[200]
                : Colors.red[200],
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
                title: Text('Question ' +
                    '${counter1[i]}' +
                    ': ' +
                    '${widget.questionNameString[i]}'),
                subtitle: Text('Your answer: ' +
                    '${widget.selectedListString[i]}' +
                    ' Correct answer: ' +
                    '${widget.correctListString[i]}')),
          ),
        )),
        SizedBox(height: 10),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
              onPressed: () {
                // checkAnswers([0, 0, 0, 0], widget.quiz);
                //      print('pushed button $totalScore');
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
                // how to get radio button values and check for final score
                // pass score when timer hits 0?
              },
              child: Text('Home', style: TextStyle(color: Colors.white,)),
              color: Colors.deepPurple,
            ),
            RaisedButton(
              padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
              onPressed: () {
                // checkAnswers([0, 0, 0, 0], widget.quiz);
                //      print('pushed button $totalScore');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JoinQuestions(
                              quiz: widget.quiz,
                              quizId: widget.quiz.id,
                            )));
                // how to get radio button values and check for final score
                // pass score when timer hits 0?
              },
              child: Text('Retake Quiz', style: TextStyle(color: Colors.white,)),
              color: Colors.deepPurple,
            ),
          ],
        )),
      ],
    );
  }
}
