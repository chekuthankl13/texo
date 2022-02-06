import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texos/controller/api_controller.dart';

class ScorePage extends StatelessWidget {
  ScorePage({Key? key}) : super(key: key);

  final get = Get.find<APiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Score',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(get.mark.toString() + '/ 100',
                style: const TextStyle(fontSize: 50, color: Colors.grey)),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
                onPressed: get.retakequiz,
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                icon: const Icon(Icons.timer),
                label: const Text(
                  'Retake Quiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
