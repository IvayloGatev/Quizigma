import 'package:flutter/material.dart';
import 'package:quizigma/shared/components/text_field_container.dart';
import 'package:quizigma/shared/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator; // added
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validator, // added
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        // changed from  TextField
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        validator: validator, // added line
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
