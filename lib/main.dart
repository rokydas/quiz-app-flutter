import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Quiz App'))
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text('hello quiz app'),
          ),
        ),
      ),
    );
  }
}

// class QuizPage extends StatefulWidget {
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }
//
// class _QuizPageState extends State<QuizPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: Text('Hello Quiz App'),);
//   }
// }

