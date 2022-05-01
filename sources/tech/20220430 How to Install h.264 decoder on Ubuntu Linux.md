[#]: subject: "How to Install h.264 decoder on Ubuntu Linux"
[#]: via: "https://itsfoss.com/install-h-264-decoder-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install h.264 decoder on Ubuntu Linux
======

When you start using a [fresh installed Ubuntu system][1] and try to open an MP4 file to play videos, it may show you an error that reads:

_**H.264 (High Profile) decoder is required to play the file, but is not installed.**_

![Ubuntu’s default video player shows error while playing certain media files][2]

You can perhaps guess what’s going on here. Your system doesn’t have the required media codecs installed and hence the video player cannot play that video file.

So, what’s the solution here? You install the required codec. But how?

I’ll discuss three ways about fixing this issue:

  1. Install just the required codec: It could work for the given file but some other video files will still complain about missing codecs.
  2. Install a wide variety of multimedia codecs at once: It installs codecs as well as some other packages that you might not need like Microsoft Fonts.
  3. Install a different video player: Applications like VLC and MPV have better support for codecs by default. You don’t need to install them separately for most common video files.



If you take my advice, I suggest going for the second as well as the third method. Why? You’ll see in a moment.

### Getting h264 decoder in Ubuntu Linux

I am using Ubuntu Linux here. The first and the third methods should work for other distributions but not the second one as the package mentioned is (usually) exclusive to Ubuntu.

#### Method 1: Install only the required codec (not recommended)

When you see the error, it gives you the option to “Find in Ubuntu Software”. Clicking on that option opens the Software Center and it may (or may not) show some packages that will install the h264 decoder on your system.

![Packages that may offer h264 decoder in Ubuntu software center][3]

The package names may sound similar but you need the GStreamer Multimedia Codecs from the “bad” set. Check the description of the packages.

Alternatively, you can install the package in the terminal using this command:

```

    sudo apt install gstreamer1.0-plugins-bad

```

If you are new to the terminal, please note that it will ask for your account password. **Nothing is displayed on the screen while you type the password**. That’s the Linux way. You type the password blindly and press enter.

Once this package is installed, open the file again and see if it works now.

It may work for you but the story doesn’t end here. You may have other video files that require some other h264 decoder or some other decoder.

![You may still have trouble with other video decoders][4]

You can try and install more decoders like this:

```

    sudo apt install libavcodec-extra gstreamer1.0-plugins-ugly gstreamer1.0-libav

```

However, there is a much more [convenient way of installing media codecs in Ubuntu][5] and I’ll show it to you in the next section.

#### Method 2: Install all multimedia codecs (recommended)

Ubuntu provides a meta-package named ubuntu-restricted-extras that consists of most of the common audio and video codecs along with some other packages like the Microsoft fonts.

Install this package and you won’t have to worry about the media codecs anymore.

Open the terminal in Ubuntu and type the following command:

```

    sudo apt install ubuntu-restricted-extras

```

Since this meta-package contains software from Microsoft, you’ll have to accept the End User License Agreement (EULA).

![Press tab and hit enter to accept EULA][6]

The next screen may look like the one below. Just press tab and it will highlight the options. When the correct options are highlighted, press enter to confirm your selection.

![Press tab and when it highlights the correct option, press enter to confirm][7]

With the multimedia codecs installed, you should be able to play (almost) all kinds of media files. Your music player can play MP3 files and your video player should be able to play MP4, MKV, and whatnot.

However, this too is not the end of the story, at least for some people.

Why do I say that? Because I have noticed that the default video player in Ubuntu, Totem, often struggles while playing certain kinds of video files. You’ll notice that suddenly your system heats up, the fans start blowing and your mouse cursor stop functioning smoothly.

Why? Because Totem is struggling in decoding the video and taking too much processing power.

You can test it by running the top command while playing the video. Look for the process named totem (that’s the name of the default video player).

![Ubuntu’s default video player, Totem, may consume more than necessary CPU power][8]

What can you do now? Your trouble seems to be never ending. Fret not. There are [better video players in Linux][9] and they will help you solve the issue.

#### Method 3: Install a better video player (recommended)

There are many good video players in Linux. I find them better than the default Totem video player.

Personally, I prefer two of the lot: [VLC][10] and [MPV][11].

VLC is a versatile and hugely popular video player. Chances are that you have already used VLC.

MPV Media Player is not that popular but this lightweight application is quite good for playing video files.

Both VLC and MPV players are good at handling media codecs. You don’t even need to install media codecs separately with them. Just [install VLC][12] or MPV and you should be able to play various kinds of video files.

Either look for it in the software center:

![MPV player is available in Ubuntu software center][13]

Or [install MPV on Ubuntu][14] using the command line:

```

    sudo apt install mpv

```

Now that you have another video player, you should right click on the video files and choose to open with the new video player.

Alternatively, you can [make it the default application][15] for playing video files and use double clicks.

### Did it work for you?

I hope I didn’t go into too much detail here. I wanted to explain the various methods and the pros and cons associated with each of them.

Did you manage to get rid of the h264 decoder problem in Ubuntu? Which method did you go for?

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-h-264-decoder-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu/
[2]: https://itsfoss.com/wp-content/uploads/2022/04/h264-decoder-error-ubuntu-800x241.png
[3]: https://itsfoss.com/wp-content/uploads/2022/04/h264-decoder-ubuntu-software-center-800x532.png
[4]: https://itsfoss.com/wp-content/uploads/2022/04/ac3-decoder-missing-ubuntu-800x251.png
[5]: https://itsfoss.com/install-media-codecs-ubuntu/
[6]: https://itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras.jpg
[7]: https://itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras_1.jpg
[8]: https://itsfoss.com/wp-content/uploads/2022/04/totem-consuming-more-cpu-ubuntu-800x454.webp
[9]: https://itsfoss.com/video-players-linux/
[10]: https://www.videolan.org/vlc/
[11]: https://mpv.io/
[12]: https://itsfoss.com/install-latest-vlc/
[13]: https://itsfoss.com/wp-content/uploads/2022/04/mpv-player-ubuntu-software-center-800x346.png
[14]: https://itsfoss.com/mpv-video-player/
[15]: https://itsfoss.com/change-default-applications-ubuntu/
