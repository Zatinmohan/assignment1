import 'package:assignment/ModelSheetData/modelSheetMain.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpperTitle extends StatelessWidget {
  const UpperTitle({Key? key}) : super(key: key);

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
        ElevatedButton.icon(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: fontColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
                builder: (context) {
                  return const ModelSheetMain();
                });
          },
          icon: const Icon(Icons.add),
          label: const SizedBox.shrink(),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: containerColor.withOpacity(0.65),
            shadowColor: fontColor.withOpacity(0.8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      ],
    );
  }
}
