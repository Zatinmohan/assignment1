import 'package:assignment/ModelSheetData/bottom_data.dart';
import 'package:assignment/ModelSheetData/tempeartureDial.dart';
import 'package:assignment/ModelSheetData/title.dart';
import 'package:flutter/material.dart';

class ModelSheetMain extends StatelessWidget {
  const ModelSheetMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 1,
      expand: false,
      builder: (_, controller) => Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: const [
          ModalTitleWidget(),
          SizedBox(height: 10.0),
          TemperatureDial(),
          SizedBox(height: 10),
          BottomData(),
        ]),
      ),
    );
    ;
  }
}
