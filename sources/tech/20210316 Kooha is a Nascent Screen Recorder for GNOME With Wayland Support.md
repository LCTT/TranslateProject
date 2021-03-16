[#]: subject: (Kooha is a Nascent Screen Recorder for GNOME With Wayland Support)
[#]: via: (https://itsfoss.com/kooha-screen-recorder/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Kooha is a Nascent Screen Recorder for GNOME With Wayland Support
======

There is not a single [decent screen recording software for Linux][1] that supports Wayland display server.

[GNOME’s built-in screen recorder][1] is probably the rare (and lone) one that works if you are using Wayland. But that screen recorder has no visible interface and features you expect in a standard screen recording software.

Thankfully, there is a new application in development that provides a bit more feature than GNOME screen recorder and works okay-ish on Wayland.

### Meet Kooha: a new screen recorder for GNOME desktop

![][2]

[Kooha][3] is an application in the nascent stage of development. It can be used in GNOME and it is built with GTK and PyGObject. In fact, it utilizes the same backend as the GNOME’s built-in screen recorder.

Here are the features Kooha has:

  * Record the entire screen or a selected area
  * Works on both Wayland and Xorg display servers
  * Records audio from microphone along with the video
  * Option to include or omit mouse pointer
  * Can add a delay of 5 or 10 seconds before start the recording
  * Supports recording in WebM and MKV formats
  * Allows to change the default saving location
  * Supports a few keyboard shortcuts



### My experience with Kooha

![][4]

I was contacted by its developer, Dave Patrick and since I desperately want a good screen recorder, I immediately went on to try it.

At present, [Kooha is only available to install via Flatpak][5]. I installed Flatpak and when I tried to use it, nothing was recorded. I had a quick email discussion with Dave and he told me that it was due to a [bug with GNOME screen recorder in Ubuntu 20.10][6].

You can imagine my desperation for a screen recorder with Wayland support that I [upgraded my Ubuntu to the beta version][7] of 21.04.

The screen recording worked in 21.04 but it could still not record the audio from the microphone.

There are a few more things that I noticed and didn’t work smoothly to my liking.

For example, while recording the counter remains visible on the screen and is included in the recording. I wouldn’t want that in a video tutorial. You wouldn’t like to see that either I guess.

![][8]

Another thing is about multi-monitor support. There is no option to exclusively select a particular screen. I connect with two external monitors and by default it recorded all three of them. Setting a capture region could be used but dragging it to exact pixels of a screen is a time-consuming task.

There is no option to set the frame rate or encoding that comes with [Kazam][9] or other legacy screen recorders.

### Installing Kooha on Linux (if you are using GNOME)

Please make sure to enable Flatpak support on your Linux distribution. It only works with GNOME for now so please check which desktop environment you are using.

Use this command to add Flathub to your Flatpak repositories list:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

And then use this command to install it:

```
flatpak install flathub io.github.seadve.Kooha
```

You may run it from the menu or by using this command:

```
flatpak run io.github.seadve.Kooha
```

### Conclusion

Kooha is not perfect but considering the huge void in the Wayland domain, I hope that the developers work on fixing the issues and adding more features. This is important considering [Ubuntu 21.04 is switching to Wayland by default][10] and some other popular distros like Fedora and openSUSE already use Wayland by default.

--------------------------------------------------------------------------------

via: https://itsfoss.com/kooha-screen-recorder/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/gnome-screen-recorder/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/kooha-screen-recorder.png?resize=800%2C450&ssl=1
[3]: https://github.com/SeaDve/Kooha
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/kooha.png?resize=797%2C364&ssl=1
[5]: https://flathub.org/apps/details/io.github.seadve.Kooha
[6]: https://bugs.launchpad.net/ubuntu/+source/gnome-shell/+bug/1901391
[7]: https://itsfoss.com/upgrade-ubuntu-beta/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/kooha-recording.jpg?resize=800%2C636&ssl=1
[9]: https://itsfoss.com/kazam-screen-recorder/
[10]: https://news.itsfoss.com/ubuntu-21-04-wayland/
