import 'package:flutter/material.dart';
import 'package:quizigma/shared/components/text_field_container.dart';
import 'package:quizigma/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator;
  final TextStyle style;
  final TextStyle hintStyle;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.style,
    this.hintStyle,
    this.icon = Icons.person,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        validator: validator,
        style: GoogleFonts.cabin(
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(0.7),
            fontSize: 18),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.cabin(
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.7),
              fontSize: 18),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
