import 'package:flutter/material.dart';
import 'package:quizigma/views/home/home.dart';
import 'package:share/share.dart';
import 'package:quizigma/models/quiz.dart';

class CreatorAlert extends StatelessWidget {
  final Quiz quiz;
  CreatorAlert({this.quiz});

  String subject = 'Quiz ID';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          shadowColor: Colors.black,
          title: const Text('Create a quiz'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              SizedBox(width: 15),
              Container(
                  child: RaisedButton(
                child: Text('Share your code with friends!'),
                onPressed: () {
                  final RenderBox box = context.findRenderObject();
                  Share.share(quiz.id,
                      subject: subject,
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
              ))
            ])));

    // return AlertDialog(
    //   title: Text("Quiz Created"),
    //   content: Text(
    //     quiz.id,
    //     style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
    //   ),
    //   actions: [
    //     FlatButton(
    //       child: Text('Ok'),
    //       onPressed: () {
    //         Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => Home()));
    //       },
    //     ),
    //   ],
    // );
  }
}
