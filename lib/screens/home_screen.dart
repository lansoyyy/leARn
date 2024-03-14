import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/ar_view.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> items = [
    {'name': 'Letters', 'image': 'assets/images/letter.jpg'},
    {'name': 'Numbers', 'image': 'assets/images/number.jpg'},
    {'name': 'Colors', 'image': 'assets/images/color.jpg'},
    {'name': 'Shapes', 'image': 'assets/images/shape.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextWidget(
          text: 'Home',
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8C52FF), Color(0xFFFF914D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: TextWidget(
                  text: 'Welcome User,',
                  fontSize: 24,
                  fontFamily: 'Bold',
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          if (index == 2) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ARView(
                                      file: 'colorRed',
                                    )));
                          } else if (index == 3) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ARView(
                                      file: 'shapeTriangle2',
                                    )));
                          }
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                items[index]['image'],
                                height: 125,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextWidget(
                                text: items[index]['name'],
                                fontSize: 16,
                                fontFamily: 'Bold',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
