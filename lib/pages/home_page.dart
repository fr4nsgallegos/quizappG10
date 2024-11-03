import 'package:flutter/material.dart';
import 'package:quizappg10/models/quiz_brain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();
  List<Widget> score = [];

  Widget itemScoreWidget(String numberQuestion, bool isCorrect) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          numberQuestion,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.red,
        ),
      ],
    );
  }

  void checkAnswer(bool userAnswer, String numberQuestion) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (correctAnswer == userAnswer) {
      print("La respuesta es correcta");
      score.add(itemScoreWidget(numberQuestion, true));
    } else {
      print("incorrecto!!!!!!");
      score.add(itemScoreWidget(numberQuestion, false));
    }

    if (quizBrain.isFinished()) {
      // showDialog(
      //   // barrierDismissible: false,
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       scrollable: true,
      //       title: Text("Alerta"),
      //       content: Column(
      //         children: [
      //           Text("Has llegado al final del formulario"),
      //           Container(
      //             height: 250,
      //             width: 20,
      //             color: Colors.orange,
      //           ),
      //           Text("Has llegado al final del formulario"),
      //           Container(
      //             height: 250,
      //             width: 20,
      //             color: Colors.orange,
      //           ),
      //           Text("Has llegado al final del formulario"),
      //           Container(
      //             height: 250,
      //             width: 20,
      //             color: Colors.orange,
      //           ),
      //         ],
      //       ),
      //       backgroundColor: Colors.blueAccent,
      //       elevation: 10.0,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(25),
      //       ),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //             quizBrain.nextQuestion();
      //             score.clear();
      //             setState(() {});
      //           },
      //           child: Text("OK"),
      //         ),
      //       ],
      //     );
      //   },
      // );
    } else {
      quizBrain.nextQuestion();
    }

    // if (quizBrain.questionIndex == 0) {
    //   score.clear();
    // }

    // score.length == quizBrain.questionList.length
    //     ? score.clear()
    //     : quizBrain.nextQuestion();

    setState(() {});
  }

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
                  onPressed: () {
                    quizBrain.isFinished() == true
                        ? null
                        : checkAnswer(true, quizBrain.getNumberQuestion());
                  },
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
                  onPressed: () {
                    quizBrain.isFinished() == true
                        ? null
                        : checkAnswer(false, quizBrain.getNumberQuestion());
                  },
                  child: Text("False"),
                  minWidth: double.infinity,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            )
          ],
        ),
      ),
    );
  }
}
