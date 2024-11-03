import 'package:flutter/material.dart';
import 'package:quizappg10/models/quiz_brain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String question = '¿El hombre llegó a la luna?';
  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Quizz App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            // Spacer(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: () {},
                  child: Text("Verdadero"),
                  minWidth: double.infinity,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.redAccent,
                  onPressed: () {},
                  child: Text("False"),
                  minWidth: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
