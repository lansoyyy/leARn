import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_mobile/widgets/text_widget.dart';
import 'package:solar_mobile/widgets/toast_widget.dart';

class AccessTab extends StatelessWidget {
  const AccessTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Admin').snapshots(),
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
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: '${data.docs[index]['name']}',
                        fontSize: 18,
                      ),
                      TextWidget(
                        text: '${data.docs[index]['email']}',
                        fontSize: 12,
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () async {
                            await FirebaseFirestore.instance
                                .collection('Admin')
                                .doc(data.docs[index].id)
                                .delete();
                            showToast('Admin deleted!');
                          },
                          child: TextWidget(
                            text: 'Delete',
                            fontSize: 14,
                          ),
                        ),
                      ];
                    },
                  ));
            },
          );
        });
  }
}
