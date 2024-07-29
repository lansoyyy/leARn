import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solar_mobile/utils/colors.dart';
import 'package:solar_mobile/widgets/text_widget.dart';
import 'package:intl/intl.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Scores')
            .orderBy('dateTime', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final data = snapshot.requireData;
          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  size: 50,
                ),
                title: TextWidget(
                  text: 'Score: ${data.docs[index]['score']}',
                  fontSize: 18,
                ),
                subtitle: TextWidget(
                  text: '${data.docs[index]['name']}',
                  fontSize: 12,
                ),
                trailing: TextWidget(
                  text: DateFormat.yMMMd()
                      .add_jm()
                      .format(data.docs[index]['dateTime'].toDate()),
                  fontSize: 12,
                ),
              );
            },
          );
        }),
    StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Logins')
            .orderBy('dateTime', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final data = snapshot.requireData;
          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  size: 50,
                ),
                title: TextWidget(
                  text: 'Name: ${data.docs[index]['name']}',
                  fontSize: 18,
                ),
                trailing: TextWidget(
                  text: DateFormat.yMMMd()
                      .add_jm()
                      .format(data.docs[index]['dateTime'].toDate()),
                  fontSize: 12,
                ),
              );
            },
          );
        }),
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
