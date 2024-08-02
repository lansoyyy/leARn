import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/ar_view.dart';
import 'package:solar_mobile/screens/quiz/shapes_quiz_page.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class ShapesPage extends StatelessWidget {
  String name;

  ShapesPage({
    super.key,
    required this.name,
  });

  List shapes = [
    'Circle',
    'Diamond',
    'Heart',
    'Oval',
    'Rectangle',
    'Square',
    'Star',
    'Triangle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: TextWidget(
          text: 'Shapes',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShapesQuizPage(
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
                          name: shapes[index],
                          file:
                              'assets/models/Shape/Shape_${shapes[index]}.gltf',
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
                  'assets/images/shapes/${index + 1}${index + 1}.jpg',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
