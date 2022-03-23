import 'dart:typed_data';

import 'package:assignment/Model/data.dart';
import 'package:assignment/Model/musicLibrary.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  RxList<AppData> data = RxList<AppData>();
  RxList<bool> switchData = RxList<bool>();
  RxInt roomTemperature = 24.obs;

  Rx<AudioPlayer> audioPlayer = AudioPlayer().obs;
  RxList<MusicLibrary> musicData = RxList<MusicLibrary>();

  RxBool isPlaying = false.obs;
  RxInt currentIndex = 0.obs;
  @override
  void onInit() {
    _addData();
    super.onInit();
  }

  //Adding all the static data
  _addData() {
    musicData.add(MusicLibrary("Stay", "Post Malone", "assets/audio/stay.jpg",
        "assets/audio/stay.mp3"));
    musicData.add(MusicLibrary("Just The Two Of Us", "Grover Washington",
        "assets/audio/twoofus.jpg", "assets/audio/twoofus.mp3"));

    List<String> items = ["Playstation", "HomePod", "MacBook Pro"];
    data.add(AppData("Room Temperature", true, "25"));
    data.add(AppData("Plug Wall", false, null, items));
    data.add(AppData("Music", null, null, null));
    data.add(AppData("Smart TV", false, "Samsung AX54", null));

    for (int i = 0; i < data.length; i++) {
      switchData.add(data[i].toogleValue ?? false);
    }
  }

  //Fetch Data
  String fetchTitle(int v) => data[v].boxHeading;

  //Fetch different data for different containers
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

  //Fetch the length of lists
  int get listLength =>
      data[1].getListofFiles.length > 4 ? 4 : data[1].getListofFiles.length;

  void changeSwitchData(int index, bool value) {
    switchData[index] = value;
  }

  //Container Logic using Switch
  bool isYes(int index) => switchData[index];

  //Login behind playing music
  play() async {
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
      Get.snackbar("Can't Play Music", "Try after some time!");
    }
  }

  forward() async {
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
      } catch (e) {}
    }
  }

  rewind() async {
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
        Get.snackbar("Error!", "Can't go back to the song");
      }
    }
  }

  //Fetching Music Details
  String get albumCover => musicData[currentIndex.value].imageCover;
  String get singerName => musicData[currentIndex.value].singerName;
  String get songName => musicData[currentIndex.value].songName;
}
