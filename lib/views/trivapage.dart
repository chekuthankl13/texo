import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:texos/controller/api_controller.dart';
import 'package:texos/views/homepage.dart';

class TrivaPage extends StatelessWidget {
  TrivaPage({Key? key}) : super(key: key);
  final ctrl = Get.put(APiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'TRIVA APP',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                onPressed: () {
                  Get.off(() => HomePage());
                },
                icon: const Icon(Icons.quiz),
                label: const Text(
                  'Take quiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
