import 'package:assignment/Controllers/main_controller.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemperatureDial extends StatelessWidget {
  const TemperatureDial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.45,
      width: Get.width,
      child: GestureDetector(
        dragStartBehavior: DragStartBehavior.start,
        behavior: HitTestBehavior.translucent,
        onPanUpdate: (details) {
          if (details.delta.dx > 0 && details.delta.dy > 0) {
            if (Get.find<MainPageController>().roomTemperature.value <= 30) {
              Get.find<MainPageController>().roomTemperature.value++;
            }
          } else if (details.delta.dx < 0 && details.delta.dy >= 0) {
            if (Get.find<MainPageController>().roomTemperature.value > 0) {
              Get.find<MainPageController>().roomTemperature.value--;
            }
          }
        },
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black87,
                offset: Offset(-2, -2),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Center(
              child: Obx(
            () => Text(
              "${Get.find<MainPageController>().roomTemperature.value} °C",
              style: TextStyle(
                color: darkFontColor,
                fontSize: Get.width * 0.15,
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
        ),
      ),
    );
  }
}
