import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/home/home.dart';
import 'quiz_tile.dart';
import 'package:quizigma/views/quiz/creator/creator.dart';

/* This file loads all the quizzes for a given category in a ListView.
The ListView is a list of buttons called 'QuizTile'.
Should there be no quizzes for the given category, 2 options are provided:
1) User can return home
2) User can create a quiz for the category
*/
class QuizList extends StatefulWidget {
  final String title;
  const QuizList({this.title});

  @override
  _QuizListState createState() => _QuizListState(title);
}

class _QuizListState extends State<QuizList> {
  Quiz quiz;
  final String title;

  _QuizListState(this.title);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Quiz> quizes = Provider.of<List<Quiz>>(context);

    if (quizes == null) {
      return Center(child: CircularProgressIndicator());
    }
    quizes = quizes.where((quiz) => quiz.category == title).toList();
    return quizes.length == 0
        ? Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No quizzes in this category!',
                  style: GoogleFonts.cabin(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                SizedBox(height: 15),
                Container(
                  width: width,
                  margin: EdgeInsets.fromLTRB(75.0, 0.0, 75.0, 0.0),
                  child: RaisedButton(
                    color: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuizCreator(category: title)));
                    },
                    child: Text(
                      'Create a quiz for this category',
                      style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: width,
                  margin: EdgeInsets.fromLTRB(75.0, 0.0, 75.0, 0.0),
                  child: RaisedButton(
                    color: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text(
                      'Home',
                      style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: quizes.length,
            itemBuilder: (context, index) {
              return QuizTile(
                quiz: quizes[index],
              );
            });
  }
}
