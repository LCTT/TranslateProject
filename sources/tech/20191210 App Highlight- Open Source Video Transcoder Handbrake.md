[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (App Highlight: Open Source Video Transcoder Handbrake)
[#]: via: (https://itsfoss.com/handbrake/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

App Highlight: Open Source Video Transcoder Handbrake
======

_**Brief: HandBrake is a free and open-source video conversion tool that is quite useful. Let’s see what are its main features and how to use them for converting videos from one format to another.**_

### HandBrake: An Open Source Video Transcoder

![][1]

[HandBrake][2] is a quite useful tool which helps you to convert a video from one format to some of the widely supported codecs (**.mp4/.m4v/.mkv/.webm**)

It can support any video format and help you convert it. In addition to that, you have several features on board to customize the video attributes while converting.

If you are looking for a [Format Factory alternative][3], this is your best bet.

I shall highlight the key features to help you know more.

![HandBrake][4]

### Features of HandBrake

When you start using the video transcoder, you will find a lot of tiny features for video conversion. However, here, I’ll highlight the important things you need to know about HandBrake:

#### Video Conversion Presets

![HandBrake Presets][5]

Suppose you want to convert a full HD video to play on a mobile which was originally tailored for desktop viewing, what do you do?

Would you test various dimensions and convert them repeatedly to get the perfect mobile port? Or, would you rather prefer to have pre-defined settings for such conversions?

If you opt for a preset, you just have to select the target device (or type of device) from the list of available presets.

It even features presets for PS4 Pro (4K) and Discord. So, you can expect a big list of presets available.

#### Input Sources Support

Unless the file has some sort of copy protection, HandBrake can help you convert it. You will have no problems whatsoever even if you have an Ultra HD Blu-ray disc as the source with no copyright protection.

All the available video encoding formats should work fine as an input source file.

#### Basic Video Manipulation

![HandBrake Screenshot][6]

In addition to the ability of video conversion, it also lets you tweak the video to suit your requirements.

You can change the dimensions, crop it, add a filter, change the frame rate settings, and a lot more things.

If that wasn’t enough, you also get the ability to add subtitles and chapter markers.

#### Live Video Preview

This may not be a big deal to have – but I haven’t seen any video converter tool featuring video previews while being able to convert/tweak the video. It could come in handy for someone specific.

### Installing HandBrake on Ubuntu and other Linux distributions

HandBrake is a cross-platform application and you can install it on all different platforms like Linux, macOS and Windows. Just head over to heir website and download it from there.

[Download HandBrake for any platform][7]

On It’s FOSS, our focus is on Linux so I am going to show the steps to install it on Linux.

**Installing HandBrake on Ubuntu**

HandBrake is available in the [universe repository in Ubuntu][8]. If you have it enabled, you should find it in the software center. Just search for the name and install it from there.

![HandBrake in Ubuntu Software Center][9]

You can also use terminal for installing HandBrake with apt or [apt-get command][10]:

```
sudo apt-get install handbrake
```

However, the software center might feature the older version. If you want to install the latest version of HandBrake on Ubuntu and other Ubuntu-based distributions, you can [use its official PPA][11]. It’s better to uninstall any existing version of HandBrake beforehand.

```
sudo apt remove handbrake
sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt update
sudo apt install handbrake-gtk
```

You can [learn more about using PPA here][12]. It will help you to [remove PPA][13], if you ever need to uninstall HandBrake installed via the PPA.

If you want to install the CLI version of Handbrake, simply use this command:

```
sudo apt install handbrake-cli
```

Quite honestly, HandBrake should be used as a GUI application. If you want command line, you can always [use ffmpeg][14] that is more powerful and HandBrake uses it underneath anyways.

**Installing HandBrake on other Linux distributions**

HandBrake is one of the [popular Linux software][15] and it should be available in the official repositories of almost all Linux distributions.

Just use the software center or package manager of your distribution to install HandBrake.

But again, your distribution might not have the latest version of HandBrale. So, if you want the latest version installed, you can try installing the [Flatpak package][16] available. If you are not sure how to use Flatpak, refer to our guide on [using Flatpak on Linux][17].

[HandBrake][2]

**Wrapping Up**

A free and open-source video conversion tool that gets the job done. I’m quite satisfied with it personally.

If you use HandBrake extensively, mention at least one feature that you like the most about it.

If you use some other application for converting video formats, do share it with us in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/handbrake/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/handbrake_software_logo.png?ssl=1
[2]: https://handbrake.fr/
[3]: https://itsfoss.com/format-factory-alternative-linux/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/handbrake.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/handbrake-presets.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/handbrake-screenshot.png?ssl=1
[7]: https://handbrake.fr/downloads.php
[8]: https://itsfoss.com/ubuntu-repositories/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/handbrake_ubuntu_software_center.png?ssl=1
[10]: https://itsfoss.com/apt-get-linux-guide/
[11]: https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases
[12]: https://itsfoss.com/ppa-guide/
[13]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[14]: https://itsfoss.com/ffmpeg/
[15]: https://itsfoss.com/essential-linux-applications/
[16]: https://flathub.org/apps/details/fr.handbrake.ghb
[17]: https://itsfoss.com/flatpak-guide/
