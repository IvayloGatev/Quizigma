import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/creator/question_list.dart';

class QuizCreator extends StatefulWidget {
  @override
  _QuizCreatorState createState() => _QuizCreatorState();
}

//Note to backend: You can retrieve the information from answersList of _MyFormState class.
class _QuizCreatorState extends State<QuizCreator> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Create a quiz'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, true),
          ),
        ),
        body: Form(
            key: _formKey,
            child: Column(children: [
              Expanded(
                child: QuestionList(),
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                child: Text('Submit'),
                color: Colors.purple,
              ),
            ])));
  }
}
