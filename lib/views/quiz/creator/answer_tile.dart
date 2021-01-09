import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return TextFormField(
      controller: _answerEditingController,
      style: GoogleFonts.cabin(
        fontWeight: FontWeight.w700,
        color: Colors.black.withOpacity(0.7),
      ),
      decoration: InputDecoration(
        hintText: 'Enter an answer and select correct one',
        hintStyle: GoogleFonts.cabin(
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(0.7),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple)),
      ),
      cursorColor: Colors.deepPurple,
      // Check if an answer has been written.
      validator: (v) {
        if (v.trim().isEmpty) return 'Please enter an answer';
        return null;
      },
    );
  }
}
