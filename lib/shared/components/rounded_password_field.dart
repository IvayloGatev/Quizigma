import 'package:flutter/material.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/shared/components/text_field_container.dart';
import 'package:quizigma/shared/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator; // added

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.validator, // added
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        // changed from textfield
        obscureText: true,
        onChanged: onChanged,
        validator: validator, // added
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).translate('password_hint'),
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
