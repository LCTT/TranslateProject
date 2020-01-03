[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (GNOME has a ‘Secret’ Screen Recorder. Here’s How to Use it!)
[#]: via: (https://itsfoss.com/gnome-screen-recorder/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

GNOME has a ‘Secret’ Screen Recorder. Here’s How to Use it!
======

[GNOME][1] is one of the [most popular desktop environments][2] and for good reasons. It has a modern UI and it comes with a number of GNOME-specific applications that blend well with the overall desktop appearance.

You can [tweak GNOME][3] to your liking as much as you want but I am not here to discuss that. GNOME desktop has some hidden features that you probably are not aware of.

One of such not-so-obvious feature is a built in screen recorder.

Yes, you read that right. If you are using GNOME desktop, you don’t necessarily need to install other [screen recorders in Linux][4]. You just need to know the correct keyboard shortcut.

### Instantly record your screen with GNOME Screen Recorder

To quickly access the GNOME screen recorder, you have to press this [keyboard shortcut in Ubuntu][5] or other distributions using GNOME desktop:

```
Ctrl + Alt + Shift + R
```

This will immediately start recording your desktop. You can tell that the screen recording is in progress by looking at the red dot in the system tray area of the top panel:

![The red dot in the system tray area indicates that screen recording is in progress][6]

#### Increase the screencast duration

The default maximum record time is just 30 seconds. It can be increased though.

Open a terminal and use the following command:

```
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 300
```

In the above command, I have increased the maximum length of the recording to 300 seconds (i.e. 5 minutes). You can change it to any other value but it should be in seconds.

If you **don’t want any limit on the maximum recording time, set it to 0** and then the recording won’t stop until you manually stop it or your disk runs out of space.

#### Stop the screen recording

As I mentioned, your desktop recording will stop automatically after it reaches the maximum time limit.

To stop the recording before that, you can press the same key combination:

```
Ctrl + Alt + Shift + R
```

Your recordings are saved in [webm][7] format in the Videos folder of your Home directory.

#### Limitations

While it might be handy to record your desktop quickly with this handy little tool, it has its several limitations when compared to a full-fledged screen recording tool like [Simple Screen Recorder][8].

  * There is no time delay option before the recording starts
  * There is no pause and play option
  * It records the entire screen. No option to record only an application window or a ceratin area or a certain monitor (if you have a multi-monitor setup).
  * Videos are saved in webm format in the user’s Videos directory. You cannot change it. You’ll have to use a tool like [HandBrake to convert the videos to other format][9].



As you can see, the secret GNOME screen recorder is no where near to the features provided by the likes of [Kazam][10] or other such tools.

But it doesn’t try to be a full-fledged screen recorder. It just provides you a quick way of recording a small screencast. That’s it.

GNOME is a versatile modern desktop environments. You can [tweak GNOME][3] extensively. The [GNOME Extensions][11] provide another dimension to the desktop customization.

This screen recorder is one of the hidden features of GNOME like the suspend option that you won’t easily find on your own.

_How do you like it? Do you know some other hidden GNOME features that you would like to share with us? The comment section is all yours._

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-screen-recorder/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://gnome.org/
[2]: https://itsfoss.com/best-linux-desktop-environments/
[3]: https://itsfoss.com/gnome-tweak-tool/
[4]: https://itsfoss.com/best-linux-screen-recorders/
[5]: https://itsfoss.com/ubuntu-shortcuts/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/gnome_screen_recording.jpg?ssl=1
[7]: https://www.webmproject.org/about/
[8]: https://itsfoss.com/record-screen-ubuntu-simplescreenrecorder/
[9]: https://itsfoss.com/handbrake/
[10]: https://itsfoss.com/kazam-screen-recorder/
[11]: https://itsfoss.com/best-gnome-extensions/
