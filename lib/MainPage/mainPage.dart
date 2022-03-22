import 'package:assignment/MainPage/content.dart';
import 'package:assignment/MainPage/upperTitle.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                const UpperTitle(),
                const SizedBox(height: 40.0),
                Text("Living Room",
                    style: TextStyle(
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Get.width * 0.07,
                    )),
                const SizedBox(height: 10.0),
                const MainContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
