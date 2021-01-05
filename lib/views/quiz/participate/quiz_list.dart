import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/category_item.dart';
import 'package:quizigma/models/quiz.dart';
import 'quiz_tile.dart';
import 'package:quizigma/views/quiz/creator/creator.dart';
import 'package:quizigma/views/home/home.dart';

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
    double height = 50;
    double width = MediaQuery.of(context).size.width;
    ;
    final quizes = Provider.of<List<Quiz>>(context)
        .where((quiz) => quiz.category == title)
        .toList();
    Future.delayed(Duration(milliseconds: 300));
    return quizes == null
        ? Center(child: CircularProgressIndicator())
        : quizes.length == 0
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      QuizCreator(category: title)));
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
