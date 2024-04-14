import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/controller/create.dart';

class Authen {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  CreateUser createuser = CreateUser();
  bool checklogin() {
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> loginEmail(String Email, String Password) async {
    await auth.signInWithEmailAndPassword(email: Email, password: Password);
  }

  Future<void> signinEmail(String Email, String Password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: Email, password: Password);
    User? user = result.user;

    await createuser.createUser(Email, user!.uid);
  }
}
