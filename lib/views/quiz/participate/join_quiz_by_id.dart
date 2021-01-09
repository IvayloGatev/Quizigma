import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Join a Quiz",
              style: GoogleFonts.cabin(
                  color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        body: MyForm());
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _quizController = QuizController();

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static List<String> answersList = [null];
  bool iDExists = false;
  Future<String> id;
  String quizId;
  Quiz quizToJoin;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  assignToBool(bool val, String id) async {
    val = await _quizController.checkIfDocExists(id);

    setState(() {
      iDExists = val;
    });
  }

  getQuiz(Quiz quiz, String id) async {
    quiz = await _quizController.getQuiz(id);
    setState(() {
      quizToJoin = quiz;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: TextFormField(
                        style: GoogleFonts.cabin(
                            fontWeight: FontWeight.w700, fontSize: 20),
                        decoration: InputDecoration(
                            hintText: 'Enter your code here!',
                            hintStyle: GoogleFonts.cabin(
                                fontWeight: FontWeight.w700, fontSize: 20),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple))),
                        cursorColor: Colors.deepPurple,
                        validator: (String v) {
                          if (v.trim().isEmpty) {
                            return ('Please enter your code!');
                          }
                          if (v.length < 8) {
                            return 'Quiz ID must be at least 8 characters';
                          }

                          if (iDExists == false) {
                            return 'Wrong ID';
                          }

                          return null;
                        },
                        onChanged: (String v) {
                          quizId = v;

                          getQuiz(quizToJoin, quizId);
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.only(right: 32.0),
                        child: Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  color: Colors.deepPurple,
                                  child: Text('Join!',
                                      style: GoogleFonts.cabin(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.white)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  onPressed: () async {
                                    Center(child: CircularProgressIndicator());
                                    _quizController.checkIfDocExists(quizId);
                                    assignToBool(iDExists, quizId);
                                    getQuiz(quizToJoin, quizId);
                                    Future.delayed(
                                        const Duration(milliseconds: 400), () {
                                      if (!_formKey.currentState.validate()) {
                                        return;
                                      }

                                      _formKey.currentState.save();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JoinQuestions(
                                                      quizId: quizId,
                                                      quiz: quizToJoin)));
                                    });
                                  },
                                )),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ))));
  }
}
