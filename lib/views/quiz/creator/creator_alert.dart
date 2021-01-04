import 'package:flutter/material.dart';
import 'package:quizigma/views/home/home.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';
import 'package:quizigma/views/quiz/participate/quiz_id.dart';
import 'package:quizigma/views/quiz/participate/take_quiz.dart';
import 'package:share/share.dart';
import 'package:quizigma/models/quiz.dart';

class CreatorAlert extends StatelessWidget {
  final Quiz quiz;
  CreatorAlert({this.quiz});

  @override
  Widget build(BuildContext context) {
    String subject = 'Your Quiz ID';
    String quizId = quiz.id;
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
                  
              SizedBox(
                height:350,
                child:Flexible(
                child: Text(
                subject + ' :' + quizId,
                textAlign: TextAlign.center ,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:35),
                )
                )
              ),
               Image.asset('assets\images\Quiz-id.jpg'),            
              Container(
                width:200,

                child: RaisedButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
                  child: Text('Share your code',
                  style: TextStyle(fontSize: 20),                  
),
                  textColor: Colors.white,
                  color: Colors.deepPurple,
                  onPressed: () {
                    final RenderBox box = context.findRenderObject();
                    Share.share(quizId,
                        subject: subject,
                        sharePositionOrigin:
                            box.localToGlobal(Offset.zero) & box.size);
                  },
                ),
              ),
                                                
             
              Container(
              width:200,
              child:RaisedButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
                  child: Text('Return home',
                  style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  color: Colors.deepPurple,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  })),
              Container(
                width:200,
                child:RaisedButton(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
                  child: Text('Take quiz',
                  style: TextStyle(fontSize: 20),
                  ),
                  //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),                  
                  textColor: Colors.white,
                  color: Colors.deepPurple,
                  onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              JoinQuestions(quizId: quiz.id, quiz: quiz)));
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