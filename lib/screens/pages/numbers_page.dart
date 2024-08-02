import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/ar_view.dart';
import 'package:solar_mobile/screens/quiz/numbers_quiz_page.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class NumbersPage extends StatelessWidget {
  String name;

  NumbersPage({
    super.key,
    required this.name,
  });

  List numbers = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: TextWidget(
          text: 'Numbers',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NumbersQuizPage(
                        name: name,
                      )));
            },
            icon: const Icon(
              Icons.quiz,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ARView(
                          name: numbers[index],
                          file: 'assets/models/Number/Number_${index + 1}.gltf',
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
                  'assets/images/numbers/${index + 1}.jpg',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
