import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/ar_view.dart';
import 'package:solar_mobile/screens/quiz/letter_quiz_page.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class LettersPage extends StatelessWidget {
  String name;

  LettersPage({
    super.key,
    required this.name,
  });

  List<String> letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

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
                  builder: (context) => LetterQuizPage(
                        name: name,
                      )));
            },
            icon: const Icon(
              Icons.quiz,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: letters.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ARView(
                          name: letters[index],
                          file:
                              'assets/models/Letter/Letter_${letters[index]}.gltf',
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: TextWidget(
                    text: letters[index],
                    fontSize: 75,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
