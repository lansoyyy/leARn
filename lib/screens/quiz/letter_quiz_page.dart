import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/home_screen.dart';
import 'package:solar_mobile/widgets/toast_widget.dart';

class LetterQuizPage extends StatefulWidget {
  const LetterQuizPage({super.key});

  @override
  _LetterQuizPageState createState() => _LetterQuizPageState();
}

class _LetterQuizPageState extends State<LetterQuizPage> {
  int _currentQuestionIndex = 0;
  final List<String> _questions = [
    for (int i = 0; i < 4; i++) 'What letter is this?',
  ];
  final List<List<String>> _options = [
    for (int i = 0; i < 4; i++) ['A', 'B', 'C', 'D'],
  ];
  final List<int> _answers = [
    for (int i = 0; i < 4; i++) i,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quiz'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/letters/${_currentQuestionIndex + 1}.jpg',
            ),
            _buildQuizBody(),
          ],
        ),
      ),
    );
  }

  int score = 0;

  List<String?> _selectedOptions = List.filled(20, null);

  late Timer _timer;
  final int _secondsRemaining = 20;

  Widget _buildQuizBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildQuestion(),
        const SizedBox(height: 10),
        _buildOptions(),
        const SizedBox(height: 10),

        // _buildNextButton(),
      ],
    );
  }

  Widget _buildQuestion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        _questions[_currentQuestionIndex],
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget _buildOptions() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _options[_currentQuestionIndex].map((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  if (_currentQuestionIndex == 9) {
                    _showScoreDialog();
                  } else {
                    _checkAnswer(option);
                  }
                },
                child: Text(option)),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _checkAnswer(String selectedOption) async {
    int correctAnswerIndex = _answers[_currentQuestionIndex];
    String correctAnswer = _options[_currentQuestionIndex][correctAnswerIndex];

    if (selectedOption == correctAnswer) {
      setState(() {
        score++;
      });

      // Answer is correct
      // You can add your logic here, e.g., increase score, show correct answer
    } else {
      showToast('Wrong answer!');

      // Answer is incorrect
      // You can add your logic here, e.g., show correct answer
    }
    _nextQuestion();

    // Move to the next question
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      if (_currentQuestionIndex >= _questions.length) {
        // All questions have been answered
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      int correctAnswerIndex = _answers[i];
      String correctAnswer = _options[i][correctAnswerIndex];
      if (_selectedOptions[i] == correctAnswer) {
        correctAnswers++;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Finished'),
          content: Text(
              'You answered $score out of ${_questions.length} questions correctly.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                // Reset quiz
                setState(() {
                  _currentQuestionIndex = 0;
                  _selectedOptions = List.filled(_questions.length, null);
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  showtimesupDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.white,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Times Up!'),
            content: const Text('Your time has ended!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Reset quiz
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
