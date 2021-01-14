import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/question_text_editor.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/creator/creator_alert.dart';
import 'package:quizigma/views/quiz/creator/question_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizigma/views/quiz/creator/round_button.dart';

class QuizCreator extends StatefulWidget {
  final String category;
  QuizCreator({this.category});
  _QuizCreatorState createState() => _QuizCreatorState();
}

//Note to backend: You can retrieve the information from answersList of _MyFormState class.
class _QuizCreatorState extends State<QuizCreator> {
  final _controller = QuizController();
  final _formKey = GlobalKey<FormState>();

  List<String> categories = [
    'Other',
    'Literature',
    'History',
    'Physics',
    'Chemistry',
    'Biology',
    'General Knowledge',
    'Politics',
    'Nature',
    'Computer',
  ];
  String category = 'Other';
  int dropdownValue = 30;
  int _counter = 30;
  List<QuestionTextEditor> editors = List<QuestionTextEditor>();
  TextEditingController nameEditingController = TextEditingController();
  List<int> top = [];

// A method, which increments the timer value.
  void _increaseCounter() {
    setState(() {
      if (_counter < 60) {
        _counter++;
      }
    });
  }

// A method, which decrements the timer value.
  void _decreaseCounter() {
    setState(() {
      if (_counter > 15) {
        _counter--;
      }
    });
  }

// A method, which shows an alert after a quiz is successfully created.
  void _showCreatorAlert(Quiz quiz) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CreatorAlert(
            quiz: quiz,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Create a quiz',
              style: GoogleFonts.cabin(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, true),
          ),
        ),
        body: ListView(physics: ScrollPhysics(), children: <Widget>[
          Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple)),
                  child: Column(
                    children: <Widget>[
                      // Quiz name text field.
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextFormField(
                          style: GoogleFonts.cabin(
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.7)),
                          controller: nameEditingController,
                          decoration: InputDecoration(
                              hintText: 'Enter quiz name',
                              hintStyle: GoogleFonts.cabin(
                                  fontWeight: FontWeight.w700),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple))),
                          cursorColor: Colors.deepPurple,
                          validator: (v) {
                            if (v.trim().isEmpty)
                              return 'Please enter something';
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Category dropdown menu.
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: DropdownButtonFormField<String>(
                          value: widget.category,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 16,
                          elevation: 16,
                          decoration: InputDecoration(
                            labelText: 'Select category',
                            labelStyle: GoogleFonts.cabin(
                                fontWeight: FontWeight.w700, fontSize: 22),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              category = value;
                            });
                          },
                          items: categories.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.cabin(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Timer selector.
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                            child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Select time per question',
                                  style: GoogleFonts.cabin(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 17),
                                ),
                                Spacer(),
                                RoundButton(
                                    onTap: () {
                                      setState(() {
                                        if (_counter < 61) {
                                          _increaseCounter();
                                        }
                                      });
                                    },
                                    color: Colors.green,
                                    icon: Icons.add),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                    onTap: () {
                                      setState(() {
                                        if (_counter > 14) {
                                          _decreaseCounter();
                                        }
                                      });
                                    },
                                    color: Colors.red,
                                    icon: Icons.remove),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '$_counter',
                                  style: GoogleFonts.cabin(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.7)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
                QuestionList(editors: editors),
                SizedBox(height: 15),
                // A button, which validates the quiz and adds it to the database.
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: () {
                      // Validate the form and add the quiz to the database.
                      if (_formKey.currentState.validate()) {
                        String name = nameEditingController.text;
                        List<Question> questions = List<Question>();
                        int timePerQuestion = _counter;
                        for (var editor in editors) {
                          String questionText =
                              editor.questionTextController.text;
                          List<String> answers = List<String>();
                          for (var answerTextController
                              in editor.answerTextControllers) {
                            answers.add(answerTextController.text);
                          }
                          questions.add(Question(questions.length + 1,
                              questionText, answers, editor.correctAnswer));
                        }

                        Quiz quiz = Quiz(
                            category,
                            name,
                            questions,
                            timePerQuestion * questions.length,
                            questions.length);
                        _controller.addQuiz(quiz);
                        _showCreatorAlert(quiz);
                      }
                    },
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Create Quiz',
                      style: GoogleFonts.cabin(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    color: Colors.deepPurple,
                  ),
                )
              ])),
        ]));
  }
}
