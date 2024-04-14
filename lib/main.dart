import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:flutter_application_1/Screen/signup.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAwAc6GtGsilfIL0BuWWmTo_Y8mmaoacZE',
              appId: '1:965082785730:android:143dee5b8e0967700a985b',
              messagingSenderId: '965082785730',
              projectId: 'fitjungapplication'))
      : await Firebase.initializeApp();
  runApp(const Fitjung());
}

class Fitjung extends StatelessWidget {
  const Fitjung({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "FITJUNG", home: SignupScreen());
  }
}
