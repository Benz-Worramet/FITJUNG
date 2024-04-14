import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/controller/read.dart';
import 'package:flutter_application_1/controller/update.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text('Profile'),
          ),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: BmiCalculatorWidget(),
        ),
      ),
    );
  }
}

class BmiCalculatorWidget extends StatefulWidget {
  const BmiCalculatorWidget({Key? key}) : super(key: key);

  @override
  _BmiCalculatorWidgetState createState() => _BmiCalculatorWidgetState();
}

class _BmiCalculatorWidgetState extends State<BmiCalculatorWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> updateUserData(String field, dynamic value) async {
    String userId = ReadUserData().getCurrentUserUid();
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .update({field: value});
      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$field updated successfully')),
      );
    } catch (e) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update $field: $e')),
      );
    }
  }

  Uint8List? image;

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  void loadUserProfile() async {
    String userId = ReadUserData().getCurrentUserUid();

    var userData =
        await FirebaseFirestore.instance.collection('user').doc(userId).get();
    var user = userData.data();
    if (user != null && mounted) {
      setState(() {
        nameController.text = user['name'] ?? '';
        weightController.text = user['weight']?.toString() ?? '';
        heightController.text = user['height']?.toString() ?? '';
      });
    }
  }

  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Uint8List imageBytes = await image.readAsBytes();
      setState(() {
        this.image = imageBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (image != null)
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(image!),
                    )
                  else
                    Image.network(
                      'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                if (nameController.text.isNotEmpty) {
                                  updateUserData('name', nameController.text);
                                }
                              },
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              updateUserData('name', value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: weightController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: const InputDecoration(
                            labelText: 'Weight (kg)',
                            suffixIcon: Icon(
                                Icons.edit), // Add edit icon inside text field
                          ),
                          onFieldSubmitted: (value) {
                            // Define action on submission, e.g., update Firestore
                            if (weightController.text.isNotEmpty &&
                                double.tryParse(weightController.text) !=
                                    null) {
                              updateUserData('weight',
                                  double.parse(weightController.text));
                              // Optionally, show feedback to the user
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Weight updated to ${weightController.text} kg')),
                              );
                            }
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                double.tryParse(value) == null) {
                              return 'Please enter a valid weight';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: heightController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                            labelText: 'Height (cm)',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            if (heightController.text.isNotEmpty &&
                                double.tryParse(heightController.text) !=
                                    null) {
                              updateUserData('height',
                                  double.parse(heightController.text));

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Height updated to ${heightController.text} cm')),
                              );
                            }
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                double.tryParse(value) == null) {
                              return 'Please enter a valid height';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        calculateBmiAndSaveData(
                            context); // ตอนนี้เรียกใช้ฟังก์ชันนี้
                      }
                    },
                    child: const Text('Calculate BMI'),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void calculateBmiAndSaveData(BuildContext context) {
    double? weight = double.tryParse(weightController.text);
    double? height = double.tryParse(heightController.text);
    if (weight != null && height != null) {
      double bmi = weight / (height / 100 * height / 100);
      String bmiResultMessage;

      // Determine the BMI category and set the appropriate message
      if (bmi >= 30) {
        bmiResultMessage =
            "ค่อนข้างอันตราย เสี่ยงต่อการเกิดโรคร้ายแรงที่แฝงมากับความอ้วน หากค่า BMI อยู่ในระดับนี้ จะต้องปรับพฤติกรรมการทานอาหาร และควรเริ่มออกกำลังกาย";
      } else if (bmi >= 25 && bmi <= 29.9) {
        bmiResultMessage =
            "อ้วนในระดับหนึ่ง ถึงแม้จะไม่ถึงเกณฑ์ที่ถือว่าอ้วนมาก ๆ แต่ก็ยังมีความเสี่ยงต่อการเกิดโรคที่มากับความอ้วน";
      } else if (bmi >= 18.6 && bmi <= 24) {
        bmiResultMessage =
            "น้ำหนักที่เหมาะสม จัดอยู่ในเกณฑ์ปกติ ห่างไกลโรคที่เกิดจากความอ้วน และมีความเสี่ยงต่อการเกิดโรคต่าง ๆ น้อยที่สุด ควรพยายามรักษาระดับค่า BMI ให้อยู่ในระดับนี้ให้นานที่สุด";
      } else {
        bmiResultMessage =
            "น้ำหนักน้อยกว่าปกติก็ไม่ค่อยดี หากคุณสูงมากแต่น้ำหนักน้อยเกินไป อาจเสี่ยงต่อการได้รับสารอาหารไม่เพียงพอหรือได้รับพลังงานไม่เพียงพอ ส่งผลให้ร่างกายอ่อนเพลียง่าย การรับประทานอาหารให้เพียงพอ และการออกกำลังกายเพื่อเสริมสร้างกล้ามเนื้อสามารถช่วยเพิ่มค่า BMI ให้อยู่ในเกณฑ์ปกติได้";
      }

      // Update BMI in Firestore
      updateUserData('bmi', bmi);

      // Show dialog with BMI result and category message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('BMI Result'),
            content: Text(
                'Your BMI is ${bmi.toStringAsFixed(2)}\n\n$bmiResultMessage'),
          );
        },
      );
    }
  }
}
