import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/home_screen.dart';
import 'package:solar_mobile/services/add_points.dart';
import 'package:solar_mobile/widgets/text_widget.dart';
import 'package:solar_mobile/widgets/toast_widget.dart';

class LetterQuizPage extends StatefulWidget {
  String name;

  LetterQuizPage({
    super.key,
    required this.name,
  });

  @override
  _LetterQuizPageState createState() => _LetterQuizPageState();
}

class _LetterQuizPageState extends State<LetterQuizPage> {
  int _currentQuestionIndex = 0;
  final List<String> _questions = [
    for (int i = 0; i < 4; i++) 'What is the first letter of the word?',
  ];
  final List<List<String>> _options = [
    for (int i = 0; i < 4; i++) ['A', 'B', 'C', 'D'],
  ];
  final List<int> _answers = [
    for (int i = 0; i < 4; i++) i,
  ];

  String answer = '';
  Color buttonColor = Colors.white;

  List answers = [];

  List corrects = [];

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
              'assets/images/letters/new/${_currentQuestionIndex + 1}.jpg',
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
        const SizedBox(height: 30),

        TextWidget(
          text: answer,
          fontSize: 18,
          color: Colors.red,
        ),

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

  int _selectedIndex = -1;
  Widget _buildOptions() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _options[_currentQuestionIndex].asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: _selectedIndex == index ? buttonColor : Colors.white,
              onPressed: () {
                // print the index of the clicked button

                setState(() {
                  _selectedIndex = index; // Update the selected index
                });

                if (_currentQuestionIndex == 9) {
                  _showScoreDialog();
                } else {
                  _checkAnswer(option);
                }
              },
              child: Text(
                option,
              ),
            ),
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
        buttonColor = Colors.green;
        score++;
      });

      // Answer is correct
      // You can add your logic here, e.g., increase score, show correct answer
    } else {
      setState(() {
        buttonColor = Colors.red;

        answer = 'The correct answer is $correctAnswer';
      });
      showToast('Wrong answer!');

      // Answer is incorrect
      // You can add your logic here, e.g., show correct answer
    }

    setState(() {
      corrects.add(correctAnswer);

      answers.add({
        'number': _currentQuestionIndex,
        'answer': selectedOption,
        'isCorrect': selectedOption == correctAnswer
      });
    });
    await Future.delayed(const Duration(seconds: 2));
    _nextQuestion();

    // Move to the next question
  }

  void _nextQuestion() {
    setState(() {
      buttonColor = Colors.white;
      answer = '';
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
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'You answered $score out of ${_questions.length} questions correctly.'),
                const Divider(),
                for (int i = 0; i < answers.length; i++)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: '#${answers[i]['number'] + 1}',
                          fontSize: 14,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        TextWidget(
                          text: '${answers[i]['answer']}',
                          fontSize: 18,
                          color: answers[i]['isCorrect']
                              ? Colors.green
                              : Colors.red,
                          fontFamily: 'Bold',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        TextWidget(
                          text: answers[i]['isCorrect'] ? 'Correct' : 'Wrong',
                          fontSize: 18,
                          fontFamily: 'Bold',
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        answers[i]['isCorrect']
                            ? const SizedBox()
                            : TextWidget(
                                text: 'Answer: ${corrects[i]}',
                                fontSize: 18,
                                color: Colors.green,
                                fontFamily: 'Bold',
                              ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                addScore(widget.name, score, 'Letter');
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
