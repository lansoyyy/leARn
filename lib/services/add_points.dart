import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> addScore(name, score, type) async {
  final docUser = FirebaseFirestore.instance.collection('Scores').doc();

  final json = {
    'name': name,
    'score': score,
    'type': type,
    'id': docUser.id,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
  return docUser.id;
}
