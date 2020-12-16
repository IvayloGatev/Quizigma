import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/Participate/quiz_list.dart';

class Join extends StatelessWidget {
  @override
  /*Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Welcome to your Quiz"),
      ),
      body: BrewList(),
    );
  }*/

  Widget build(BuildContext context) {
    return StreamProvider<List<Quiz>>.value(
      value: QuizController().database.quizes,
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: Text('Welcome to your Quiz'),
          backgroundColor: Colors.purple[200],
          elevation: 0.0,
          /*actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () {
                Text('logout opt must come here?');
              },
            ),
          ],
        */
        ),
        body: QuizList(),
      ),
    );
  }
}
