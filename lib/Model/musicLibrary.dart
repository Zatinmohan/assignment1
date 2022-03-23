class MusicLibrary {
  final String _name;
  final String _singer;
  final String _albumCover;
  final String _audioPath;

  MusicLibrary(this._name, this._singer, this._albumCover, this._audioPath);

  String get songName => _name;
  String get singerName => _singer;
  String get imageCover => _albumCover;
  String get audioPath => _audioPath;
}
