import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_elevated_button.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(
                color: fontColor,
                fontSize: Get.width * 0.08,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Chris Cooper",
              style: TextStyle(
                color: fontColor,
                fontWeight: FontWeight.w600,
                fontSize: Get.width * 0.1,
              ),
            )
          ],
        ),
        const CustomElevatedButton(),
      ],
    );
  }
}
