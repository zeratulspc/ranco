import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranco/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final hc = Get.put<HomeController>(HomeController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(()=>Text(
              "${hc.time+1}",
              style: Get.textTheme.headline3,
            )),
            Obx(()=>Text(
              hc.chord,
              style: Get.textTheme.headline1,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: hc.setTimer(5),
        tooltip: 'Change',
        child: const Icon(Icons.add),
      ),
    );
  }
}