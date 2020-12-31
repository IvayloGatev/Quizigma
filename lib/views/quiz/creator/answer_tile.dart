import 'package:flutter/material.dart';

class AnswerTile extends StatefulWidget {
  final TextEditingController answerEditingController;

  AnswerTile({Key key, this.answerEditingController}) : super(key: key);

  @override
  _AnswerTileState createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile> {
  TextEditingController _answerEditingController;

  @override
  void initState() {
    super.initState();

    _answerEditingController = widget.answerEditingController;
  }

  @override
  Widget build(BuildContext context) {
    return
        //Padding(
        // padding: const EdgeInsets.only(right: 1.0),
        // child:
        TextFormField(
      controller: _answerEditingController,
      decoration: InputDecoration(
        hintText: 'Enter an answer and select correct one',
        hintStyle: TextStyle(fontSize: 15),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
      ),
      cursorColor: Colors.purple,
      validator: (v) {
        if (v.trim().isEmpty) return 'Please enter an answer';
        return null;
      },
    );
    // );
  }
}
