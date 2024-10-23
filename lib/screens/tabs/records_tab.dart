import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class RecordsTab extends StatefulWidget {
  const RecordsTab({super.key});

  @override
  State<RecordsTab> createState() => _RecordsTabState();
}

class _RecordsTabState extends State<RecordsTab> {
  String type = '';
  @override
  Widget build(BuildContext context) {
    return type != ''
        ? record()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      type = 'Letter';
                    });
                  },
                  child: TextWidget(
                    text: 'Alphabet',
                    fontSize: 48,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      type = 'Color';
                    });
                  },
                  child: TextWidget(
                    text: 'Color',
                    fontSize: 48,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      type = 'Shapes';
                    });
                  },
                  child: TextWidget(
                    text: 'Shape',
                    fontSize: 48,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      type = 'Number';
                    });
                  },
                  child: TextWidget(
                    text: 'Number',
                    fontSize: 48,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
            ],
          );
  }

  Widget record() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Scores')
            .where('type', isEqualTo: type)
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
