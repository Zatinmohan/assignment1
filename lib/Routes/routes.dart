import 'package:assignment/Bindings/main_page_bindings.dart';
import 'package:assignment/MainPage/mainPage.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(name: "/", page: () => MainPage(), binding: MainPageBindings())
  ];
}
