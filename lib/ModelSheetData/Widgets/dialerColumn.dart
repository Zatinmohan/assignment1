import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialerColumn extends StatelessWidget {
  final String title, subtitle, subValue;
  const DialerColumn(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.subValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: darkFontColor.withOpacity(0.5),
              fontWeight: FontWeight.w700,
              fontSize: Get.width * 0.055,
            ),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: subtitle,
                style: TextStyle(
                  color: darkFontColor,
                  fontWeight: FontWeight.w500,
                  fontSize: Get.width * 0.07,
                )),
            TextSpan(
                text: subValue,
                style: TextStyle(
                  color: darkFontColor,
                  fontWeight: FontWeight.w400,
                  fontSize: Get.width * 0.055,
                ))
          ]))
        ],
      ),
    );
  }
}
