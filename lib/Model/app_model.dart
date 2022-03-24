class AppData {
  final String? _title;
  final String? _temp;
  final bool? _switchValue;
  List<String>? _files = List.empty(growable: true);

  AppData(this._title, this._switchValue, [this._temp, this._files]);

  String get boxHeading => _title!;
  String get temperature => _temp!;
  bool? get toogleValue => _switchValue;
  List<String> get getListofFiles => _files!;
}
