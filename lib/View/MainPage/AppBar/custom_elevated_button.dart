import 'package:assignment/View/DetailPage/result_main.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
