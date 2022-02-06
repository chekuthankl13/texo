import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texos/main.dart';
import 'package:texos/models/trivamodel.dart';
import 'package:texos/services/http_services.dart';
import 'package:texos/views/homepage.dart';
import 'package:texos/views/scorepage.dart';

class APiController extends GetxController {
  // var data = Rx(Data);
  var data = <Result>[].obs;
  var mark = 0.obs;
  RxBool clr = false.obs;
  var selectedpage = 0.obs;

  var pagectrl = PageController();

  @override
  void onReady() {
    fetch();
    super.onReady();
  }

  void fetch() async {
    Data? d = await HttpServices().fetchApi();
    if (d != null) {
      data.value = d.results;
    }
  }

  void name(String e, d) {
    if (e == d) {
      clr.value = true;
      mark.value = mark.value + 10;
      forward();
      print(mark.value.toString());
    } else {
      forward();
    }
  }

  forward() {
    if (islastpage) {
      Get.offAll(() => ScorePage());
    } else {
      pagectrl.nextPage(duration: 300.milliseconds, curve: Curves.bounceIn);
    }
  }

  bool get islastpage => selectedpage.value == data.length - 1;

  void retakequiz() {
    mark.value = 0;
    selectedpage.value = 0;
    fetch();
    Get.offAll(() => HomePage());
  }
}
