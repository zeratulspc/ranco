import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranco/controller/home_controller.dart';

class SettingSheet extends StatelessWidget {
  SettingSheet({Key? key}) : super(key: key);

  final hc = Get.find<HomeController>();
  final index = 0.obs;
  final isFlat = false.obs;
  final isSeventh = false.obs;

  @override
  Widget build(BuildContext context) {
    index.value = hc.targetTime!=0?hc.targetTime-1:0;
    isFlat.value = hc.flat;
    isSeventh.value = hc.seventh;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "설정",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: Get.width,
                    child: Swiper(
                      itemCount: 100,
                      viewportFraction: 0.5,
                      scale: 0.2,
                      index: index.value,
                      onIndexChanged: (v)=>index.value=v,
                      itemBuilder: (context, i){
                        return Text(
                          "${i+1}초",
                          style: TextStyle(
                            fontSize: 32,
                            color: Get.theme.primaryColor
                          ),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(()=>CheckboxListTile(
                          value: isFlat.value,
                          onChanged: (v)=>isFlat.value=v??false,
                          title: const Text(
                              "♭ 허용"
                          ),
                        )),
                        Obx(()=>CheckboxListTile(
                          value: isSeventh.value,
                          onChanged: (v)=>isSeventh.value=v??false,
                          title: const Text(
                              "7th 코드"
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: (){
                  hc.flat = isFlat.value;
                  hc.seventh = isSeventh.value;
                  hc.setTimer(index.value+1);
                  Get.back();
                },
                child: SizedBox(
                  width: Get.width,
                  child: const Text(
                    "적용하기",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}