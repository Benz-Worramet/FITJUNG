import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen>
    with WidgetsBindingObserver {
  int exerciseTime = 0;
  int legCount = 0;
  int armCount = 0;
  int shoulderCount = 0;
  int breastCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    loadTotalExerciseTime();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void loadTotalExerciseTime() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'default_user';
    final firestoreInstance = FirebaseFirestore.instance;
    var userDoc = firestoreInstance.collection('users').doc(userId);

    DocumentSnapshot snapshot = await userDoc.get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    setState(() {
      exerciseTime =
          data.containsKey('exercise_time') ? data['exercise_time'] : 0;
      legCount = data.containsKey('leg') ? data['leg'] : 0;
      armCount = data.containsKey('arm') ? data['arm'] : 0;
      shoulderCount = data.containsKey('shoulder') ? data['shoulder'] : 0;
      breastCount = data.containsKey('breast') ? data['breast'] : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double minutes = exerciseTime / 60;
    String formattedTime = '${minutes.toStringAsFixed(2)} Minutes';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistic'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      Colors.black, // สีดำสำหรับข้อความ "Total Exercise Time"
                ),
                children: [
                  const TextSpan(text: 'Total Exercise Time: '),
                  TextSpan(
                    text: formattedTime,
                    style: const TextStyle(
                      color: Colors.red, // สีแดงสำหรับจำนวนเวลา
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            StatisticItem(title: 'Leg', count: legCount),
            StatisticItem(title: 'Arm', count: armCount),
            StatisticItem(title: 'Shoulder', count: shoulderCount),
            StatisticItem(title: 'Breast', count: breastCount),
            PieChartWidget(
              legCount: legCount,
              armCount: armCount,
              shoulderCount: shoulderCount,
              breastCount: breastCount,
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticItem extends StatelessWidget {
  final String title;
  final int count;

  const StatisticItem({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            '$count',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  final int legCount;
  final int armCount;
  final int shoulderCount;
  final int breastCount;

  const PieChartWidget({
    Key? key,
    required this.legCount,
    required this.armCount,
    required this.shoulderCount,
    required this.breastCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Colors.blue,
              value: legCount.toDouble(),
              title: 'Leg',
              radius: 70,
            ),
            PieChartSectionData(
              color: Colors.green,
              value: armCount.toDouble(),
              title: 'Arm',
              radius: 70,
            ),
            PieChartSectionData(
              color: Colors.yellow,
              value: shoulderCount.toDouble(),
              title: 'Shoulder',
              radius: 70,
            ),
            PieChartSectionData(
              color: Colors.pink,
              value: breastCount.toDouble(),
              title: 'Breast',
              radius: 70,
            ),
          ],
        ),
      ),
    );
  }
}
