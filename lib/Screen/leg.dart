import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/infoposture.dart';

class LegScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ขา'),
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
                        "Forward lunge",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/forward_lunge.mp4',
                            'ยืนตัวตรงขาชิด ตั้งแขนไว้บริเวณสะโพก ก้าวขาซ้ายออกมา  ค่อยๆ ย่อตัวลง ทำหลังให้ตรง จนเข่าขวาเกือบจะแตะพื้น ยืดตัวขึ้น จากนั้นก้าวขาซ้ายกลับเข้ามาในท่าเริ่มต้น และทำสลับข้างซ้ายขวา ทำทั้งหมดข้างละ 20 ครั้ง จำนวน 3 เซต',
                            "Forward lunge");
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
                        "Back Lunge",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/back_lunge.mp4',
                            '1. เริ่มต้นด้วยการยืนแยกขา ห่างประมาณหัวไหล่ มือเท้าเอว\n2. ก้าวขาขวาไปด้านหลังยาว ๆ จากนั้นย่อตัวลงจนต้นขาทั้งสองข้างขนานกับพื้น หลังเหยียดตรง\n3. กลับสู่กลับสู่ท่าเริ่มต้น นับเป็น 1 ครั้ง ทำสลับข้างไปมา',
                            "Back Lunge");
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
                        "Side Leg Lifts",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Side_Leg_Lifts.mp4',
                            '1. นอนตะแคงข้างไปทางขวา โดยวางศรีษะไว้บนแขนขวา ยกต้นขาซ้ายขึ้น และกลับสู่ท่าเตรียม ทำซ้ำ 12 ครั้ง \n2. สลับข้าง ทำซ้ำอีก 12 ครั้ง',
                            "Side Leg Lifts");
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
                        "Squat",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Squat_test.mp4',
                            '1.ยืนลำตัวตรง แยกเท้าทั้งสองข้างออกกว้างเท่าหัวไหล่ ปลายเท้าชี้ไปด้านข้าง น้ำหนักตัวอยู่บนส้นเท้า  \n2.ผลักสะโพกไปด้านหลัง หย่อนสะโพกลง กางหัวเข่าออก หย่อนสะโพกลงจนต่ำกว่าหัวเข่า \nเกรงสะโพก และขา เพื่อลุกขึ้นมาอยู่ในท่าเตรียม',
                            "Squat");
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
                        "Donkey Kicks",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Donkey_Kicks.mp4',
                            '1. เริ่มต้นด้วยการคุกเข่าบนพื้น วางมือทั้งสองข้างบนพื้นให้เป็นแนวเดียวกับเข่า\n2. ยกขาขวาขึ้น ให้ต้นขาขนานกับพื้น ในระหว่างนั้นให้เกร็งกล้ามเนื้อก้นไปด้วย ค้างไว้ 5 วินาที',
                            "Donkey Kicks");
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
    String exerciseName, // Add this parameter
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoPosture(
          videoPath: videoPath,
          detailText: detailText,
          exerciseName: exerciseName, // Pass the exercise name
        ),
      ),
    );
  }
}
