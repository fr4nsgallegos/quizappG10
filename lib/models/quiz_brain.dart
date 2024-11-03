import 'package:quizappg10/models/question_model.dart';

class QuizBrain {
  final List<QuestionModel> questionList = [
    QuestionModel(question: "¿Has almorzado hoy?", answer: false),
    QuestionModel(question: "El hombre llego a la luna", answer: true),
    QuestionModel(question: "¿Saliste ayer?", answer: false),
    QuestionModel(question: "Has desayunado", answer: true),
    QuestionModel(question: "Sientes frio", answer: true),
  ];

  int questionIndex =
      0; //me va ayudar a obtener la pregunta y respuesta de mi lista de question model

  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].answer;
  }

  String getNumberQuestion() {
    return (questionIndex + 1).toString();
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    }

    // questionIndex = questionIndex + 1;
  }
}
