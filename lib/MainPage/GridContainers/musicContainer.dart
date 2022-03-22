import 'package:assignment/Controllers/main_page_controller.dart';
import 'package:assignment/MainPage/Widgets/titleWidget.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicBox extends StatelessWidget {
  const MusicBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: containerColor.withOpacity(0.75),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
                title: Get.find<MainPageController>().fetchTitle(2), index: 2),
          ],
        ));
  }
}
