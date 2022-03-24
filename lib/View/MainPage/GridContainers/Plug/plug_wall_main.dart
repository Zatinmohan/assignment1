import 'package:assignment/Controllers/main_controller.dart';
import 'package:assignment/View/MainPage/Widgets/title_widget.dart';
import 'package:assignment/View/MainPage/Widgets/toggle_widget.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlugWall extends StatelessWidget {
  const PlugWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Get.find<MainPageController>().isYes(1)
                ? fontColor
                : containerColor.withOpacity(0.75),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [boxShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(
                  title: Get.find<MainPageController>().fetchTitle(1),
                  index: 1),
              const SizedBox(height: 5.0),
              const WallList(),
              const ToggleWidget(containerIndex: 1),
            ],
          ));
    });
  }
}

class WallList extends StatelessWidget {
  const WallList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: Get.width * 0.25,
          child: ListView.builder(
            itemCount: Get.find<MainPageController>().listLength,
            itemBuilder: (BuildContext context, int index) {
              List<String> items =
                  Get.find<MainPageController>().fetchSubTitle(1);
              return Container(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "• ${items[index]}",
                  style: TextStyle(
                    color: Get.find<MainPageController>().isYes(1)
                        ? fontColor
                        : darkFontColor,
                    fontWeight: FontWeight.w400,
                    fontSize: Get.width * 0.045,
                  ),
                  overflow: TextOverflow.fade,
                ),
              );
            },
          ),
        ));
  }
}
