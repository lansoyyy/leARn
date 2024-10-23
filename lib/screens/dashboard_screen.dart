import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/tabs/records_tab.dart';
import 'package:solar_mobile/screens/tabs/scores_tab.dart';
import 'package:solar_mobile/utils/colors.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class DashboardScreen extends StatefulWidget {
  String name;
  DashboardScreen({super.key, required this.name});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ScoresTab(),
    const RecordsTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo-removebg-preview.png',
                color: Colors.white,
                height: 50,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Hi ${widget.name}',
                    fontSize: 14,
                    fontFamily: 'Medium',
                    color: Colors.white,
                  ),
                  TextWidget(
                    text: 'Welcome to our Dashboard',
                    fontSize: 14,
                    fontFamily: 'Medium',
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Scores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_2_outlined),
            label: 'Student Records',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
