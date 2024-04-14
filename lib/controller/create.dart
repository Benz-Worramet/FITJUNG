import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/model/profile.dart';

class CreateUser {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance;

  Profile profile = Profile(email: '', password: '', uid: '');

  Future<void> createUser(String email, String uid) async {
    await firestore.collection("user").doc(uid).set({
      'uid': uid,
      'email': email,
      'bmi': profile.bmi,
      'height': profile.height,
      'weight': profile.weight,
      'name': profile.name
    });
  }
}
