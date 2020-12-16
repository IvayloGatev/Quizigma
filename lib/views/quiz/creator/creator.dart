import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/creator/question_list.dart';

class QuizCreator extends StatefulWidget {
  @override
  _QuizCreatorState createState() => _QuizCreatorState();
}

//Note to backend: You can retrieve the information from answersList of _MyFormState class.
class _QuizCreatorState extends State<QuizCreator> {
  final _formKey = GlobalKey<FormState>();
  final _controller = QuizController();

  List<QuestionTextEditor> editors = List<QuestionTextEditor>();
  TextEditingController nameEditingController = TextEditingController();
  String category;

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
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: nameEditingController,
                  decoration: InputDecoration(hintText: 'Enter quiz name'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: DropdownButton<String>(
                    items: <String>['Politics', 'Literature', 'Science']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      category = value;
                      print(category);
                    },
                  )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: QuestionList(editors: editors),
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    String name = nameEditingController.text;
                    List<Question> questions = List<Question>();

                    for (var editor in editors) {
                      String questionText = editor.questionTextController.text;
                      List<String> answers = List<String>();
                      for (var answerTextController
                          in editor.answerTextControllers) {
                        answers.add(answerTextController.text);
                      }
                      questions.add(Question(questions.length + 1, questionText,
                          answers, editor.correctAnswer, 15));
                    }

                    Quiz quiz = Quiz(category, name, questions);
                    _controller.addQuiz(quiz);
                  }
                },
                child: Text('Submit'),
                color: Colors.purple,
              ),
            ])));
  }
}
