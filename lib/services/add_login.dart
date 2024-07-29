import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> addLogin(name) async {
  final docUser = FirebaseFirestore.instance.collection('Logins').doc();

  final json = {
    'name': name,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
  return docUser.id;
}
