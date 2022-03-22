import 'package:assignment/Controllers/main_page_controller.dart';
import 'package:assignment/MainPage/Widgets/titleWidget.dart';
import 'package:assignment/MainPage/Widgets/toogleWidget.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomTemp extends StatelessWidget {
  const RoomTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Get.find<MainPageController>().isYes(0)
              ? fontColor
              : containerColor.withOpacity(0.75),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
                title: Get.find<MainPageController>().fetchTitle(0), index: 0),
            const SizedBox(height: 10.0),
            const TemperatueWidget(),
            const ToogleWidget(containerIndex: 0),
          ],
        )));
  }
}

class TemperatueWidget extends StatelessWidget {
  const TemperatueWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => RichText(
            text: TextSpan(children: [
          TextSpan(
            text: Get.find<MainPageController>().fetchSubTitle(0),
            style: TextStyle(
              color: Get.find<MainPageController>().isYes(0)
                  ? darkFontColor
                  : fontColor,
              fontSize: Get.width * 0.12,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: " °C",
            style: TextStyle(
              color: Get.find<MainPageController>().isYes(0)
                  ? darkFontColor
                  : fontColor,
              fontSize: Get.width * 0.08,
              fontWeight: FontWeight.w400,
            ),
          ),
        ])));
  }
}
