Record Screen in Ubuntu Linux With Kazam [Beginner’s Guide]
======
**This tutorial shows you how to install Kazam screen recorder and explains how to record screen in Ubuntu. The guide also lists useful shortcuts and handy tips for using Kazam.**

![How to record your screen in Ubuntu Linux with Kazam][1]

[Kazam][2] is one of the [best screen recorders for Linux][3]. To me, it’s the best screen recording tool. I have been using it for years. All the video tutorials on YouTube have been recorded with Kazam.

Some of the main features of Kazam are:

  * Record entire screen, part of screen, application window or all screens (for multi-monitor setup)
  * Take screenshots
  * Keyboard shortcut support for easily pausing and resuming while recording screen
  * Record in various file formats such as MP4, AVI and more.
  * Capture audio from speaker or microphone while recording the screen
  * Capture mouse clicks and key presses
  * Capture video from webcam
  * Insert a webcam window on the side
  * Broadcast to YouTube live video



Like the screenshot tool [Shutter][4], Kazam is also not being actively developed for the last couple of years. And like Shutter, the present Kazam release works just fine.

I am using Ubuntu in the tutorial. The installation instructions should work for other Ubuntu-based distributions such as Linux Mint, elementary OS etc. For all the other distributions, you can still read about using Kazam and its features.

### Install Kazam in Ubuntu

Kazam is available in the official repository in Ubuntu. However, the official repository consists Kazam version 1.4.5, the last stable version of Kazam.

![Kazam Version 1.4.5][5]
Kazam Version 1.4.5

Kazam developer(s) also worked on a newer release, Kazam 1.5.3. The version was almost sable and ready to release, but for unknown reasons, the development stopped after this. There have been [no updates][6] since then.

You can use either of Kazam 1.4.5 and 1.5.3 without hesitating. Kazam 1.5 provides additional features like recording mouse clicks and key presses, webcam support, live broadcast support, and a refreshed countdown timer.

![Kazam Version 1.5.3][7]
Kazam Version 1.5.3

It’s up to you to decide which version you want to use. I would suggest go for version 1.5.3 because it has more features.

You can install the older Kazam 1.4.5 from the Software Center. You can also use the command below:

```
sudo apt install kazam
```

If you want to install the newer Kazam 1.5.3, you can use this [unofficial PPA][8] that is available for Ubuntu 18.04 and 16.04:

```
sudo add-apt-repository ppa:sylvain-pineau/kazam
sudo apt-get update
sudo apt install kazam
```

You also need to install a few libraries in order to record the mouse clicks and keyboard presses.

```
sudo apt install python3-cairo python3-xlib
```

### Recording your screen with Kazam

Once you have installed Kazam, search for it in the application menu and start it. You should see a screen like this with some options on it. You can check the options as per your need and click on capture to start recording screen with Kazam.

![Screen recording with Kazam][9]
Screen recording with Kazam

It will show you a countdown before recording the screen. The default wait time is 5 seconds and you can change it from Kazam interface (see the previous image). It gives you a breathing time so that you can prepare for your recording.

![Countdown before screen recording][10]
Countdown before screen recording

Once the recording starts,the main Kazam interface disappears and an indicator appears in the panel. If you want to pause the recording or finish the recording, you can do it from this indicator.

![Pause or finish screen recording][11]
Pause or finish screen recording

If you choose to finish the recording, it will give you the option to “Save for later”. If you have a [video editor installed in Linux][12], you can also start editing the recording from this point.

![Save screen recording in Kazam][13]
Save recording

By default it prompts you to install the recording in Videos folder but you can change the location and save it elsewhere as well.

That’s the basic you need to know about screen recording in Linux with Kazam.

Now let me give you a few tips on how to utilize more features in Kazam.

### Getting more out of Kazam screen recorder

Kazam is a featureful screen recorder for Linux. You can access its advanced or additional features from the preferences.

![Accessing Kazam preferences][14]
Accessing Kazam preferences

#### Autosave screen recording in a specified location

You can choose to automatically save the screen recordings in Kazam. The default location is Videos but you can change it to any other location.

![Autosave screen recordings in a chosen location][15]
Autosave in a chosen location

#### Avoid screen recording in RAW mode

You can save your screen recordings in file formats like WEBM, MP4, AVI etc. You are free to choose what you want. However, I would advise avoiding RAW (AVI) file format. If you use RAW file format, the recorded files will be in GBs even for a few minutes of recordings.

It’s wise to verify that Kazam is not using the RAW file format for recording. If you ask my suggestion, prefer H264 with MP4 file format.

![file format in Kazam][16]
Don’t use RAW files

#### Capture mouse clicks and key presses while screen recording

If you want to highlight when a mouse was clicked, you can easily do that in the newer version of Kazam.

![Record mouse clicks while screen recording with Kazam][17]
Record mouse clicks

All you have to do is to check the “Key presses and mouse clicks” option on the Kazam interface (the same screen where you press Capture).

#### Use keyboard shortcuts for more efficient screen recordings

Imagine you are recording screen in Linux and suddenly you realized that you have to pause the recording for some reasons. Now, you can pause the recording by going to the Kazam indicator and selecting the pause option. But this activity of selecting the pause option will also be recorded.

You can edit out this part later but it unnecessarily adds to the already cumbersome editing task.

A better option will be to use the [keyboard shortcuts in Ubuntu][18]. Screen recording becomes a lot better if you use the shortcuts.

While Kazam is running, you can use the following hotkeys:

  * Super+Ctrl+R: Start recording
  * Super+Ctrl+P: Pause recording, press again for resuming the recording
  * Super+Ctrl+F: Finish recording
  * Super+Ctrl+Q: Quit recording



Super key is the Windows key on your keyboard.

The most important is Super+Ctrl+P for pausing and resuming the recording.

You can further explore the Kazam preferences for webcam recording and YouTube live broadcasting options.

### Do you like Kazam?

I am repeating myself here. I love Kazam. I have used other screen recorders like [SimpleScreenRecorder][19] or [Green Recorder][20] but I feel a lot more comfortable with Kazam.

I hope you like Kazam for screen recording in Ubuntu or any other Linux distribution. I have tried highlighting some of the additional features here to help you with a better screen recording.

What features do you like about Kazam? Do you use some other screen recorder? Do they work better than Kazam? Please share your views in the comments section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/kazam-screen-recorder/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/screen-recording-kazam-ubuntu-linux.png
[2]: https://launchpad.net/kazam
[3]: https://itsfoss.com/best-linux-screen-recorders/
[4]: http://shutter-project.org/
[5]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/kazam-1-4-5.png
[6]: https://launchpad.net/~kazam-team/+archive/ubuntu/unstable-series
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/kazam-1-5-3.png
[8]: https://launchpad.net/~sylvain-pineau/+archive/ubuntu/kazam
[9]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/kazam-start-recording.png
[10]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/kazam-countdown.jpg
[11]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/kazam-finish-recording.png
[12]: https://itsfoss.com/best-video-editing-software-linux/
[13]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/kazam-save-recording.jpg
[14]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/kazam-preferences.png
[15]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/kazam-auto-save.jpg
[16]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/select-file-type-kazam.jpg
[17]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/record-mouse-clicks-kazam.jpeg
[18]: https://itsfoss.com/ubuntu-shortcuts/
[19]: https://itsfoss.com/record-screen-ubuntu-simplescreenrecorder/
[20]: https://itsfoss.com/green-recorder-3/
