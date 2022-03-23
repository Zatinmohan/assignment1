import 'package:assignment/Controllers/main_page_controller.dart';
import 'package:assignment/MainPage/Widgets/titleWidget.dart';
import 'package:assignment/MainPage/Widgets/toogleWidget.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TVContainer extends StatelessWidget {
  const TVContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Get.find<MainPageController>().isYes(3)
                ? fontColor
                : containerColor.withOpacity(0.75),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [boxShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(
                  title: Get.find<MainPageController>().fetchTitle(3),
                  index: 3),
              const SizedBox(height: 10.0),
              Text(Get.find<MainPageController>().fetchSubTitle(3),
                  style: TextStyle(
                    color: Get.find<MainPageController>().isYes(3)
                        ? darkFontColor
                        : fontColor,
                    fontWeight: FontWeight.w400,
                    fontSize: Get.width * 0.05,
                  )),
              const ToogleWidget(containerIndex: 3),
            ],
          ),
        ));
  }
}
