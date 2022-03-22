import 'package:assignment/MainPage/GridContainers/TvBox.dart';
import 'package:assignment/MainPage/GridContainers/musicContainer.dart';
import 'package:assignment/MainPage/GridContainers/plugWall.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GridContainers/RoomTemperature.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: Get.width / (Get.height / 1.5),
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,
        ),
        children: const [
          RoomTemp(),
          PlugWall(),
          MusicBox(),
          TVContainer(),
        ],
      ),
    );
  }
}
