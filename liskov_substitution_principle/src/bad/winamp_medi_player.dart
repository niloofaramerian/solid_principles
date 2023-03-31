import 'media_player.dart';

class WinampMediaPlayer extends MediaPlayer {
  @override
  void playVideo() {
    throw Exception('Playing video dont support');
  }
}
