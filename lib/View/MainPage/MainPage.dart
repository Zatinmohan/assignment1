import 'package:assignment/Misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AppBar/title_main.dart';
import 'GridContainers/Music/music_main.dart';
import 'GridContainers/Plug/plug_wall_main.dart';
import 'GridContainers/TV/tv_main.dart';
import 'GridContainers/Temperature/temperature_main.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitle(),
                const SizedBox(height: 40.0),
                Text("Living Room",
                    style: TextStyle(
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Get.width * 0.07,
                    )),
                const SizedBox(height: 10.0),
                Expanded(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
