import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texos/controller/api_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ctrl = Get.find<APiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: ctrl.selectedpage,
            physics: const NeverScrollableScrollPhysics(),
            controller: ctrl.pagectrl,
            itemCount: ctrl.data.length,
            itemBuilder: (context, index) => SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ctrl.data[index].question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: ctrl.data[index].answer
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              ctrl.name(e, ctrl.data[index].correctAnswer);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: Text(e)),
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 80,
            child: Row(
              children: List.generate(
                ctrl.data.length,
                (index) => Obx(
                  () => Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: ctrl.selectedpage.value == index
                            ? Colors.red
                            : Colors.grey,
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
