import 'package:flutter/material.dart';

import 'package:flutter_application_1/Screen/infoposture.dart';

class ArmScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  ArmScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('แขน'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(150, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        "Dumbbell Biceps Curl",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_Biceps_Curl.mp4',
                            'ท่าเล่นแขน ดัมเบล Dumbbell Bicep Curl ที่ช่วยเสริมส่วนกล้ามหน้าแขน เก็บศอกให้ชิดข้างลำตัว ไม่แกว่งเวลาผ่อนและออกแรง จะทำให้โดนกล้ามเนื้อหน้าแขนมากขึ้น',
                            "Dumbbell Biceps Curl");
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        "Dumbbell Hammer Curl",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_hammer_Curl.mp4',
                            'จัดตำแหน่งดัมเบลทั้งสองไว้ข้างตัว หันฝ่ามือทั้งสองข้างเข้าด้านใน แขนทั้งสองข้างอยู่ในลักษณะตรงจัดข้อศอกให้อยู่ด้านข้างลำตัว ยกดัมเบลด้านหนึ่งจนกระทั่งปลายแขนเป็นแนวตั้ง และนิ้วหัวแม่มืออยู่หน้าไหล่ และลดระดับไปที่ตำแหน่งเดิม และทำซ้ำ',
                            "Dumbbell Hammer Curl");
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        "Dumbbell Overhead Extension",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _navigateToInfoPosture(
                            context,
                            'assets/video/dumbbell_overhead_extension.mp4',
                            'ยืนกางขาเล็กน้อย ยืดตัวตรง ไม่ห่อไหล่ และถือดัมเบลด้วยมือทั้งสองข้าง โดยยกขึ้นมาเหนือหลังศีรษะ และเหยียดแขนให้ตรงจนรู้สึกว่าแขนตึง หลังจากนั้นค่อยๆงอแขนบริเวณข้อศอกให้ดัมเบลไปด้านหลัง และเหยียดแขนกลับมาในท่าเริ่มต้น ซึ่งหายใจเข้าเมื่อยกขึ้นเหนือศีรษะ และหายใจออกเมื่องอลง',
                            "Dumbbell Overhead Extension");
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        "Dips",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dips.mp4',
                            'ตำแหน่งมือวางอยู่บริเวณขอบเก้าอี้โดยให้มีระยะห่างประมาณช่วงหัวไหล่ของคุณ จากนั้นค่อยๆ หย่อนตัวลงให้แขนบริเวณส่วนข้อพับทำมุม 90 องศา ตั้งฉากกับพื้น แล้วดันตัวกลับขึ้น',
                            "Dips");
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        "Dumbbell Tricep Kick Back",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_tricep_kick_back.mp4',
                            'ก้มตัวลงข้างหน้าให้มากที่สุด  เอามือข้างหนึ่งยันพื้นห้องฝึกไว้   อีกข้างหนึ่งถือดัมเบลล์ตามภาพ  ให้ยกมือข้างที่ถือดัมเบลล์  เหยียดตรงไปทางด้านหลัง  แล้วจึงค่อยลดน้ำหนักดัมเบลล์ลงมาห้อยอยู่อย่างเดิม  จึงกลับยกแขนเหยียดตรงไปข้างหลังอีก โดยยกแขนให้สูงขึ้นเล็กน้อย',
                            "Dumbbell Tricep Kick Back");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToInfoPosture(
    BuildContext context,
    String videoPath,
    String detailText,
    String exerciseName,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoPosture(
          videoPath: videoPath,
          detailText: detailText,
          exerciseName: exerciseName,
        ),
      ),
    );
  }
}
