import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Home.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:flutter_application_1/controller/auth.dart';
import 'package:flutter_application_1/model/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart' as ffv;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: "", password: "", uid: "");
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
    confirmPasswordController.addListener(() {
      setState(() {});
    });
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
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sign Up",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange))
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                              child: buildTextFormField(
                                controller: emailController,
                                icon: Icons.email_rounded,
                                hint: "Email",
                                validators: ffv.MultiValidator([
                                  ffv.RequiredValidator(
                                      errorText: "Please enter your email"),
                                  ffv.EmailValidator(
                                      errorText:
                                          "Please enter a valid email address"),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                              child: buildTextFormField(
                                controller: passwordController,
                                icon: Icons.lock,
                                hint: "Password",
                                validators: ffv.RequiredValidator(
                                    errorText: "Please enter your password"),
                                obscureText: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                              child: buildTextFormField(
                                controller: confirmPasswordController,
                                icon: Icons.lock,
                                hint: "Confirm Password",
                                validators: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter Confirm Password";
                                  } else if (value != passwordController.text) {
                                    return "Passwords do not match";
                                  }
                                  return null;
                                },
                                obscureText: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    try {
                                      await Authen()
                                          .signinEmail(emailController.text,
                                              passwordController.text)
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        Fluttertoast.showToast(
                                          msg: "Your account has been created",
                                          gravity: ToastGravity.TOP,
                                        );
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const LoginScreen();
                                        }));
                                      });
                                    } catch (e) {
                                      Fluttertoast.showToast(
                                        msg: "Error: ${e.toString()}",
                                        gravity: ToastGravity.TOP,
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height: MediaQuery.of(context).size.height *
                                      0.075,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: 5,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: const Center(
                                    child: Text(
                                      "or",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
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
                                  vertical: 60),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Already have an account ? ',
                                      style: TextStyle(color: Colors.white60)),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                      );
                                    },
                                    child: const Text(
                                      'Log In',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required IconData icon,
    required ffv.FormFieldValidator<String>? validators,
    bool obscureText = false,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.055,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: Icon(icon, color: Colors.black87),
            ),
            Expanded(
              child: TextFormField(
                controller: controller,
                validator: validators,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle:
                      const TextStyle(color: Colors.black38, fontSize: 20),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
