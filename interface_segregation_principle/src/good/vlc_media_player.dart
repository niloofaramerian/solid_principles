import 'audio_media_player.dart';
import 'video_media_player.dart';

class VlcMediaPlayer implements AudioMediaPlayer, VideoMediaPlayer {
  @override
  void playAudio() {
    print('Playing audio ...');
  }

  @override
  void playVideo() {
    print('Playing video ...');
  }
}
