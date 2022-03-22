import 'package:assignment/Controllers/main_page_controller.dart';
import 'package:get/get.dart';

class MainPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<MainPageController>(MainPageController());
  }
}
