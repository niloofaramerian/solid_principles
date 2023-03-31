# Interface Segregation Principle (ISP)

<p align="center">
  <img src="https://user-images.githubusercontent.com/69586214/229209414-8dfd3eb1-c1e3-4e12-81e9-1b2375cf5276.png" alt="Dependency Inversion Principle" width="700">
  <br>
</p>

The fourth principle of SOLID is the **Interface Segregation Principle**, abbreviated as **ISP**.

This principle states that :

> we should design interfaces in a way that **classes should never be forced to implement methods in interfaces that they don't require.**


<br>


## Example

Suppose we need a player to play both audio and video in our program. Therefore, we create an interface.


```dart
/// MediaPlayer interface
abstract class MediaPlayer {
  void playAudio();
  void playVideo();
}
```

Currently, we are going to use VLC Media Player, which has the ability to play both audio and video, and implements the interface we defined.

```dart
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
```

After a while, we want to use Winamp player, but this player cannot play videos.

```dart
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
```

The playVideo method is not needed in this class.

In fact, our class should not be required to implement a method that it does not need,  which This violates the fourth principle of SOLID.


<br>

#### ✅ Well, what’s the solution?

We must **split the interface into smaller ones**.

In fact, we should create two interfaces, one for audio playback and the other for video playback. This way, Winamp will no longer be forced to implement the playVideo method.

```dart
/// Audio mediaPlayer interface
abstract class AudioMediaPlayer {
  void playAudio();
}
```

```dart
/// Video mediaPlayer interface
abstract class VideoMediaPlayer {
  void playVideo();
}
```

The VlcMediaPlayer class implements both interfaces because it has the ability to play both audio and video.

```dart
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
```

The Winamp class only has the ability to play audio, so it implements the AudioMediaPlayer interface.

```dart
import 'audio_media_player.dart';

class WinampMediaPlayer implements AudioMediaPlayer {
  @override
  void playAudio() {
    print('Playing audio ...');
  }
}
```

By doing this, we have followed the ISP and our class is no longer required to implement a method that it doesn't need.


