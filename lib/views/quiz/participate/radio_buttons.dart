import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';

class RadioSet extends StatefulWidget {
  final Question question;
  //final Function(int selection, int answer) buttonSelected;
  final Function(int selection, List<int> selections) buttonSelected;
  final int numberOfQuestions;
  RadioSet({this.question, this.buttonSelected, this.numberOfQuestions});

  @override
  _RadioSetState createState() => _RadioSetState();
}

class _RadioSetState extends State<RadioSet> {
  int groupValue = -1;
  int selection;

  //int correctAnswer;

  @override
  Widget build(BuildContext context) {
    List<int> selections = new List(widget.numberOfQuestions);

    // trying to get an identifier for each card to update the array of selected answers at proper spot
    int j = widget.question.id;

    return Column(
      children: List<Widget>.generate(
          widget.question.answers.length,
          (int i) => Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile<int>(
                  title: Text(widget.question.answers[i]),
                  value: i,
                  groupValue: groupValue,
                  onChanged: (val) {
                    _handleRadioValueChange(val);

                    selection = groupValue;
                    // unclear how to add correct radio selection to whch part of the array
                    // only works if quiz has 1 question
                    switch (j) {
                      case 1:
                        selections[0] = groupValue;
                        break;
                      case 2:
                        selections[0] = groupValue;
                        selections[1] = groupValue;
                        break;
                      default:
                        selections[0] = 10;
                    }
                    // sending the data to the questions list screen
                    widget.buttonSelected(selection, selections);
                  },
                  activeColor: Colors.green,
                ),
              )),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      groupValue = value;
    });
  }
}
