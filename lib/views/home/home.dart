import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/views/quiz/creator/creator.dart';
import 'package:quizigma/views/quiz/participate/categories_screen.dart';
import 'package:quizigma/views/quiz/participate/join_quiz_by_id.dart';

class Home extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
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
              ]),
        ));
  }
}
