import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizigma/models/question.dart';

class QuestionTile extends StatelessWidget {
  final Question question;
  QuestionTile({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        color: Colors.deepPurple,
        child: ListTile(
          title: Text(question.id.toString() + '. ' + question.text + '?',
              style: GoogleFonts.cabin(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
