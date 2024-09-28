import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/ar_view.dart';
import 'package:solar_mobile/screens/quiz/colors_quiz_page.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class ColorsPage extends StatelessWidget {
  String name;

  ColorsPage({
    super.key,
    required this.name,
  });

  List colors = [
    'Blue',
    'Brown',
    'Green',
    'Orange',
    'Pink',
    'Purple',
    'Red',
    'Yellow',
  ];

  @override
  Widget build(BuildContext context) {
    print(name);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: TextWidget(
          text: 'Colors',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ColorsQuizPage(
                        name: name,
                      )));
            },
            child: TextWidget(
              text: 'Take an Assessment',
              fontSize: 14,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: 8,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ARView(
                          name: colors[index],
                          file:
                              'assets/models/Color/Color_${colors[index]}.gltf',
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
                  'assets/images/colors/${index + 1}${index + 1}.jpg',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
