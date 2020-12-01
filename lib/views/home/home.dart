import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/views/quiz/Participate/Participate.dart';
import 'package:quizigma/views/quiz/Participate/Join.dart';
import 'package:quizigma/views/quiz/Participate/Categories.dart';
import 'package:quizigma/views/quiz/Participate/QuizID.dart';
import 'package:quizigma/views/quiz/creator/creator.dart';

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
        body: CustomScrollView(primary: false, slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(100),
            sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 1,
                children: <Widget>[
                  SizedBox(
                      width: 20,
                      child: FlatButton(
                        height: 10.00,
                        minWidth: 10.00,
                        child:
                            Text("Create Quiz", style: TextStyle(fontSize: 25)),
                        color: Colors.purple,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizCreator()));
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
                            questions.add(Question(
                                i, 'what to ask?', answersList, 3, 15));
                          }
                          Quiz quiz = Quiz('test_category', 'test_name',
                              questions, null, null);
                          con.addQuiz(quiz);
                        },
                      )),
                  SizedBox(
                      width: 20,
                      child: FlatButton(
                        height: 0.00,
                        minWidth: 0.00,
                        child: Text("Participate in a Quiz",
                            style: TextStyle(fontSize: 25)),
                        color: Colors.purple,
                        textColor: Colors.white,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Categories()));
                          QuizController con = QuizController();
                          Quiz quiz = await con.getQuiz("q11p73no");
                          print(
                              quiz.id + " " + quiz.questions.length.toString());
                        },
                      )),
                  SizedBox(
                      width: 20,
                      child: FlatButton(
                        height: 0.00,
                        minWidth: 0.00,
                        child: Text("Login in a Quiz",
                            style: TextStyle(fontSize: 25)),
                        color: Colors.purple,
                        textColor: Colors.white,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizID()));
                          QuizController con = QuizController();
                          Quiz quiz = await con.getQuiz("q11p73no");
                          print(
                              quiz.id + " " + quiz.questions.length.toString());
                        },
                      )),
                ]),
          )
        ]));
  }
}
