[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (LiVES Video Editor 3.0 is Here With Significant Improvements)
[#]: via: (https://itsfoss.com/lives-video-editor/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

LiVES Video Editor 3.0 is Here With Significant Improvements
======

We recently covered a list of [best open source video editors][1]. LiVES is one of those open source video editors, available for free.

Even though a lot of users are still waiting for the release on Windows, a major update just popped up for LiVES Video Editor (i.e v3.0.1 as the latest package) on Linux. The new upgrade includes some new features and improvements.

In this article, I’ll cover the key improvements in the new version and I’ll also mention the steps to install it on your Linux system.

### LiVES Video Editor 3.0: New Changes

![Lives Video Editor Loading in Zorin OS][2]

Overall, with this major update – LiVES Video Editor aims to have a smoother playback, prevent unwanted crashes, optimized video recording, and making the online video downloader more useful.

The list of changes are:

  * Render silence to end of video if necessary during rendering.
  * Improvements to openGL playback plugin, including much smoother playback.
  * Re-enable Advanced options for the openGL playback plugin.
  * Allow “Enough” in VJ / Pre-decode all frames
  * Refactor code for timebase calculations during playback (better a/v synch).
  * Overhaul external audio and audio recording to improve accuracy and use fewer CPU cycles.
  * Auto switch to internal audio when entering multitack mode.
  * Show correct effects state (on / off) when reshowing effect mapper window.
  * Eliminate some race conditions between the audio and video threads.
  * Improvements to online video downloader, clip size and format can now be selected, added an update option.
  * Implemented reference counting for realtime effect instances.
  * Extensively rewrote the main interface, cleaning up the code and making many visual improvements.
  * Optimized recording when video generators are running.
  * Improvements to the projectM filter wrapper, including SDL2 support.
  * Added an option to invert the Z-order in multitrack compositor (rear layers can now overlay front ones).
  * Added support for musl libc
  * Updated translations for Ukranian



While some of the points listed can just go over your head if you are not an advanced video editor. But, in a nutshell, all of these things make ‘LiVES Video Editor’ a better open source video editing software.

[][3]

Suggested read  VidCutter Lets You Easily Trim And Merge Videos In Linux

### Installing LiVES Video Editor on Linux

LiVES is normally available in the repository of all major Linux distributions. However, you may not find the latest version on your software center yet. So, if you want to install it that way – you’ll have to wait.

If you want to install it manually, you can get the RPM packages for Fedora/Open SUSE from its download page. The source is also available for Linux distros.

[Download LiVES Video Editor][4]

For Ubuntu (or Ubuntu-based distros), you can add the [unofficial PPA][5] maintained by [Ubuntuhandbook][6]. Here’s how to do it:

**1.** Launch the terminal and enter the following command:

```
sudo add-apt-repository ppa:ubuntuhandbook1/lives
```

You will be prompted for the password to authenticate the addition of PPA.

**2.** Once done, you can now easily proceed to update the list of packages and get LiVES Video Editor installed. Here’s the set of commands that you need to enter next:

```
sudo apt update
sudo apt install lives lives-plugins
```

**3.** Now, it will start downloading and installing the video editor. You should be good to go in a minute.

**Wrapping Up**

There are a handful of [video editors available on Linux][7]. But they are not often considered good enough for professional editing. I am not a professional but I do manage simple editing with such freely available video editors like LiVES.

How about you? How’s your experience with LiVES or other video editors on Linux? Let us know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/lives-video-editor/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-video-editors/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/lives-video-editor-loading.jpg?ssl=1
[3]: https://itsfoss.com/vidcutter-video-editor-linux/
[4]: http://lives-video.com/index.php?do=downloads#binaries
[5]: https://itsfoss.com/ppa-guide/
[6]: http://ubuntuhandbook.org/index.php/2019/08/lives-video-editor-3-0-released-install-ubuntu/
[7]: https://itsfoss.com/best-video-editing-software-linux/
