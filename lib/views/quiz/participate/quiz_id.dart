import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';
import 'package:quizigma/views/quiz/participate/join_quiz.dart';

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
                          if (v.trim().isEmpty) {
                            return ('Please enter your code!');
                          }
                          if (v.length < 8) {
                            return 'Quiz ID must be at least 8 characters';
                          }

                          setState(() {
                            getDoc(v);
                          });

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
                        child: RaisedButton(
                            onPressed: () async {
                              print('status in pressmethod $iDExists');
                              print(quizId);

                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              _formKey.currentState.save();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          JoinQuestions(quizId: quizId)));
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
                            ))),
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

  // Widget showAlert() {
  //   if (iDExists != false) {
  //     return Container(
  //       color: Colors.amberAccent,
  //       width: double.infinity,
  //       padding: EdgeInsets.all(8.0),
  //       child: Row(
  //         children: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.only(right: 8.0),
  //             child: Icon(Icons.error_outline),
  //           ),
  //           Expanded(
  //             child: Text(
  //               'incorrect ID',
  //               style: TextStyle(
  //                 fontSize: 14.0,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 8.0),
  //             child: IconButton(
  //               icon: Icon(Icons.close),
  //               onPressed: () {
  //                 setState(() {
  //                   iDExists = false;
  //                   print('status $iDExists');
  //                 });
  //               },
  //             ),
  //           )
  //         ],
  //       ),
  //     );
  //   } else {
  //     return SizedBox(
  //       height: 0,
  //     );
  //   }
  // }

  void getDoc(String id) async {
    var a = await FirebaseFirestore.instance.collection('Quizes').doc(id).get();
    if (a.exists) {
      print('hei' + a.data()['id'].toString());
      setState(() {
        iDExists = true;
        print('status $iDExists');
      });
    }
    if (!a.exists) {
      print('nothing here');
      setState(() {
        iDExists = false;
        print('status $iDExists');
      });
    }
  }
}
