[#]: subject: (SonoBus: An Open Source Peer-to-Peer Audio Streaming App with Cross-Platform Support)
[#]: via: (https://itsfoss.com/sonobus/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

SonoBus: An Open Source Peer-to-Peer Audio Streaming App with Cross-Platform Support
======

_**Brief: An interesting open-source peer-to-peer audio streaming app which offers a simple user interface with powerful functionalities.**_

### SonoBus: Cross-Platform Audio Streaming App

Audio streaming services are extremely popular nowadays when listening to music. However, a local collection is still a useful way that does not require to be constantly connected to the Internet.

Even though a streaming music service is convenient, you do not really own the music. So, if there is a licensing issue, the platform might remove your favorite music, and you cannot do anything about it.

And, with a local music collection, you do not have that problem. But, how do you stream your local music over a network of devices or share with a group?

![][1]

SonoBus can be a solution to the problem. Not just limited to music, but just any audio like practicing music with a group of friends remotely or collaborating to make music, why not?

Let us take a look at what it offers.

### Features of SonoBus

![][2]

SonoBus is relatively simple to use, but the features offered can be overwhelming. So, before proceeding, you might want to know what it lets you do to get a head start:

  * Ability to connect to multiple users
  * Create a group with optional password
  * Share audio input from your microphone
  * Share audio stream from a file
  * Mono/Stereo support
  * Playback to the group
  * Record audio from everyone
  * Ability to mute individual users or everyone
  * Can be connected via the Internet or the local network
  * Metronome support for collaborating to make music or remote practice sessions
  * High-quality audio support up to 256 Kbps
  * Input mixer
  * Pan support
  * Useful effects supported (Noise Gate, Compressor, and EQ)
  * Works with JACK and ALSA
  * Cross-platform support (Windows, macOS, Android, iOS, and Linux)



While I tried to mention all the essential features, you get so much control to adjust the volume, quality, latency, and how the audio sounds with the help of effects.

![][3]

The best thing about it is **cross-platform support**, which makes it an interesting choice for any group of users no matter why you want to stream audio.

### Installing SonoBus in Linux

You can easily install the [Snap package][4] or [Flatpak package][5] no matter what Linux distribution you use. If you do not want to use them, you can add the official repository manually to get it installed:

```
echo "deb http://pkg.sonobus.net/apt stable main" | sudo tee /etc/apt/sources.list.d/sonobus.list

sudo wget -O /etc/apt/trusted.gpg.d/sonobus.gpg https://pkg.sonobus.net/apt/keyring.gpg

sudo apt update && sudo apt install sonobus
```

You can also download it for your preferred platform through its official website.

[SonoBus][6]

### Closing Thoughts

SonoBus is an impressive audio streaming application with plenty of potential use-cases, but it has its share of issues and may not be the perfect solution for everyone.

For instance, I noticed that the desktop app takes a significant amount of system resources, so that could be a problem for older systems.

Also, the Android app on Play Store is still in early access (beta). It works as expected for my quick test session, but I haven’t used it for a long time – so there could be expected hiccups when relying on it for cross-platform sessions.

In either case, it works quite well with plenty of features for every type of use-case. Do give it a try if you haven’t.

--------------------------------------------------------------------------------

via: https://itsfoss.com/sonobus/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/sonobus-screenshot.png?resize=800%2C605&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/sonus-screenshot-1.png?resize=800%2C619&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/sonobus-official.png?resize=800%2C545&ssl=1
[4]: https://snapcraft.io/sonobus
[5]: https://flathub.org/apps/details/net.sonobus.SonoBus
[6]: https://sonobus.net/
