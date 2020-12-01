import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/Participate/Join.dart';
import 'package:quizigma/views/quiz/Participate/Categories.dart';

class QuizID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.purple,
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static List<String> answersList = [null];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Enter the code
                    Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter your code here!',
                            hintStyle: TextStyle(fontSize: 20)),
                        validator: (v) {
                          if (v.trim().isEmpty) {
                            return ('Please enter your code!');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Join()));
                            return ('Success!');
                          }
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 32.0),
                        child: RaisedButton(
                            onPressed: () async {
                              //Navigator.push(context,MaterialPageRoute(builder: (context) => Join()));
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                            },
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF42057F),
                                    Color(0xFFFF00FF),
                                    Color(0xFFEF00FF),
                                    Color(0xFF42057F),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: const Text('   Join!   ',
                                  style: TextStyle(fontSize: 20)),
                            ))),
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
