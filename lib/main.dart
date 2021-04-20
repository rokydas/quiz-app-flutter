import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Center(
            child: Text('Quiz App'),
          ),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Colors.black, Colors.black54],
            )),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int clickedButton = 10;
  int questionIndex = 0;
  int optionIndex = 0;
  int marks = 0;
  bool isFinished = false;
  bool isSubmit = false;
  bool isRight = true;
  bool isOneFinish = false;

  List<String> questions = [
    'What is our main food?',
    'What is our national fruit?',
    'Who is our HERO?',
  ];

  List<String> options = [
    'Burger',
    'Pasta',
    'Rice',
    'Pepsi',
    'Mango',
    'Jack Fruit',
    'Pineapple',
    'Watermelon',
    'Hablu',
    'Bablu',
    'Kablu',
    'Fablu',
  ];

  List<int> answers = [2, 1, 0];
  List<int> userAnswers = [10, 10, 10];

  void checkQuiz = () => {};

  Widget optionButton(int n) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          clickedButton = n;
          userAnswers[questionIndex] = n;
          isSubmit = true;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            clickedButton == n ? Colors.blue : Colors.deepOrangeAccent),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          options[optionIndex + n],
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !isFinished
          ? Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(''),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'MCQ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      questions[questionIndex],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          optionButton(0),
                          optionButton(1),
                          optionButton(2),
                          optionButton(3),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: !isSubmit
                                ? () {
                                    Fluttertoast.showToast(
                                        msg: "Please select your answer",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                : () {
                                    setState(() {
                                      isOneFinish = true;
                                      clickedButton = 10;
                                      isSubmit = false;

                                    });
                                    if (answers[questionIndex] ==
                                        userAnswers[questionIndex]) {
                                      setState(() {
                                        marks += 10;
                                        isRight = true;
                                      });
                                    }
                                    if (questionIndex != questions.length - 1) {
                                      setState(() {
                                        questionIndex++;
                                        optionIndex += 4;
                                        isRight = false;
                                      });
                                    } else {
                                      setState(() {
                                        isFinished = true;
                                      });
                                    }
                                  },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.teal),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: isOneFinish ? Image.asset(
                    isRight ? 'images/correct.png' : 'images/wrong.png',
                    width: 200,
                  ) : Text('')
                ),
                Expanded(
                  flex: 1,
                  child: Text(''),
                ),
              ],
            )
          : Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 3, child: Text('')),
                  Expanded(
                    child: Text(
                      'Test is finished. \n Your score is ${marks}/${questions.length * 10}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isFinished = false;
                              questionIndex = 0;
                              optionIndex = 0;
                              marks = 0;
                              userAnswers = [10, 10, 10];
                              clickedButton = 10;
                              isOneFinish = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.teal),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Start Again',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 3, child: Text('')),
                ],
              ),
            ),
    );
  }
}
