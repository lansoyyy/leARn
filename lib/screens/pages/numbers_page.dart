import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/ar_view.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});

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
                          file: 'assets/images/numbers/${index + 1}.glb',
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
