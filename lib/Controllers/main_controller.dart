import 'dart:typed_data';
import 'package:assignment/Model/app_model.dart';
import 'package:assignment/Model/music_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  RxList<AppData> appData = RxList<AppData>();
  RxList<bool> toggleSwitchData = RxList<bool>();
  RxInt roomTemperature = 24.obs;

  Rx<AudioPlayer> audioPlayer = AudioPlayer().obs;
  RxList<MusicLibrary> musicData = RxList<MusicLibrary>();

  RxBool isPlaying = false.obs; //For Music
  RxInt currentIndex = 0.obs; //Music Library

  @override
  void onInit() {
    _addData();
    super.onInit();
  }

  //Adding all the static data
  void _addData() {
    //Music Data
    musicData.add(MusicLibrary("Stay", "Post Malone", "assets/audio/stay.jpg",
        "assets/audio/stay.mp3"));
    musicData.add(MusicLibrary("Just The Two Of Us", "Grover Washington",
        "assets/audio/twoofus.jpg", "assets/audio/twoofus.mp3"));

    //Item List data for WallPlug Container
    List<String> items = ["Playstation", "HomePod", "MacBook Pro"];

    //Other Container Data used in Grid View
    appData.add(AppData("Room Temperature", true, "25"));
    appData.add(AppData("Plug Wall", false, null, items));
    appData.add(AppData("Music", null, null, null));
    appData.add(AppData("Smart TV", false, "Samsung AX54", null));

    //Toggle Switch Data
    for (int i = 0; i < appData.length; i++) {
      toggleSwitchData.add(appData[i].toogleValue ?? false);
    }
  }

  //Fetch Data
  String fetchTitle(int v) => appData[v].boxHeading;

  //Fetch different data for different containers
  dynamic fetchSubTitle(int v) {
    switch (v) {
      case 0:
        return appData[v].temperature;
      case 1:
        return appData[v].getListofFiles;
      default:
        return appData[v].temperature;
    }
  }

  //Fetch the length of lists
  int get listLength => appData[1].getListofFiles.length > 4
      ? 4
      : appData[1].getListofFiles.length;

  void changeSwitchData(int index, bool value) {
    toggleSwitchData[index] = value;
  }

  //Container Logic using Switch
  bool isYes(int index) => toggleSwitchData[index];

  //Login behind playing music
  void play() async {
    try {
      ByteData data =
          await rootBundle.load(musicData[currentIndex.value].audioPath);
      Uint8List audiobytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      if (isPlaying.isFalse) {
        await audioPlayer.value.playBytes(audiobytes);
        isPlaying.value = !isPlaying.value;
      } else {
        await audioPlayer.value.pause();
        isPlaying.value = !isPlaying.value;
      }
    } catch (e) {
      showErrorMessage();
    }
  }

  //Music Forward Logic
  void forward() async {
    if (isPlaying.isTrue) {
      currentIndex.value = currentIndex.value + 1;
      if (currentIndex.value > 1) currentIndex.value = 1;
      try {
        ByteData data =
            await rootBundle.load(musicData[currentIndex.value].audioPath);
        Uint8List audiobytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await audioPlayer.value
            .stop()
            .then((value) => audioPlayer.value.playBytes(audiobytes));
      } catch (e) {
        showErrorMessage();
      }
    }
  }

  //Music Rewind Logic
  void rewind() async {
    if (isPlaying.isTrue) {
      currentIndex.value = currentIndex.value - 1;
      if (currentIndex.value < 0) currentIndex.value = 0;
      try {
        ByteData data =
            await rootBundle.load(musicData[currentIndex.value].audioPath);
        Uint8List audiobytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await audioPlayer.value
            .stop()
            .then((value) => audioPlayer.value.playBytes(audiobytes));
      } catch (e) {
        showErrorMessage();
      }
    }
  }

  //Common Error Message
  void showErrorMessage() {
    Get.snackbar("Can't Play Music", "Try after some time!",
        snackPosition: SnackPosition.BOTTOM);
  }

  //Fetching Music Details
  String get albumCover => musicData[currentIndex.value].imageCover;
  String get singerName => musicData[currentIndex.value].singerName;
  String get songName => musicData[currentIndex.value].songName;
}
