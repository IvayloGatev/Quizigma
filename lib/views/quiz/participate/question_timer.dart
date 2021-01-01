import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';
import 'categories_screen.dart';
import 'package:quizigma/views/quiz/results/results.dart';
import 'dart:async';

class QuestionTimer extends StatefulWidget {
  final int quizTime;

  QuestionTimer({this.quizTime});

  @override
  _QuestionTimerState createState() => _QuestionTimerState();
}

const TWO_PI = 3.14 * 2;

class _QuestionTimerState extends State<QuestionTimer> {
  //Question question = new Question(1321, 'name', ['1', '2'], 1, 5);

  int _counter;
  Timer _timer;

  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example timer"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.topRight,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (_counter > 0)
                ? Text("Time left")
                : Text(
                    "Time is out",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            RaisedButton(
              onPressed: () => _startTimer(),
              child: Text("Start timer"),
            ),
          ],
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    int seconds = widget.quizTime;
    final size = 75.0;
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(16),
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(seconds: (seconds)),
        builder: (context, value, child) {
          return Container(
            width: size,
            height: size,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                        startAngle: 0.0,
                        endAngle: TWO_PI,
                        stops: [value, value],
                        // 0.0 , 0.5 , 0.5 , 1.0
                        center: Alignment.center,
                        colors: [
                          Colors.purple[600],
                          Colors.grey.withAlpha(55)
                        ]).createShader(rect);
                  },
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.yellow,
                        image: DecorationImage(
                            image: Image.asset("assets/images/radial_scale.png")
                                .image)),
                  ),
                ),
                Center(
                  child: Container(
                    width: size - 15,
                    height: size - 15,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        (_counter < 10)
                            ? Text(
                                '$_counter',
                                style:
                                    TextStyle(fontSize: 28, color: Colors.red),
                              )
                            : Text(
                                '$_counter',
                                style: TextStyle(fontSize: 28),
                              )
                      ],
                    )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _startTimer(int timeInSeconds) {
    _counter = timeInSeconds;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          _timer = new Timer(const Duration(seconds: 2), () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Results()));
          });
        }
      });
    });
  }

  void initState() {
    super.initState();

    int seconds = widget.quizTime;
    print(seconds);
    _startTimer(seconds);
  }
}
