import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/breastposture.dart';
import 'package:flutter_application_1/Screen/infoposture.dart';

class BreastScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  BreastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('อก'),
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
                  width: double.infinity, // กำหนดความกว้างให้เต็มหน้าจอ
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // สีพื้นหลัง
                        minimumSize:
                            const Size(150, 80), // ขนาดปุ่ม, ปรับตามความเหมาะสม
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0), // มุมโค้งมน
                        ),
                      ),
                      child: const Text(
                        "Push Up",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Push_up.mp4',
                            '1. นอนคว่ำ แขนและลำตัวเหยียดตรง \n2. ตำแหน่งแขนและข้อมืออยู่ในแนวเดียวกัน \n3. เท้าตั้งฉากกับพื้น เหมือนท่า High Plank\n4.จากนั้นงอข้อศอกลง หย่อนตัวเข้าหาพื้น แต่หลังตรงห้ามแอ่นหลัง ให้อกห่างจากพื้นไม่เกิน 10 ซม.\nยกตัวขึ้นกลับไปสู่ท่าเริ่มต้น',
                            "Push Up");
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                SizedBox(
                  width: double.infinity, // กำหนดความกว้างให้เต็มหน้าจอ
                  child: Material(
                    elevation: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // สีพื้นหลัง
                        minimumSize: const Size(double.infinity,
                            80), // ขนาดปุ่ม (กว้างเต็มหน้าจอ, ความสูง 80)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0), // มุมโค้งมน
                        ),
                      ),
                      child: const Text(
                        "Dumbbell Fly",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_Fly.mp4',
                            '1.นอนหงายลงบนเบาะออกกำลังกาย\n2.มือจับดัมเบลทั้งสองข้าง หันฝ่ามือเข้าหากัน\n3.ค่อยๆคลายกล้ามเนื้ออก ดันดัมเบลขึ้นลงเป็นครี่งวงกลม ไม่ล็อคข้อศอก จนกล้ามเนื้ออกเหยียดตัวจนสุด\n4.แขนทำมุมประมาณ 70 องศากับลำตัว\n5.เริ่มออกแรงเกร็งกล้ามเนื้ออกขึ้นอีกครั้ง และยกดัมเบลขึ้นจนสุด',
                            "Dumbbell Fly");
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                SizedBox(
                  width: double.infinity, // กำหนดความกว้างให้เต็มหน้าจอ
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
                        "Dumbbell Bench Press",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_Bench_Press.mp4',
                            '1.นอนหงายบนเบาะออกกำลังกาย ให้เบาะเอียงประมาณ 45 องศา วางเท้าติดพื้น\n2.จับดัมเบลให้ความกว้างห่างจากไหล่เล็กน้อย หันฝ่ามือออกไปทางด้านหน้าของลำตัว\n3.งอแขนลง คลายกล้ามเนื้ออก ลดดัมเบลลงจนสุดเกือบแตะอก\n4.และออกแรงดันดัมเบลขึ้นอีกครั้งให้สุดแขน',
                            "Dumbbell Bench Press");
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
                        "Dumbbell Pullover",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_Pullover.mp4',
                            '1.นอนหงายบนเบาะออกกำลังกาย พาดตัวลงบนเบาะ ให้ศีรษะเลยเบาะเล็กน้อย\n2.จับดัมเบลด้วยมือทั้งสองข้าง ยกดัมเบลเหนือศีรษะ ตรงกับอก แขนตึง ไม่ล็อคข้อศอก\n3.จากนั้นลดดัมเบลลงไปด้านหลังช้าๆ จนสุดแขน แต่แขนยังคงเหยียดตึงอยู่ หมุนแค่หัวไหล่\n4.ออกแรงเกร็งกล้ามอก ยกดัมเบลขึ้นกลับมาไว้เหนือศีรษะถ้าแรก',
                            "Dumbbell Pullover");
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
