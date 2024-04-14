import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/read.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final DateTime selectedDay;

  const DetailScreen({Key? key, required this.selectedDay}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String selectedBodyPart1 = '';
  String selectedPosture1 = '';
  String selectedBodyPart2 = '';
  String selectedPosture2 = '';

  String selectedBodyPart3 = '';
  String selectedPosture3 = '';

  String selectedBodyPart4 = '';
  String selectedPosture4 = '';

  String selectedBodyPart5 = '';
  String selectedPosture5 = '';

  String selectedBodyPart6 = '';
  String selectedPosture6 = '';

  String selectedBodyPart7 = '';
  String selectedPosture7 = '';

  String selectedBodyPart8 = '';
  String selectedPosture8 = '';

  String selectedBodyPart9 = '';
  String selectedPosture9 = '';

  String selectedBodyPart10 = '';
  String selectedPosture10 = '';

  List<String> getPostures(String bodyPart) {
    if (bodyPart == 'แขน') {
      return [
        'Dumbbell Biceps Curl',
        'Dumbbell Hammer Curl',
        'Dumbbell Overhead Extension',
        'Dips',
        'Dumbbell Tricep Kick Back'
      ];
    } else if (bodyPart == 'ขา') {
      return [
        'Forward lunge',
        'Back Lunge',
        'Side Leg Lifts',
        'Squat',
        'Donkey Kicks'
      ];
    } else if (bodyPart == 'ไหล่') {
      return [
        'Dumbbell Overhead Press',
        'Dumbbell Lateral Raise',
        'Dumbbell Front Raise',
        'Dumbbell High Pull'
      ];
    } else {
      return [
        'Push Up',
        'Dumbbell Fly',
        'Dumbbell Bench Press',
        'Dumbbell Pullover',
      ];
    }
  }

  Future<void> saveWorkoutData(
      int index, String bodyPart, String posture) async {
    String userId = ReadUserData().getCurrentUserUid();
    String formattedDate = DateFormat('yyyy-MM-dd').format(widget.selectedDay);

    Map<String, dynamic> dataToSave = {
      'bodyPart': bodyPart,
      'posture': posture,
    };

    try {
      await FirebaseFirestore.instance.collection('workouts').doc(userId).set({
        formattedDate: {
          'exercise$index': dataToSave,
        }
      }, SetOptions(merge: true));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Workout for row $index saved successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save workout for row $index: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    loadWorkoutData();
  }

  Future<void> loadWorkoutData() async {
    String userId = ReadUserData().getCurrentUserUid();
    String formattedDate = DateFormat('yyyy-MM-dd').format(widget.selectedDay);

    try {
      DocumentSnapshot workoutSnapshot = await FirebaseFirestore.instance
          .collection('workouts')
          .doc(userId)
          .get();

      if (workoutSnapshot.exists) {
        Map<String, dynamic> workoutData =
            workoutSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> workoutForDate = workoutData[formattedDate] ?? {};

        setState(() {
          for (int i = 1; i <= 10; i++) {
            String exerciseKey = 'exercise$i';
            if (workoutForDate.containsKey(exerciseKey)) {
              Map<String, dynamic> exerciseData = workoutForDate[exerciseKey];
              // Directly set the state variables based on the index
              switch (i) {
                case 1:
                  selectedBodyPart1 = exerciseData['bodyPart'];
                  selectedPosture1 = exerciseData['posture'];
                  break;
                case 2:
                  selectedBodyPart2 = exerciseData['bodyPart'];
                  selectedPosture2 = exerciseData['posture'];
                  break;
                case 3:
                  selectedBodyPart3 = exerciseData['bodyPart'];
                  selectedPosture3 = exerciseData['posture'];
                  break;
                case 4:
                  selectedBodyPart4 = exerciseData['bodyPart'];
                  selectedPosture4 = exerciseData['posture'];
                  break;
                case 5:
                  selectedBodyPart5 = exerciseData['bodyPart'];
                  selectedPosture5 = exerciseData['posture'];
                  break;
                case 6:
                  selectedBodyPart6 = exerciseData['bodyPart'];
                  selectedPosture6 = exerciseData['posture'];
                  break;
                case 7:
                  selectedBodyPart7 = exerciseData['bodyPart'];
                  selectedPosture7 = exerciseData['posture'];
                  break;
                case 8:
                  selectedBodyPart8 = exerciseData['bodyPart'];
                  selectedPosture8 = exerciseData['posture'];
                  break;
                case 9:
                  selectedBodyPart9 = exerciseData['bodyPart'];
                  selectedPosture9 = exerciseData['posture'];
                  break;
              }
            }
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load workout: $e')),
      );
    }
  }

  Widget buildDropdownRow(
      int index,
      String label,
      String selectedBodyPart,
      String selectedPosture,
      ValueChanged<String?> onBodyPartChanged,
      ValueChanged<String?> onPostureChanged) {
    List<String> postureOptions = getPostures(selectedBodyPart);

    return Row(
      children: [
        Text(label),
        const SizedBox(width: 12.0),
        Expanded(
          child: DropdownButton<String>(
            value: selectedBodyPart.isEmpty ? null : selectedBodyPart,
            onChanged: (newValue) {
              onBodyPartChanged(newValue);
              if (newValue != null) {
                setState(() {
                  if (index == 1) selectedBodyPart1 = newValue;
                  if (index == 2) selectedBodyPart2 = newValue;
                  if (index == 3) selectedBodyPart3 = newValue;
                  if (index == 4) selectedBodyPart4 = newValue;
                  if (index == 5) selectedBodyPart5 = newValue;
                  if (index == 6) selectedBodyPart6 = newValue;
                  if (index == 7) selectedBodyPart7 = newValue;
                  if (index == 8) selectedBodyPart8 = newValue;
                  if (index == 9) selectedBodyPart9 = newValue;
                  if (index == 10) selectedBodyPart10 = newValue;
                  // Add more if statements for other indexes if necessary.
                });
                saveWorkoutData(index, newValue, selectedPosture);
              }
            },
            items: ['แขน', 'ขา', 'ไหล่', 'อก']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            hint: const Text('เลือกส่วนร่างกาย'),
          ),
        ),
        const SizedBox(width: 24.0),
        Expanded(
          child: DropdownButton<String>(
            value: selectedPosture.isEmpty ? null : selectedPosture,
            onChanged: (newValue) {
              onPostureChanged(newValue);
              if (newValue != null) {
                setState(() {
                  if (index == 1) selectedPosture1 = newValue;
                  if (index == 2) selectedPosture2 = newValue;
                  if (index == 3) selectedPosture3 = newValue;
                  if (index == 4) selectedPosture4 = newValue;
                  if (index == 5) selectedPosture5 = newValue;
                  if (index == 6) selectedPosture6 = newValue;
                  if (index == 7) selectedPosture7 = newValue;
                  if (index == 8) selectedPosture8 = newValue;
                  if (index == 9) selectedPosture9 = newValue;
                  if (index == 10) selectedPosture10 = newValue;
                  // Add more if statements for other indexes if necessary.
                });
                saveWorkoutData(index, selectedBodyPart, newValue);
              }
            },
            items: postureOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            hint: const Text('ท่าออกกำลังกาย'),
          ),
        ),
      ],
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE, MMMM d, yyyy').format(widget.selectedDay);

    return Scaffold(
      appBar: AppBar(
        title: Text(formattedDate),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            buildDropdownRow(
              1,
              '1:',
              selectedBodyPart1,
              selectedPosture1,
              (newValue) {
                setState(() {
                  selectedBodyPart1 = newValue ?? '';
                  selectedPosture1 =
                      ''; // Reset the posture when the body part changes
                });
                if (newValue != null) {
                  saveWorkoutData(1, newValue, selectedPosture1);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture1 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(1, selectedBodyPart1, newValue);
                }
              },
            ),
            buildDropdownRow(
              2,
              '2:',
              selectedBodyPart2,
              selectedPosture2,
              (newValue) {
                setState(() {
                  selectedBodyPart2 = newValue ?? '';
                  selectedPosture2 = '';
                });
                if (newValue != null) {
                  saveWorkoutData(2, newValue, selectedPosture2);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture2 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(2, selectedBodyPart2, newValue);
                }
              },
            ),
            buildDropdownRow(
              3,
              '3:',
              selectedBodyPart3,
              selectedPosture3,
              (newValue) {
                setState(() {
                  selectedBodyPart3 = newValue ?? '';
                  selectedPosture3 = '';
                });
                if (newValue != null) {
                  saveWorkoutData(3, newValue, selectedPosture3);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture3 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(3, selectedBodyPart3, newValue);
                }
              },
            ),
            buildDropdownRow(
              4,
              '4:',
              selectedBodyPart4,
              selectedPosture4,
              (newValue) {
                setState(() {
                  selectedBodyPart4 = newValue ?? '';
                  selectedPosture4 =
                      ''; // Reset the posture when the body part changes
                });
                if (newValue != null) {
                  saveWorkoutData(4, newValue, selectedPosture4);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture4 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(4, selectedBodyPart4, newValue);
                }
              },
            ),
            buildDropdownRow(
              5,
              '5:',
              selectedBodyPart5,
              selectedPosture5,
              (newValue) {
                setState(() {
                  selectedBodyPart5 = newValue ?? '';
                  selectedPosture1 =
                      ''; // Reset the posture when the body part changes
                });
                if (newValue != null) {
                  saveWorkoutData(5, newValue, selectedPosture5);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture5 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(5, selectedBodyPart5, newValue);
                }
              },
            ),
            buildDropdownRow(
              6,
              '6:',
              selectedBodyPart6,
              selectedPosture6,
              (newValue) {
                setState(() {
                  selectedBodyPart6 = newValue ?? '';
                  selectedPosture6 =
                      ''; // Reset the posture when the body part changes
                });
                if (newValue != null) {
                  saveWorkoutData(6, newValue, selectedPosture6);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture6 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(6, selectedBodyPart6, newValue);
                }
              },
            ),
            buildDropdownRow(
              7,
              '7:',
              selectedBodyPart7,
              selectedPosture7,
              (newValue) {
                setState(() {
                  selectedBodyPart7 = newValue ?? '';
                  selectedPosture7 =
                      ''; // Reset the posture when the body part changes
                });
                if (newValue != null) {
                  saveWorkoutData(7, newValue, selectedPosture7);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture7 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(7, selectedBodyPart7, newValue);
                }
              },
            ),
            buildDropdownRow(
              8,
              '8:',
              selectedBodyPart8,
              selectedPosture8,
              (newValue) {
                setState(() {
                  selectedBodyPart8 = newValue ?? '';
                  selectedPosture8 =
                      ''; // Reset the posture when the body part changes
                });
                if (newValue != null) {
                  saveWorkoutData(8, newValue, selectedPosture8);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture8 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(8, selectedBodyPart8, newValue);
                }
              },
            ),
            buildDropdownRow(
              9,
              '9:',
              selectedBodyPart9,
              selectedPosture9,
              (newValue) {
                setState(() {
                  selectedBodyPart9 = newValue ?? '';
                  selectedPosture9 =
                      ''; // Reset the posture when the body part changes
                });
                if (newValue != null) {
                  saveWorkoutData(9, newValue, selectedPosture9);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture9 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(9, selectedBodyPart9, newValue);
                }
              },
            ),
            buildDropdownRow(
              10,
              '10:',
              selectedBodyPart10,
              selectedPosture10,
              (newValue) {
                setState(() {
                  selectedBodyPart10 = newValue ?? '';
                  selectedPosture10 =
                      ''; // Reset the posture when the body part changes
                });
                if (newValue != null) {
                  saveWorkoutData(10, newValue, selectedPosture10);
                }
              },
              (newValue) {
                setState(() {
                  selectedPosture10 = newValue ?? '';
                });
                if (newValue != null) {
                  saveWorkoutData(10, selectedBodyPart10, newValue);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
