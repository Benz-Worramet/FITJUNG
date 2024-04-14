import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Home.dart';
import 'package:flutter_application_1/Screen/signup.dart';
import 'package:flutter_application_1/Screen/welcome.dart';
import 'package:flutter_application_1/model/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../controller/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? emailcontroller;
  TextEditingController? passwordcontroller;
  final formKey = GlobalKey<FormState>();

  Profile profile = Profile(email: "", password: "", uid: "");
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    passwordcontroller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    emailcontroller?.dispose();
    passwordcontroller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Log In",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange))
                        ],
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    child: Icon(
                                      Icons.email_rounded,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText:
                                                "Please enter your email"),
                                        EmailValidator(
                                            errorText:
                                                "Please enter a valid email address")
                                      ]),
                                      controller: emailcontroller,
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        color: Colors.black38,
                                        fontSize: 20,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 20,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: RequiredValidator(
                                          errorText:
                                              "Please enter your Password"),
                                      controller: passwordcontroller,
                                      obscureText: true,
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        color: Colors.black38,
                                        fontSize: 20,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 20,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                try {
                                  await Authen().loginEmail(
                                      emailcontroller!.text,
                                      passwordcontroller!.text);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const WelcomeScreen();
                                  }));
                                } on FirebaseAuthException catch (e) {
                                  Fluttertoast.showToast(
                                      msg: e.message ?? "Login failed");
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 5,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    "or",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 5,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                vertical: 30),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.symmetric(
                                            horizontal: 25),
                                    child: Image.asset(
                                      'assets/image/google_icon.png',
                                      height: 30,
                                    ),
                                  ),
                                  const Center(
                                    child: Text(
                                      "Log In With Google",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height * 0.065,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 25),
                                  child: Image.asset(
                                    'assets/image/facebook_icon.png',
                                    height: 35,
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    "Log In With Facebook",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an account yet? ',
                                    style: TextStyle(color: Colors.white60)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
