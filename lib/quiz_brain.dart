import 'package:flutter/material.dart';
import 'package:quizsuperhero/models/question_model.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<QuestionModel> _questionBank = [
    QuestionModel(
      image: 'assets/images/captain_america.jpg',
      options: [
        {'text': 'El Americano', 'color': Colors.red},
        {'text': 'Capitán Americano', 'color': Colors.green},
        {'text': 'Capitán America', 'color': Colors.blue},
        {'text': 'Sr Capitán', 'color': Colors.orange},
      ],
      answer: 'Capitán America',
    ),
    QuestionModel(
      image: 'assets/images/iron_man.jpg',
      options: [
        {'text': 'Hombre de Hierro', 'color': Colors.red},
        {'text': 'Iron Man', 'color': Colors.green},
        {'text': 'Máquina de Guerra', 'color': Colors.grey},
        {'text': 'Acero', 'color': Colors.blue},
      ],
      answer: 'Iron Man',
    ),
    QuestionModel(
      image: 'assets/images/hulk.jpg',
      options: [
        {'text': 'Hulk', 'color': Colors.green},
        {'text': 'El superhéroe verde', 'color': Colors.blue},
        {'text': 'El hombre perejil', 'color': Colors.orange},
        {'text': 'El hombre de sangre verde', 'color': Colors.red},
      ],
      answer: 'Hulk',
    ),
    QuestionModel(
      image: 'assets/images/spiderman.jpg',
      options: [
        {'text': 'La araña humana', 'color': Colors.green},
        {'text': 'Spiderman', 'color': Colors.grey},
        {'text': 'El hombre telaraña', 'color': Colors.blue},
        {'text': 'El hombre de las arañas', 'color': Colors.orange},
      ],
      answer: 'Spiderman',
    ),
    QuestionModel(
      image: 'assets/images/thor.jpg',
      options: [
        {'text': 'Tor', 'color': Colors.orange},
        {'text': 'El fortachón', 'color': Colors.green},
        {'text': 'Thor', 'color': Colors.blue},
        {'text': 'El hombre martillo', 'color': Colors.red},
      ],
      answer: 'Thor',
    ),
    QuestionModel(
      image: 'assets/images/superman.jpg',
      options: [
        {'text': 'El hombre capa', 'color': Colors.grey},
        {'text': 'El hombre fortachón', 'color': Colors.green},
        {'text': 'Blueman', 'color': Colors.blue},
        {'text': 'Superman', 'color': Colors.orange},
      ],
      answer: 'Superman',
    ),
    QuestionModel(
      image: 'assets/images/la_mole.jpg',
      options: [
        {'text': 'La Mole', 'color': Colors.orange},
        {'text': 'El hombre piel de durazno', 'color': Colors.green},
        {'text': 'Mexican mole', 'color': Colors.grey},
        {'text': 'Rockman', 'color': Colors.blue},
      ],
      answer: 'La Mole',
    ),
  ];

  String getQuestionImage() {
    return _questionBank[_questionNumber].image;
  }

  List<Map<String, dynamic>> getQuestionOptions() {
    return _questionBank[_questionNumber].options;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
