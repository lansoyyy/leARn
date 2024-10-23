import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class ScoresTab extends StatelessWidget {
  const ScoresTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
        });
  }
}
