import 'media_player.dart';

class VlcMediaPlayer implements MediaPlayer {
  @override
  void playAudio() {
    print('Playing audio ...');
  }

  @override
  void playVideo() {
    print('Playing video ...');
  }
}
