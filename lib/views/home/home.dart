import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';

class Home extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('home_title') +
                'Quizigma'),
            backgroundColor: Colors.brown[400],
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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  height: 70.00,
                  minWidth: 70.00,
                  child: Text("Create Quiz", style: TextStyle(fontSize: 15)),
                  color: Colors.brown[400],
                  textColor: Colors.white,
                  onPressed: () {
                    //only for testing
                    //in the near future this will redirect you to a page that
                    //asks the user for the quiz name and category and add questions...
                    FirestoreDatabase()
                        .addQuiz('test_quizCategory', 'test_quizName');
                  },
                ),
                SizedBox(width: 15),
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child: Text("Participate in Quiz",
                      style: TextStyle(fontSize: 15)),
                  color: Colors.brown[400],
                  textColor: Colors.white,
                  onPressed: () {
                    //Quiz quiz1 = Quiz();
                    //quiz1.category = "hydgy";
                    //print(quiz1.category + quiz1.id);
                    FirestoreDatabase().getQuizData('test_quizCategory');
                  },
                ),
              ]),
        ));
  }
}
