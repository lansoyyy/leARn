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
    {
      'name': 'Letters',
      'image':
          'assets/images/419062210_1086964282361331_2454761638516789093_n.jpg'
    },
    {
      'name': 'Numbers',
      'image':
          'assets/images/431506628_366668399674835_3064160533770526119_n.jpg'
    },
    {
      'name': 'Colors',
      'image':
          'assets/images/432266951_3453808831577914_2560143994274601835_n.jpg'
    },
    {
      'name': 'Shapes',
      'image':
          'assets/images/431640890_3202768256696653_6398067143436399784_n.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/432488241_433203445943170_352186029455523305_n.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 20, 20),
                  child: TextWidget(
                    text: 'Welcome',
                    fontSize: 20,
                    fontFamily: 'Bold',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ARView(
                                    file: 'shapeTriangle2',
                                  )));
                        },
                        child: Image.asset(
                          items[0]['image'],
                          height: 200,
                          width: 150,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ARView(
                                    file: 'shapeTriangle2',
                                  )));
                        },
                        child: Image.asset(
                          items[1]['image'],
                          height: 200,
                          width: 150,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ARView(
                                    file: 'shapeTriangle2',
                                  )));
                        },
                        child: Image.asset(
                          items[2]['image'],
                          height: 200,
                          width: 150,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ARView(
                                    file: 'shapeTriangle2',
                                  )));
                        },
                        child: Image.asset(
                          items[3]['image'],
                          height: 200,
                          width: 150,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
