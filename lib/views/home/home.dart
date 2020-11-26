import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/Participate/Participate.dart';

class Home extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('home_title') +
                'Quizigma'),
            backgroundColor: Colors.purple,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text(
                    AppLocalizations.of(context).translate('logout_label')),
                onPressed: () async {
                  await _controller.signOut();
                },
              )
            ]),
        body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            FlatButton(
              height: 70.00,
              minWidth: 70.00,
              child: Text("Create Quiz", style: TextStyle(fontSize: 15)),
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () {
                print('create!');
                QuizController con = QuizController();
                List<String> answersList = [
                  "_answer1",
                  "_answer2",
                  "_answer3",
                  "_answer4",
                  "_answer5"
                ];
                List<Question> questions = List();
                for (var i = 0; i < 10; i++) {
                  questions
                      .add(Question(i, 'what to ask?', answersList, 3, 15));
                }
                Quiz quiz =
                    Quiz('test_category', 'test_name', questions, null, null);
                con.addQuiz(quiz);
              },
            ),
            SizedBox(width: 15),
            FlatButton(
              height: 70.00,
              minWidth: 100.00,
              child:
                  Text("Participate in Quiz", style: TextStyle(fontSize: 15)),
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Participate()));

                /*  print('participate!');
                QuizController con = QuizController();
                Quiz quiz = await con.getQuiz("q11p73no");
                print(quiz.id + " " + quiz.questions.length.toString());
              */
              },
            ),
          ]),
        ));
  }
}
