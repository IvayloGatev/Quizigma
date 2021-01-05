import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/participate/join_quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(title,
            style: GoogleFonts.cabin(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
      ),
      color: color,
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: () async {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => JoinQuiz(title: title)));
      },
    );
  }
}
