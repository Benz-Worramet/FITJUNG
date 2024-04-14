import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:flutter_application_1/Screen/signup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register/Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Sign Up", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignupScreen();
                  }));
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text("Login", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
