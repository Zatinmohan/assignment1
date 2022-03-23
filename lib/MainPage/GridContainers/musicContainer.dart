import 'package:assignment/Controllers/main_page_controller.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicBox extends StatelessWidget {
  const MusicBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: containerColor.withOpacity(0.75),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [boxShadow]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Obx(() => Container(
                  width: Get.width * 0.2,
                  height: Get.width * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            Get.find<MainPageController>().albumCover)),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
          ),
          const SizedBox(height: 4.0),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Obx(
                        () => Text(
                          Get.find<MainPageController>().songName,
                          style: TextStyle(
                            color: fontColor,
                            fontSize: Get.width * 0.055,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      )),
                  const SizedBox(height: 3.0),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Obx(
                        () => Text(
                          Get.find<MainPageController>().singerName,
                          style: TextStyle(
                            color: fontColor,
                            fontSize: Get.width * 0.048,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      )),
                  const MusicControlsWidget()
                ],
              )),
        ],
      ),
    );
  }
}

class MusicControlsWidget extends StatelessWidget {
  const MusicControlsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          IconButton(
              onPressed: () => Get.find<MainPageController>().rewind(),
              icon: const Icon(
                Icons.fast_rewind,
                color: fontColor,
              )),
          Obx(
            () => IconButton(
                onPressed: (() => Get.find<MainPageController>().play()),
                icon: Icon(
                  Get.find<MainPageController>().isPlaying.isFalse
                      ? Icons.play_arrow
                      : Icons.pause,
                  color: fontColor,
                )),
          ),
          IconButton(
              onPressed: (() => Get.find<MainPageController>().forward()),
              icon: const Icon(
                Icons.fast_forward,
                color: fontColor,
              )),
        ],
      ),
    ));
  }
}
