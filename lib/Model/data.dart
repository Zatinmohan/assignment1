import 'package:flutter/cupertino.dart';

class AppData {
  String? _title;
  String? _temp;
  bool? _switchValue;
  List<String>? _files = List.empty(growable: true);

  AppData(this._title, this._switchValue, [this._temp, this._files]);

  String get boxHeading => _title!;
  String get temperature => _temp!;
  bool? get toogleValue => _switchValue;
  List<String> get getListofFiles => _files!;
}
