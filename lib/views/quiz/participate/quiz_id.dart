import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';

class QuizID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Participate in a Quiz"),
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
                        decoration: InputDecoration(
                            hintText: 'Enter your code here!',
                            hintStyle: TextStyle(fontSize: 20)),
                        validator: (String v) {
                          print('i jump here');

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
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 32.0),
                        child: Column(
                          children: [
                            RaisedButton(
                                onPressed: () async {
                                  Center(child: CircularProgressIndicator());
                                  _quizController.checkIfDocExists(quizId);
                                  assignToBool(iDExists, quizId);
                                  Future.delayed(
                                      const Duration(milliseconds: 300), () {
                                    if (!_formKey.currentState.validate()) {
                                      return;
                                    }

                                    _formKey.currentState.save();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JoinQuestions(quizId: quizId)));
                                  });
                                },
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.deepPurple,
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text('   Join!   ',
                                      style: TextStyle(fontSize: 20)),
                                )),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    // showAlert(),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ))));
  }
}
