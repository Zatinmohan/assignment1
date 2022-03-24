import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_toggle_button.dart';

class ModalTitleWidget extends StatelessWidget {
  const ModalTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: Get.width,
      height: Get.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Living Room",
                style: TextStyle(
                  color: darkFontColor,
                  fontSize: Get.width * 0.08,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                "Home Temperature",
                style: TextStyle(
                  color: darkFontColor.withOpacity(0.6),
                  fontSize: Get.width * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const BottomSheetToogleButton(),
        ],
      ),
    );
  }
}
