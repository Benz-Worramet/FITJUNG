import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/arm.dart';
import 'package:flutter_application_1/Screen/breast.dart';
import 'package:flutter_application_1/Screen/leg.dart';
import 'package:flutter_application_1/Screen/shoulder.dart';

class ExerciseScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Exercise'),
        ),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(double.infinity, 80),
                ),
                child: const Text('ขา'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LegScreen()));
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(double.infinity, 80),
                ),
                child: const Text('แขน'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ArmScreen()));
                },
              ),
              const SizedBox(height: 20), // Space between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.red, // Text color
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(double.infinity, 80),
                ),
                child: const Text('อก'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BreastScreen()));
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(double.infinity, 80),
                ),
                child: const Text('ไหล่'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoulderScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
