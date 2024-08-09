import 'package:flutter/material.dart';
import 'package:quizsuperhero/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int score = 0;
  int incorrectAnswers = 0;

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        score++;
      } else {
        incorrectAnswers++;
      }

      if (quizBrain.isFinished()) {
        _showFinishDialog();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  void _showFinishDialog() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Fin del Quiz",
      desc:
          "Respuestas correctas: $score\nRespuestas incorrectas: $incorrectAnswers",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              quizBrain.reset();
              score = 0;
              incorrectAnswers = 0;
            });
          },
          width: 120,
          child: const Text(
            "Reiniciar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Superhero Quiz',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "¿Cómo se llama el Superhéroe?",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                quizBrain.getQuestionImage(),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              flex: 5,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: quizBrain.getQuestionOptions().map((option) {
                  return ElevatedButton(
                    onPressed: () => checkAnswer(option['text']),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: option['color'],
                      textStyle: const TextStyle(fontSize: 18.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      option['text'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (score > 0)
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check, color: Colors.green),
                        Text(
                          ' Correctas: $score',
                          style: const TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                if (incorrectAnswers > 0)
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.close, color: Colors.red),
                        Text(
                          ' Incorrectas: $incorrectAnswers',
                          style: const TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
