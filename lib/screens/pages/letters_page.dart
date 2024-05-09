import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/ar_view.dart';
import 'package:solar_mobile/screens/quiz/letter_quiz_page.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class LettersPage extends StatelessWidget {
  const LettersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: TextWidget(
          text: 'Letters',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LetterQuizPage()));
            },
            icon: const Icon(
              Icons.quiz,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: 4,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ARView(
                          file: 'assets/images/letters/${index + 1}.glb',
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Image.asset(
                  'assets/images/letters/${index + 1}.jpg',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
