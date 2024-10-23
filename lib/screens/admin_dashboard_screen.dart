import 'package:flutter/material.dart';
import 'package:solar_mobile/screens/tabs/access_tab.dart';
import 'package:solar_mobile/screens/tabs/records_tab.dart';
import 'package:solar_mobile/screens/tabs/scores_tab.dart';
import 'package:solar_mobile/services/add_admin.dart';
import 'package:solar_mobile/utils/colors.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class AdminDashboardScreen extends StatefulWidget {
  String name;
  AdminDashboardScreen({super.key, required this.name});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ScoresTab(),
    const RecordsTab(),
    const AccessTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showAdminInputDialog(context);
        },
      ),
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
                    text: "Welcome to Head's Portal",
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
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings_outlined),
            label: 'Admin Access',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primary,
        onTap: _onItemTapped,
      ),
    );
  }

  void showAdminInputDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Admin Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                String password = passwordController.text;

                // You can add logic here to handle the admin details, e.g., validation, saving, etc.

                addAdmin(name, email, password);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
