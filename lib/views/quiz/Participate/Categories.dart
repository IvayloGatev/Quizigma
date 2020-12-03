import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/Participate/Join.dart';
import 'package:quizigma/views/quiz/Participate/QuizID.dart';
import 'package:quizigma/views/quiz/layoutMain.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
          backgroundColor: Colors.purple, title: Text("Participate in a Quiz")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.input_rounded),
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QuizID()));
        },
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                //Container()
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child: Text("Literature", style: TextStyle(fontSize: 30)),
                  color: Colors.purple[200],
                  textColor: Colors.black,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LayoutMain()));
                  },
                ),
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child: Text("History", style: TextStyle(fontSize: 30)),
                  color: Colors.purple[200],
                  textColor: Colors.black,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LayoutMain()));
                  },
                ),
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child: Text("Physics", style: TextStyle(fontSize: 30)),
                  color: Colors.green[200],
                  textColor: Colors.black,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LayoutMain()));
                  },
                ),
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child: Text("Chemistry", style: TextStyle(fontSize: 30)),
                  color: Colors.green[200],
                  textColor: Colors.black,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LayoutMain()));
                  },
                ),
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child: Text("Biology", style: TextStyle(fontSize: 30)),
                  color: Colors.orange[200],
                  textColor: Colors.black,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LayoutMain()));
                  },
                ),
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child:
                      Text("General Knowledge", style: TextStyle(fontSize: 29)),
                  color: Colors.orange[200],
                  textColor: Colors.black,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LayoutMain()));
                  },
                ),
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child: Text("Politics", style: TextStyle(fontSize: 30)),
                  color: Colors.red[200],
                  textColor: Colors.black,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LayoutMain()));
                  },
                ),
                FlatButton(
                  height: 70.00,
                  minWidth: 100.00,
                  child: Text("Nature", style: TextStyle(fontSize: 30)),
                  color: Colors.red[200],
                  textColor: Colors.black,
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LayoutMain()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
