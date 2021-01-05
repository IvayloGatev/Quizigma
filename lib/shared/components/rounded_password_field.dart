import 'package:flutter/material.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/shared/components/text_field_container.dart';
import 'package:quizigma/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: GoogleFonts.cabin(
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(0.7),
            fontSize: 18),
        obscureText: true,
        onChanged: onChanged,
        validator: validator,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).translate('password_hint'),
          hintStyle: GoogleFonts.cabin(
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.7),
              fontSize: 18),
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: kPrimaryColor,
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
