import 'package:flutter/material.dart';
//import 'package:quizigma/views/quiz/Participate/Join.dart';
import 'package:quizigma/views/quiz/Participate/Categories.dart';

class Participate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Participate in a Quiz"),
          /*automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, true),
            )*/
        ),
        body: Center(
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const SizedBox(height: 30),
              RaisedButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Categories()));
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
                  )),
              /*child: Padding(
                 padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                decoration: const InputDecoration(labelText: 'CODE'),
                style: TextStyle(fontSize: 15)),
                )*/
            ])));
    //);
  }
}
