import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/controller/auth.dart';

class ReadUserData {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getCurrentUserData() async {
    var currentUserSnapshot =
        await firestore.collection("users").doc(auth.currentUser?.uid).get();

    if (currentUserSnapshot.exists) {
      // Check if the snapshot contains data before accessing it
      Map<String, dynamic>? currentUserData = currentUserSnapshot.data();
      return currentUserData;
    } else {
      // Handle the case where the document does not exist
      return null;
    }
  }

  String getCurrentUserUid() {
    if (Authen().checklogin() == false) {
      return '';
    } else {
      return auth.currentUser!.uid;
    }
  }
}
