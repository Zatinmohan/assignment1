import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainers extends StatelessWidget {
  final title, value, icons;
  const CustomContainers(
      {Key? key, required this.title, required this.value, this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: containerColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: darkFontColor,
              fontSize: Get.width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            value,
            style: TextStyle(
              color: darkFontColor,
              fontSize: Get.width * 0.07,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
