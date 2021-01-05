import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioSet extends StatefulWidget {
  final Question question;
  final Function(List<int> selections, List<String> selectedStrings)
      buttonSelected;
  final List<int> selectedAnswers;
  final List<String> selectedAnswersString;

  RadioSet(
      {this.question,
      this.buttonSelected,
      this.selectedAnswers,
      this.selectedAnswersString});

  @override
  _RadioSetState createState() => _RadioSetState();
}

class _RadioSetState extends State<RadioSet> {
  int groupValue = -1;
  int selection;
  bool selected = false;

  //int correctAnswer;

  @override
  Widget build(BuildContext context) {
    // trying to get an identifier for each card to update the array of selected answers at proper spot
    int j = widget.question.id;

    return Column(
      children: List<Widget>.generate(
          widget.question.answers.length,
          (int i) => Card(
                // margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: RadioListTile<int>(
                  title: Text(widget.question.answers[i],
                      style: (groupValue == i)
                          ? GoogleFonts.cabin(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )
                          : GoogleFonts.cabin(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                  value: i,
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: groupValue,
                  onChanged: (val) {
                    _handleRadioValueChange(val);
                    selection = groupValue;

                    widget.selectedAnswers[j - 1] = selection;

                    widget.selectedAnswersString[j - 1] =
                        widget.question.answers[selection];

                    widget.buttonSelected(
                        widget.selectedAnswers, widget.selectedAnswersString);
                  },
                  activeColor: Colors.deepPurple,
                  // selected: true,
                ),
              )),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      groupValue = value;
      selected = true;
    });
  }
}
