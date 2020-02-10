[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install All Essential Media Codecs in Ubuntu With This Single Command [Beginner’s Tip])
[#]: via: (https://itsfoss.com/install-media-codecs-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Install All Essential Media Codecs in Ubuntu With This Single Command [Beginner’s Tip]
======

If you have just installed Ubuntu or some other [Ubuntu flavors][1] like Kubuntu, Lubuntu etc, you’ll notice that your system doesn’t play some audio or video file.

For video files, you can [install VLC on Ubuntu][2]. [VLC][3] one of the [best video players for Linux][4] and can play almost any video file format. But you’ll still have troubles with audio media files and flash player.

The good thing is that [Ubuntu][5] provides a single package to install all the essential media codecs: ubuntu-restricted-extras.

![][6]

### What is Ubuntu Restricted Extras?

The ubuntu-restricted-extras is a software package that consists various essential software like flash plugin, [unrar][7], [gstreamer][8], mp4, codecs for [Chromium browser in Ubuntu][9] etc.

Since these software are not open source and some of them involve software patents, Ubuntu doesn’t install them by default. You’ll have to use multiverse repository, the software repository specifically created by Ubuntu to provide non-open source software to its users.

Please read this article to [learn more about various Ubuntu repositories][10].

### How to install Ubuntu Restricted Extras?

I find it surprising that the software center doesn’t list Ubuntu Restricted Extras. In any case, you can install the package using command line and it’s very simple.

Open a terminal by searching for it in the menu or using the [terminal keyboard shortcut Ctrl+Alt+T][11].

Since ubuntu-restrcited-extras package is available in the multiverse repository, you should verify that the multiverse repository is enabled on your system:

```
sudo add-apt-repository multiverse
```

And then you can install it in Ubuntu default edition using this command:

```
sudo apt install ubuntu-restricted-extras
```

When you enter the command, you’ll be asked to enter your password. When _**you type the password, nothing is displayed on the screen**_. That’s normal. Type your password and press enter.

It will show a huge list of packages to be installed. Press enter to confirm your selection when it asks.

You’ll also encounter an [EULA][12] (End User License Agreement) screen like this:

![Press Tab key to select OK and press Enter key][13]

It could be overwhelming to navigate this screen but don’t worry. Just press tab and it will highlight the options. When the correct options are highlighted, press enter to confirm your selection.

![Press Tab key to highlight Yes and press Enter key][14]

Once the process finishes, you should be able to play MP3 and other media formats thanks to newly installed media codecs.

##### Installing restricted extra package on Kubuntu, Lubuntu, Xubuntu

Do keep in mind that Kubuntu, Lubuntu and Xubuntu has this package available with their own respective names. They should have just used the same name but they don’t unfortunately.

On Kubuntu, use this command:

```
sudo apt install kubuntu-restricted-extras
```

On Lubuntu, use:

```
sudo apt install lubuntu-restricted-extras
```

On Xubuntu, you should use:

```
sudo apt install xubuntu-restricted-extras
```

I always recommend getting ubuntu-restricted-extras as one of the [essential things to do after installing Ubuntu][15]. It’s good to have a single command to install multiple codecs in Ubuntu.

I hope you like this quick tip in the Ubuntu beginner series. I’ll share more such tips in the future.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-media-codecs-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/which-ubuntu-install/
[2]: https://itsfoss.com/install-latest-vlc/
[3]: https://www.videolan.org/index.html
[4]: https://itsfoss.com/video-players-linux/
[5]: https://ubuntu.com/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/Media_Codecs_in_Ubuntu.png?ssl=1
[7]: https://itsfoss.com/use-rar-ubuntu-linux/
[8]: https://gstreamer.freedesktop.org/
[9]: https://itsfoss.com/install-chromium-ubuntu/
[10]: https://itsfoss.com/ubuntu-repositories/
[11]: https://itsfoss.com/ubuntu-shortcuts/
[12]: https://en.wikipedia.org/wiki/End-user_license_agreement
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras_1.jpg?ssl=1
[15]: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/
