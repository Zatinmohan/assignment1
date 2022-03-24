import 'package:assignment/Controllers/main_controller.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetToogleButton extends StatelessWidget {
  const BottomSheetToogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Switch(
        activeColor: selectedColor,
        value: Get.find<MainPageController>().toggleSwitchData[0],
        onChanged: (bool value) =>
            Get.find<MainPageController>().changeSwitchData(0, value),
      ),
    );
  }
}
