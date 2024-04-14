import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Exercise.dart';
import 'package:flutter_application_1/Screen/Statistic.dart';
import 'package:flutter_application_1/Screen/calendar.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:flutter_application_1/Screen/piechart.dart';
import 'package:flutter_application_1/Screen/profile.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    ExerciseScreen(),
    const CalendarScreen(),
    const StatisticScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FITJUNG"),
        automaticallyImplyLeading: false,
        centerTitle: true, // This removes the back button
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Show a dialog asking the user to confirm log out
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Logout Confirmation"),
                    content: const Text("Are your sure want to log out?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          // Dismiss the dialog but keep the user logged in
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text("Sign Out"),
                        onPressed: () {
                          // Log out the user
                          auth.signOut().then((result) {
                            Navigator.of(context)
                                .pop(); // Close the dialog first
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          }).catchError((error) {
                            // Handle any errors here
                            print("Logout error: $error");
                          });
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/exercise_icon.png")),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/calendar_icon.png")),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/like_icon.png")),
            label: 'Statistic',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/profile_icon.png")),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor:
            Colors.black, // This sets the unselected item color to black
        backgroundColor:
            Colors.black, // This sets the background color to black
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomeScreen(),
    );
  }
}
