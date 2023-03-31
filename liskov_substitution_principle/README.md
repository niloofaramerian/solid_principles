# Liskove Substitution Principle (LSP)

<p align="center">
  <img src="https://user-images.githubusercontent.com/69586214/229215706-8ad32c87-4c0e-49e3-b0d2-f2b37cca0684.png" alt="Interface Segregation Principle" width="700">
  <br>
</p>

The third principle of SOLID is the **Liskov Substitution Principle**, abbreviated as **LSP**.

This principle states that :

> child classes should be substitutable and replaceable for their parent class so that if we replace the parent class with one of its children, the code continues to work as expected.

In other words, the child class should preserve all the behavior of its parent class along with any new unique behavior.


<br>


## Example

Suppose we have a MediaPlayer class in our program for playing audio and video.

```dart
class MediaPlayer {
  void playAudio() {
    print('Playing audio ...');
  }

  void playVideo() {
    print('Playing video ...');
  }
}
```

Later on, we decide to extend this class and use WinampMediaPlayer for playback, but the issue is that Winamp only supports audio playback and cannot play video.

```dart
import 'media_player.dart';

class WinampMediaPlayer extends MediaPlayer {
  @override
  void playVideo() {
    throw Exception('Playing video dont support');
  }
}
```

Since the WinampMediaPlayer class is now a subclass of MediaPlayer and has all the attributes of the parent class, we should be able to have any behavior we perform on the parent class also available for its children.

```dart
import 'winamp_medi_player.dart';

void main() {
  final _winampMediaPlayer = WinampMediaPlayer();

  // Play Video, oops it broke the program ...
  _winampMediaPlayer.playVideo();
}
```

When we create an object of Winamp and try to play a video, the program throws an exception. Although the playVideo method in the parent class returns void, in the new (child) class, we throw an exception to tell the user that video playback is not possible. 

In fact, Winamp has changed the behavior and attributes of the parent class, which violates the third principle of SOLID.


<br>

#### ✅ Well, what’s the solution?

We need to remove the ability to play video from the MediaPlayer class and create a separate class for players that play videos.

```dart
class AudioMediaPlayer {
  void playAudio() {
    print('Playing audio ...');
  }
}
```
Now, create a mediaPlayer class for players that support both audio and video.

```dart
import 'audio_media_player.dart';

class MediaPlayer extends AudioMediaPlayer {
  void playVideo() {
    print('Playing video ...');
  }
}
```

This way, the Winamp class inherits from the AudioMediaPlayer class, which only has the ability to play audio and implements its own playAudio method.

```dart
import 'audio_media_player.dart';

class WinampMediaPlayer extends AudioMediaPlayer {
  @override
  void playAudio() {
    print('Playing video ...');
  }
}
```

By doing this, we have respected the LSP and can have any behavior we have with MediaPlayer (the parent class) also available with Winamp (the child class).

