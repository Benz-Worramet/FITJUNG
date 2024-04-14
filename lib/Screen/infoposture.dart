import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class InfoPosture extends StatefulWidget {
  final String videoPath;
  final String detailText;
  final String exerciseName; // Add this field

  const InfoPosture({
    Key? key,
    required this.videoPath,
    required this.detailText,
    required this.exerciseName, // Add this
  }) : super(key: key);

  @override
  _InfoPostureState createState() => _InfoPostureState();
}

class _InfoPostureState extends State<InfoPosture> {
  void addExerciseTime(int seconds) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'default_user';
    final firestoreInstance = FirebaseFirestore.instance;
    var userDoc = firestoreInstance.collection('users').doc(userId);
    String category = categorizeExercise(widget.exerciseName);

    firestoreInstance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(userDoc);

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      int newTotalTime = data.containsKey('exercise_time')
          ? data['exercise_time'] + seconds
          : seconds;
      int newCategoryCount =
          data.containsKey(category) ? data[category] + 1 : 1;

      Map<String, dynamic> updates = {
        'exercise_time': newTotalTime,
        category: newCategoryCount
      };

      transaction.update(userDoc, updates);
    });
  }

  String categorizeExercise(String exerciseName) {
    if ([
      'Forward lunge',
      'Back Lunge',
      'Side Leg Lifts',
      'Squat',
      'Donkey Kicks'
    ].contains(exerciseName)) {
      return 'leg';
    } else if ([
      'Dumbbell Biceps Curl',
      'Dumbbell Hammer Curl',
      'Dumbbell Overhead Extension',
      'Dips',
      'Dumbbell Tricep Kick Back'
    ].contains(exerciseName)) {
      return 'arm';
    } else if ([
      'Dumbbell Overhead Press',
      'Dumbbell Lateral Raise',
      'Dumbbell Front Raise',
      'Dumbbell High Pull'
    ].contains(exerciseName)) {
      return 'shoulder';
    } else if ([
      'Push Up',
      'Dumbbell Fly',
      'Dumbbell Bench Press',
      'Dumbbell Pullover'
    ].contains(exerciseName)) {
      return 'breast';
    }
    return 'other';
  }

  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  int selectedTime = 1;
  int countdown = 90;
  Timer? timer;
  bool isCounting = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: false,
    );

    updateCountdown();
  }

  void updateCountdown() {
    setState(() {
      countdown = selectedTime * 90;
    });
  }

  void startCountdown() {
    addExerciseTime(selectedTime * 90);

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        t.cancel();
        setState(() {
          isCounting = false;
        });
      }
    });
    setState(() {
      isCounting = true;
    });
  }

  @override
  void dispose() {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exerciseName), // ใช้ชื่อท่าที่ได้รับมาแสดงบน AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (timer?.isActive ?? false) {
              timer?.cancel();
            }
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: _controller.value.isInitialized
                  ? Chewie(
                      controller: _chewieController,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 50,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.detailText,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            DropdownButton<int>(
              value: selectedTime,
              items: [1, 2, 3, 4].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedTime = newValue;
                    updateCountdown();
                  });
                }
              },
              isExpanded: true,
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
            ),
            Center(
              child: Text(
                "${(countdown ~/ 60).toString().padLeft(2, '0')}:${(countdown % 60).toString().padLeft(2, '0')}",
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: ElevatedButton(
                onPressed: startCountdown,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                child: const Text("เริ่มนับถอยหลัง"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class InfoPosture extends StatefulWidget {
//   final String videoPath;
//   final String detailText;
//   final String exerciseName; // Add this field

//   const InfoPosture({
//     Key? key,
//     required this.videoPath,
//     required this.detailText,
//     required this.exerciseName, // Add this
//   }) : super(key: key);

//   @override
//   _InfoPostureState createState() => _InfoPostureState();
// }

// class _InfoPostureState extends State<InfoPosture> {
//   void addExerciseTime(int seconds) async {
//     String userId = FirebaseAuth.instance.currentUser?.uid ?? 'default_user';
//     final firestoreInstance = FirebaseFirestore.instance;
//     var userDoc = firestoreInstance.collection('users').doc(userId);

//     firestoreInstance.runTransaction((transaction) async {
//       DocumentSnapshot snapshot = await transaction.get(userDoc);
//       int newTotal = snapshot.exists
//           ? (snapshot['exercise_time'] ?? 0) + seconds
//           : seconds;
//       transaction.set(userDoc, {'exercise_time': newTotal});
//     });
//   }

//   late VideoPlayerController _controller;
//   late ChewieController _chewieController;
//   int selectedTime = 1;
//   int countdown = 90;
//   Timer? timer;
//   bool isCounting = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(widget.videoPath)
//       ..initialize().then((_) {
//         setState(() {});
//       });

//     _chewieController = ChewieController(
//       videoPlayerController: _controller,
//       aspectRatio: 16 / 9,
//       autoPlay: false,
//       looping: false,
//     );

//     updateCountdown();
//   }

//   void updateCountdown() {
//     setState(() {
//       countdown = selectedTime * 90;
//     });
//   }

//   void startCountdown() {
//     addExerciseTime(selectedTime * 90);

//     timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
//       if (countdown > 0) {
//         setState(() {
//           countdown--;
//         });
//       } else {
//         t.cancel();
//         setState(() {
//           isCounting = false;
//         });
//       }
//     });
//     setState(() {
//       isCounting = true;
//     });
//   }

//   @override
//   void dispose() {
//     if (timer?.isActive ?? false) {
//       timer?.cancel();
//     }
//     _controller.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.exerciseName), // ใช้ชื่อท่าที่ได้รับมาแสดงบน AppBar
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             if (timer?.isActive ?? false) {
//               timer?.cancel();
//             }
//             Navigator.pop(context, true);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 3,
//               child: _controller.value.isInitialized
//                   ? Chewie(
//                       controller: _chewieController,
//                     )
//                   : const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: 50,
//                 width: 50,
//                 child: FittedBox(
//                   child: FloatingActionButton(
//                     onPressed: () {
//                       setState(() {
//                         if (_controller.value.isPlaying) {
//                           _controller.pause();
//                         } else {
//                           _controller.play();
//                         }
//                       });
//                     },
//                     child: Icon(
//                       _controller.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Text(
//                 widget.detailText,
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             DropdownButton<int>(
//               value: selectedTime,
//               items: [1, 2, 3, 4].map((int value) {
//                 return DropdownMenuItem<int>(
//                   value: value,
//                   child: Text(value.toString()),
//                 );
//               }).toList(),
//               onChanged: (int? newValue) {
//                 if (newValue != null) {
//                   setState(() {
//                     selectedTime = newValue;
//                     updateCountdown();
//                   });
//                 }
//               },
//               isExpanded: true,
//               underline: Container(
//                 height: 2,
//                 color: Colors.red,
//               ),
//             ),
//             Center(
//               child: Text(
//                 "${(countdown ~/ 60).toString().padLeft(2, '0')}:${(countdown % 60).toString().padLeft(2, '0')}",
//                 style:
//                     const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
//               child: ElevatedButton(
//                 onPressed: startCountdown,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.red,
//                   shape: const StadiumBorder(),
//                   padding: const EdgeInsets.symmetric(vertical: 14.0),
//                 ),
//                 child: const Text("เริ่มนับถอยหลัง"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
