import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/infoposture.dart';

class ShoulderScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  ShoulderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ไหล่'),
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
                        "Dumbbell Overhead Press",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_Overhead_Press.mp4',
                            'เตรียมดัมเบลและเริ่มต้นให้นั่งเก้าอี้หรือยืนแยกขาให้มีความกว้างระดับหัวไหล่ มือถือดัมเบล โดยยกดัมเบลขึ้นให้อยู่ระดับเดียวกับหูและหันฝ่ามือไปด้านหน้า จากนั้นให้เราเกร็งกล้ามเนื้อหัวไหล่ ยกดัมเบลขึ้นตรงๆ จนสุดแขน แนวของหลังต้องตรงตลอด จากนั้นให้เราค่อยๆลดระดับดัมเบลลงเพื่อกลับสู่ท่าเริ่มต้น',
                            "Dumbbell Overhead Press");
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
                        "Dumbbell Lateral Raise",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_Lateral_Raise.mp4',
                            'ยืนแยกขาให้มีความกว้างระดับเดียวกับหัวไหล่ ถือดัมเบลไว้ข้างลำตัว ให้หันฝ่ามือเข้าหาลำตัว จากนั้นให้เราแอ่นหน้าอก และเกร็งกล้ามเนื้อหัวไหล่เพื่อยกดัมเบลทั้ง 2 ข้าง ขึ้นมาด้านข้างของลำตัว จนแขนเป็นแนวเดียวกับพื้น จากนั้นให้เราค่อยลดระดับดัมเบลลง เพื่อกลับสู่ท่าเริ่มต้น',
                            "Dumbbell Lateral Raise");
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
                        "Dumbbell Front Raise",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_Front_Raise.mp4',
                            'ยืนแยกขาให้มีความกว้างระดับเดียวกับหัวไหล่ ถือดัมเบลทั้ง 2 ข้างไว้ตรงหน้าต้นขา หันฝ่ามือเข้าหาลำตัว จากนั้นให้เราแอ่นหน้าอกและเกร็งกล้ามเนื้อหัวไหล่เพื่อยกดัมเบลทั้ง 2 ข้าง ขึ้นมาด้านหน้าของลำตัวจนแขนเป็นแนวเดียวกับพื้น จากนั้นให้เราค่อยๆลดระดับดัมเบลลง เพื่อกลับสู่ท่าเริ่มต้น',
                            "Dumbbell Front Raise");
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
                        "Dumbbell High Pull",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black), // ขนาดและสีของตัวอักษร
                      ),
                      onPressed: () {
                        // การกระทำเมื่อกดปุ่ม
                        _navigateToInfoPosture(
                            context,
                            'assets/video/Dumbbell_High_Pull.mp4',
                            'ยืนแยกขาให้มีความกว้างระดับเดียวกับหัวไหล่ ถือดัมเบลล์ไว้ด้านหน้าต้นขา ย่อตัวและสะโพกเล็กน้อย ให้น้ำหนักอยู่เหนือหัวเข่า แนวของหลังต้องตรงไม่โค้งงอ จากนั้นยกดัมเบลขึ้นให้กว้างหนึ่งศอก ตั้งตรงระดับหัวไหล่ และค่อยๆลดระดับดัมเบลลง เพื่อกลับสู่ท่าเริ่มต้น',
                            "Dumbbell High Pull");
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
