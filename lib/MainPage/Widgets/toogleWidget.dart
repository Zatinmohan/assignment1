import 'package:assignment/Controllers/main_page_controller.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToogleWidget extends StatelessWidget {
  final int containerIndex;
  const ToogleWidget({Key? key, required this.containerIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return containerIndex != 2
        ? Obx(() => Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Transform.scale(
                  scale: 2.0,
                  child: Switch(
                    activeColor: selectedColor,
                    value: Get.find<MainPageController>()
                        .switchData[containerIndex],
                    onChanged: (bool value) => Get.find<MainPageController>()
                        .changeSwitchData(containerIndex, value),
                  ),
                ),
              ),
            ))
        : const SizedBox.shrink();
  }
}
