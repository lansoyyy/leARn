import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> addAdmin(name, email, password) async {
  final docUser = FirebaseFirestore.instance.collection('Admin').doc();

  final json = {
    'name': name,
    'email': email,
    'password': password,
    'id': docUser.id,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
  return docUser.id;
}
