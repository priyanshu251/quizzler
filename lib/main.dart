import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizbrain = Quizbrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int points = 0;

  void checkanswer(bool pickedanswer) {
    setState(() {
      if (pickedanswer == quizbrain.getAns()) {
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        points = quizbrain.getScore();
      } else {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    });
    if (quizbrain.isFinished()) {
      Alert(
              context: context,
              title: "RFLUTTER",
              desc: "End Of Quiz\nYour score is: $points out of 6")
          .show();
      scoreKeeper.clear();
      scoreKeeper.add(
        const Text(
          ' ',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      );
      quizbrain.reset();
    } else {
      quizbrain.nextQues();
    }
  }

  late List<Widget> scoreKeeper = [
    const Text(
      ' ',
      style: TextStyle(
        fontSize: 25,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQues(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              onPressed: () {
                checkanswer(true); //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkanswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.lightBlueAccent,
              child: const Text(
                'clear',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  quizbrain.prev();
                  scoreKeeper.removeLast();
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
