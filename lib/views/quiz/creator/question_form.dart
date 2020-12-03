import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';

typedef OnDelete();

class QuestionForm extends StatefulWidget {
  final Question question;
  final state = _QuestionFormState();
  final OnDelete onDelete;

  QuestionForm({Key key, this.question, this.onDelete}) : super(key: key);
  @override
  _QuestionFormState createState() => state;

  bool isValid() => state.validate();
}

class _QuestionFormState extends State<QuestionForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 32.0),
        child: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            TextFormField(
              initialValue: "",
              onSaved: (val) => widget.question.text = val,
              decoration: InputDecoration(hintText: 'Enter question'),
              validator: (val) => val.isEmpty ? null : 'Please enter something',
            ),
          ]),
        ));
  }

  bool validate() {
    var valid = _formKey.currentState.validate();
    if (valid) _formKey.currentState.save();
    return valid;
  }
}
