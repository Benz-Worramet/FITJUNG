import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UpdateUser {
  final firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<void> updateBmi(String uid, double bmi) async {
    await firestore.collection('user').doc(uid).update({
      'bmi': bmi,
    });
  }

  Future<void> updateWeight(String uid, double weight) async {
    await firestore.collection('user').doc(uid).update({
      'weight': weight,
    });
  }

  Future<void> updateHeight(String uid, double height) async {
    await firestore.collection('user').doc(uid).update({
      'height': height,
    });
  }

  Future<void> updateName(String uid, String name) async {
    await firestore.collection('user').doc(uid).update({
      'name': name,
    });
  }

  Future<void> updateProfile(String uid, String profile) async {
    const String defaultPath = "assets/image/Profile.png";
    final Reference storageRef = storage.ref().child(defaultPath);
    final String url = await storageRef.getDownloadURL();

    await firestore.collection('user').doc(uid).update({
      'profileImage': url,
    });
  }
}

class UpdateProfile {
  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    print('No Images Selected');
  }
}
