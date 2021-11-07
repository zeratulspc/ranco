import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranco/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final hc = Get.put<HomeController>(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx((){
              double timerValue = (hc.targetTime-hc.time)/hc.targetTime;
              return Stack(
                children: [
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text( // timerValue.isNaN?0:timerValue
                          "${timerValue.isNaN?'':hc.time+1}",
                          style: TextStyle(
                              fontSize: 24,
                              color:Get.theme.primaryColorLight
                          ),
                        ),
                      )
                  ),
                  CircularProgressIndicator(
                    value: timerValue.isNaN?0:timerValue,
                  ),
                ],
              );
            }),
            Obx(()=>Text(
              hc.chord,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>hc.openSettingSheet(),
        tooltip: '설정',
        child: const Icon(Icons.settings),
      ),
    );
  }
}