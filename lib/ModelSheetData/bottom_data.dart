import 'package:assignment/ModelSheetData/Widgets/customContainers.dart';
import 'package:assignment/ModelSheetData/Widgets/dialerColumn.dart';
import 'package:assignment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomData extends StatelessWidget {
  const BottomData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                    flex: 2,
                    child: DialerColumn(
                        title: "Current Temp", subtitle: "24", subValue: "°C")),
                Flexible(
                    flex: 2,
                    child: DialerColumn(
                        title: "Current Humidity",
                        subtitle: "54",
                        subValue: "%")),
              ]),
          const SizedBox(height: 10.0),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Flexible(
                      flex: 1,
                      child:
                          CustomContainers(title: "Heating", value: "24 °C")),
                  Flexible(
                      flex: 1,
                      child:
                          CustomContainers(title: "Cooling", value: "18 °C")),
                  Flexible(
                      flex: 1,
                      child:
                          CustomContainers(title: "Airwave", value: "20 °C")),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
