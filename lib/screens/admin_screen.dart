import 'package:flutter/material.dart';
import 'package:solar_mobile/utils/colors.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.account_circle),
          title: TextWidget(
            text: 'Score: 5',
            fontSize: 18,
          ),
          subtitle: TextWidget(
            text: 'Lance Olana',
            fontSize: 12,
          ),
          trailing: TextWidget(
            text: 'Date and Time',
            fontSize: 12,
          ),
        );
      },
    ),
    const SizedBox(),
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
        backgroundColor: primary,
        title: TextWidget(
          text: 'Admin Home',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.score),
            label: 'Scores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_2_outlined),
            label: 'Users',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
