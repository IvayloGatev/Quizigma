import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionTile extends StatefulWidget {
  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: TextFormField(
        initialValue: text,
        onChanged: (value) {
          text = value;
        },
        decoration: InputDecoration(hintText: 'Enter the question'),
        validator: (v) {
          if (v.trim().isEmpty) return 'Please enter the question';
          return null;
        },
      ),
    );
  }
}
