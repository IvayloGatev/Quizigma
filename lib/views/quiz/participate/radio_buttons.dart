import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';

class RadioSet extends StatefulWidget {
  Question question;

  RadioSet(this.question);

  @override
  _RadioSetState createState() => _RadioSetState();
}

class _RadioSetState extends State<RadioSet> {
  int groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(
        widget.question.answers.length,
        (int i) => RadioListTile<int>(
          title: Text(widget.question.answers[i]),
          value: i,
          groupValue: groupValue,
          onChanged: _handleRadioValueChange,
        ),
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      groupValue = value;
      print(groupValue);
    });
  }
}
