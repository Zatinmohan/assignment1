import 'package:assignment/Misc/Bindings/main_page_bindings.dart';
import 'package:assignment/View/MainPage/MainPage.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
        name: "/", page: () => const MainPage(), binding: MainPageBindings())
  ];
}
