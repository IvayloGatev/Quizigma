import 'package:flutter/material.dart';

class AnswerTile extends StatefulWidget {
  final TextEditingController answerEditingController;

  AnswerTile({this.answerEditingController});

  @override
  _AnswerTileState createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: TextFormField(
        controller: widget.answerEditingController,
        decoration: InputDecoration(hintText: 'Enter an answer'),
        validator: (v) {
          if (v.trim().isEmpty) return 'Please enter an answer';
          return null;
        },
      ),
    );
  }
}
