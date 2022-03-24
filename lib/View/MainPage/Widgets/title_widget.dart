import 'package:assignment/Controllers/main_controller.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final int index;
  const TitleWidget({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Get.find<MainPageController>().isYes(index)
            ? darkFontColor
            : fontColor,
        fontSize: Get.width * 0.055,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
