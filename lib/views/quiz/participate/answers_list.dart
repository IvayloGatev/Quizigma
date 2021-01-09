import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';
import 'package:google_fonts/google_fonts.dart';

/* This file loads the answers of a question into separate radio list tiles
 that the user can then select. 2 arrays are then used to store the selection.
selection will be passed each time the selection is changed. */

class AnswersAsRadioListTiles extends StatefulWidget {
  final Question question;
  final Function(List<int> selectedAnswersAsIntList,
      List<String> selectedAnswerAsStringList) buttonSelected;
  final List<int> selectedAnswersAsIntList;
  final List<String> selectedAnswersAsStringList;

  AnswersAsRadioListTiles(
      {this.question,
      this.buttonSelected,
      this.selectedAnswersAsIntList,
      this.selectedAnswersAsStringList});

  @override
  _AnswersAsRadioListTilesState createState() =>
      _AnswersAsRadioListTilesState();
}

class _AnswersAsRadioListTilesState extends State<AnswersAsRadioListTiles> {
  int groupValue = -1;
  int selection;

  @override
  Widget build(BuildContext context) {
    // Question number identifier used to find correct spot in array to add the selection
    int j = widget.question.id;

    return Column(
      children: List<Widget>.generate(
          widget.question.answers.length,
          (int i) => Card(
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

                    // Fill arrays with current selection data
                    widget.selectedAnswersAsIntList[j - 1] = selection;
                    widget.selectedAnswersAsStringList[j - 1] =
                        widget.question.answers[selection];

                    // Send the arrays with the selection data to 'question_list'
                    widget.buttonSelected(widget.selectedAnswersAsIntList,
                        widget.selectedAnswersAsStringList);
                  },
                  activeColor: Colors.deepPurple,
                ),
              )),
    );
  }

  // Method to highlight selected radio button
  void _handleRadioValueChange(int value) {
    setState(() {
      groupValue = value;
    });
  }
}
