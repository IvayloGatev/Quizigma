import 'package:flutter/material.dart';
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
    final quizes = Provider.of<List<Quiz>>(context)
        .where((quiz) => quiz.category == title)
        .toList();
    return quizes == null
        ? Center(child: CircularProgressIndicator())
        : quizes.length == 0
            ? Container(
                child: Column(
                  children: [
                    Text('No quizzes in this category'),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuizCreator(category: title)));
                      },
                      child: Text('Add a quiz to this category'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text('Home'),
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
