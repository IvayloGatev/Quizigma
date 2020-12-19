import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/participate/join_quiz.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      color: color,
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => JoinQuiz()));
      },
    );
  }
}
