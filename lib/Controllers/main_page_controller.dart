import 'package:assignment/Model/data.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  RxList<AppData> data = RxList<AppData>();
  RxList<bool> switchData = RxList<bool>();
  RxInt roomTemperature = 24.obs;
  @override
  void onInit() {
    List<String> items = ["Playstation", "HomePod", "MacBook Pro"];
    data.add(AppData("Room Temperature", true, "25"));
    data.add(AppData("Plug Wall", false, null, items));
    data.add(AppData("Music", null, null, null));
    data.add(AppData("Smart TV", false, "Samsung AX54", null));

    for (int i = 0; i < data.length; i++) {
      switchData.add(data[i].toogleValue ?? false);
    }
    super.onInit();
  }

  String fetchTitle(int v) => data[v].boxHeading;

  fetchSubTitle(int v) {
    switch (v) {
      case 0:
        return data[v].temperature;
      case 1:
        return data[v].getListofFiles;
      default:
        return data[v].temperature;
    }
  }

  int get listLength =>
      data[1].getListofFiles.length > 4 ? 4 : data[1].getListofFiles.length;

  void changeSwitchData(int index, bool value) {
    switchData[index] = value;
  }

  //Container Logic using Switch
  bool isYes(int index) => switchData[index];
}
