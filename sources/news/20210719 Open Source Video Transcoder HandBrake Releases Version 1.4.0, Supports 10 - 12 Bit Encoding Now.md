[#]: subject: (Open Source Video Transcoder HandBrake Releases Version 1.4.0, Supports 10 & 12 Bit Encoding Now)
[#]: via: (https://news.itsfoss.com/handbrake-1-4-0-release/)
[#]: author: (Abhishek https://news.itsfoss.com/author/root/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Open Source Video Transcoder HandBrake Releases Version 1.4.0, Supports 10 & 12 Bit Encoding Now
======

[HandBrake][1] hardly needs an introduction. This is one of the most popular open source software for converting video files from one format to another, with several configuration options for advanced users.

I know [ffmpeg on Linux][2] is the ultimate tool but that’s command line. Handbrake also utilizes ffmpeg underneath and provides a good graphical user interface for ease of use.

Let’s see what’s new in this release of HandBrake.

### New features in HandBrake 1.4.0

![10 bit video encoding in HandBrake 1.4.0][3]

Here are the main highlight of this release:

  * The HandBrake engine is now 10 and 12bit capable but not all filters support higher than 8 bit.
  * HDR10 metadata passthru support
  * New hardware encoder: Media Foundation
  * MP2 Audio passthru support
  * Now also supports macOS running on Apple Silicon
  * Introduces new filters: Chroma Smooth, Colourspace Selection
  * New general purpose subtitle decoder replacing current decoders for PGS, SRT and SSA with those in ffmpeg
  * Support to control the resolution limit
  * Support for padding
  * Limited support for upscaling
  * ffmpeg 4.4 and other libraries update
  * Miscellaneous bug fixes and improvements



You may read the [release note][4] for more details on the new features.

### Install HandBrake 1.4.0 in Linux

Before updating to the new version, make a backup of any custom presets and app preferences in case of compatibility issues.

The [latest version of HandBrake can be easily installed on Ubuntu][5] and other Ubuntu-based distributions through the official PPA.

However, at the time of writing this article, the PPA has not been updated with version 1.4.0. I’ll mention the steps anyway so that when it is available, you get the latest version.

```
sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt update
sudo apt install handbrake-gtk
```

HandBrake 1.4.0 is already available in the Community repo for Arch users. You just have to [update your Arch Linux system][6] to update HandBrake version if it is already installed.

For the rest of the distributions, Flatpak option is available. If you have Flatpak support enabled on your distribution, use the following command

```
flatpak install flathub fr.handbrake.ghb
```

Enjoy HandBrake 1.4.0.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/handbrake-1-4-0-release/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/handbrake/
[2]: https://itsfoss.com/ffmpeg/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4NyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://github.com/HandBrake/HandBrake/releases/
[5]: https://itsfoss.com/install-handbrake-ubuntu/
[6]: https://itsfoss.com/update-arch-linux/
