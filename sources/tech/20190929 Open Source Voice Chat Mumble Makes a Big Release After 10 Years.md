[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open Source Voice Chat Mumble Makes a Big Release After 10 Years)
[#]: via: (https://itsfoss.com/mumble-voice-chat/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Open Source Voice Chat Mumble Makes a Big Release After 10 Years
======

The greatest power of the Internet is its ability to connect people anywhere in the world. Voice chat applications are just one category of tools uniting us. Recently, one of the biggest open-source voice chat apps made a new release, 10 years after its previous release.

### Mumble: Open Source, Low Latency, High Quality Voice Chat

![Mumble][1]

[Mumble][2] is a “free, open source, low latency, high quality voice chat application”. It was originally created to be used by gamers, but it is also used to record podcasts. Several [Linux podcasts][3] use Mumble to record hosts located at different places in the world, including Late Nite Linux. To give you an idea of how powerful Mumble is, it has been used to connect “Eve Online players with huge communities of over 100 simultaneous voice participants”.

Here are some of the features that make Mumble interesting:

  * Low-latency (ideal for gamers)
  * Connections always encrypted and secured
  * Connect with friends across servers
  * Extensive user permission system
  * Extendable through Ice and GRPC protocols
  * Automatable administration through Ice middleware
  * Low resource cost for hosting
  * Free choice between official and third-party server software
  * Provide users with channel viewer data (CVP) without giving control away



It’s a powerful software with a lot of features. If you are new to it and want to start using it, I suggest [going through its documentation][4].

### What’s New in Mumble 1.3.0?

![Mumble 1.30 Interface with Lite Theme][5]

The team behind Mumble released [version 1.3.0][6] in early August. This is the first major release in ten years and it contains over 3,000 changes. Here are just a few of the new features in Mumble 1.3.0:

  * UI redesign
  * New lite and dark themes
  * Individual user volume adjustment
  * New bindable shortcut for changing transmission modes
  * Quickly filter channels
  * Multichannel recordings are synchronous even after several hours
  * PulseAudio monitor devices can be used as input devices
  * An optional clock (current time) in the overlay
  * Improved user management, including searchable ban list
  * Added support for systemd
  * Option to disable public server list
  * Lower volume of other users when “Priority Speaker” talks
  * New interface allows renaming users as well as (batch) deletions
  * Mumble client can be controlled through SocketRPC
  * Support for Logitech G-keys has been added



### Installing Mumble on Linux

![Mumble 1.30 Interface Dark Theme][7]

The Mumble team has installers available for Linux, Windows (32 and 64 bit), and macOS. You can find and download them from the [project’s website][8]. You can also browse its [source code on GitHub][9].

They have a [PPA available for Ubuntu][10]. Which means you can easily install it on Ubuntu and Ubuntu-based distributions like Linux Mint, elementary OS. To install, just enter these commands, one by one, in the terminal:

```
sudo add-apt-repository ppa:mumble/release
sudo apt update
sudo apt install mumble
```

The Snap community also created a [snap app for Mumble][11]. This makes installing Mumble easier in any Linux distribution that supports Snap. You can install it with the following command:

```
sudo snap install mumble
```

There are also _third-party clients_ for Android and iOS on the download page.

[Download Mumble for other platforms][8]

**Final Thoughts**

I have never used Mumble or any other voice chat app. I just never had the need. That being said, I’m glad that there is a powerful FOSS option available and so widely used.

Have you ever used Mumble? What is your favorite voice chat app? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][12].

--------------------------------------------------------------------------------

via: https://itsfoss.com/mumble-voice-chat/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/mumble-voice-chat-logo.png?ssl=1
[2]: https://www.mumble.info/
[3]: https://itsfoss.com/linux-podcasts/
[4]: https://wiki.mumble.info/wiki/Main_Page
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/mumble-1.30-interface.jpg?ssl=1
[6]: https://www.mumble.info/blog/mumble-1.3.0-release-announcement/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/mumble-1.30-interface-1.png?resize=800%2C529&ssl=1
[8]: https://www.mumble.info/downloads/
[9]: https://github.com/mumble-voip/mumble
[10]: https://itsfoss.com/ppa-guide/
[11]: https://snapcraft.io/mumble
[12]: https://reddit.com/r/linuxusersgroup
