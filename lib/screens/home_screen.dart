import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/ar_view.dart';
import 'package:solar_mobile/screens/dashboard_screen.dart';
import 'package:solar_mobile/screens/pages/colors_page.dart';
import 'package:solar_mobile/screens/pages/letters_page.dart';
import 'package:solar_mobile/screens/pages/numbers_page.dart';
import 'package:solar_mobile/screens/pages/shapes_page.dart';
import 'package:solar_mobile/utils/colors.dart';
import 'package:solar_mobile/widgets/drawer_widget.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  String name;

  HomeScreen({
    super.key,
    required this.name,
  });

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: const Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DashboardScreen(
                    name: widget.name,
                  )));
        },
      ),
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage(
            //         'assets/images/432488241_433203445943170_352186029455523305_n.jpg',
            //       ),
            //       fit: BoxFit.cover),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo-removebg-preview.png',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Hi ${widget.name}',
                            fontSize: 14,
                            fontFamily: 'Medium',
                            color: Colors.black,
                          ),
                          TextWidget(
                            text: 'Welcome to our Dashboard',
                            fontSize: 14,
                            fontFamily: 'Medium',
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    width: 175,
                    height: 40,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: 'Choose any category',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
                              builder: (context) => LettersPage(
                                    name: widget.name,
                                  )));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: primary!,
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  items[0]['image'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NumbersPage(
                                    name: widget.name,
                                  )));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: primary!,
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  items[1]['image'],
                                ),
                                fit: BoxFit.cover),
                          ),
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
                              builder: (context) => ColorsPage(
                                    name: widget.name,
                                  )));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: primary!,
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  items[2]['image'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ShapesPage(
                                    name: widget.name,
                                  )));
                        },
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: primary!,
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  items[3]['image'],
                                ),
                                fit: BoxFit.cover),
                          ),
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
