import 'media_player.dart';

class WinampMediaPlayer implements MediaPlayer {
  @override
  void playAudio() {
    print('Playing audio ...');
  }

  @override
  void playVideo() {
    throw Exception('Playing video dont support');
  }
}
