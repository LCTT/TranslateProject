[#]: subject: (4 cool new projects to try in Copr from July 2021)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-july-2021/)
[#]: author: (Jakub Kadlčík https://fedoramagazine.org/author/frostyx/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

4 cool new projects to try in Copr from July 2021
======

![][1]

Copr is a [collection][2] of personal repositories for software that isn’t carried in Fedora Linux. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora Linux standards, despite being free and open-source. Copr can offer these projects outside the Fedora Linux set of packages. Software in Copr isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

This article presents a few new and interesting projects in Copr. If you’re new to using Copr, see the [Copr User Documentation][3] for how to get started.

## [][4] Wike

[Wike][5] is a Wikipedia reader for the GNOME Desktop with search integration in the GNOME Shell. It provides distraction-free access to the [online encyclopedia][6]. The interface is minimalistic but it supports switching an article between multiple languages, bookmarks, article table of contents, dark mode, and more.

![][7]

### [][8] Installation instructions

The [repo][9] currently provides Wike for Fedora 33, 34, and Fedora Rawhide. To install it, use these commands:

```
sudo dnf copr enable xfgusta/wike
sudo dnf install wike
```

## [][10] DroidCam

We are living through confusing times, being isolated at our homes, and the majority of our interactions with friends and coworkers take place on some video conference platform. Don’t waste your money on an overpriced webcam if you carry one in your pocket already. [DroidCam][11] lets you pair your phone with a computer and use it as a dedicated webcam. The connection made through a USB cable or over WiFi. DroidCam provides remote control of the camera and allows zooming, using autofocus, toggling the LED light, and other convenient features.

![][12]

### [][13] Installation instructions

The [repo][14] currently provides DroidCam for Fedora 33 and 34. Before installing it, please update your system and reboot, or make sure you are running the latest kernel version and have an appropriate version of _kernel-headers_ installed.

```
sudo dnf update
sudo reboot
```

Droidcam depends on _v4l2loopback_ which must be installed manually from the [RPM Fusion Free repository][15].

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install v4l2loopback
sudo modprobe v4l2loopback
```

Now install the _droidcam_ package:

```
sudo dnf copr enable meeuw/droidcam
sudo dnf install droidcam
```

## [][16] Nyxt

[Nyxt][17] is a keyboard-oriented, infinitely extensible web browser designed for power users. It was heavily inspired by Emacs and as such is implemented and configured in Common Lisp providing familiar key-bindings ([Emacs][18], [vi][19], [CUA][20]).

Other killer features that cannot be missed are a built-in REPL, [tree history][21], [buffers instead of tabs][22], and [so much more][17].

Nyxt is web engine agnostic so don’t worry about pages rendering in unexpected ways.

![][23]

### [][24] Installation instructions

The [repo][25] currently provides Nyxt for Fedora 33, 34, and Fedora Rawhide. To install it, use these commands:

```
sudo dnf copr enable teervo/nyxt
sudo dnf install nyxt
```

## [][26] Bottom

[Bottom][27] is a system monitor with a customizable interface and multitude of features, It took inspiration from [gtop][28], [gotop][29], and [htop][30]. As such, it supports [processes][31] monitoring, [CPU][32], [RAM][33], and [network][34] usage monitoring. Besides those, it also provides more exotic widgets such as [disk capacity][35] usage, [temperature sensors][36], and [battery][37] usage.

Bottom utilizes the screen estate very efficiently thanks to the customizable layout of widgets as well as the [possibility to focus on just one widget and maximizing it][38].

![][39]

### [][40] Installation instructions

The [repo][41] currently provides Bottom for Fedora 33, 34, and Fedora Rawhide. It is also available for EPEL 7 and 8. To install it, use these commands:

```
sudo dnf copr enable opuk/bottom
sudo dnf install bottom
```

Use _btm_ command to run the program.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-july-2021/

作者：[Jakub Kadlčík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/frostyx/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html
[4]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#wike
[5]: https://github.com/hugolabe/Wike
[6]: https://en.wikipedia.org/wiki/Main_Page
[7]: https://fedoramagazine.org/wp-content/uploads/2021/07/wike.png
[8]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#installation-instructions
[9]: https://copr.fedorainfracloud.org/coprs/xfgusta/wike/
[10]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#droidcam
[11]: https://www.dev47apps.com/
[12]: https://fedoramagazine.org/wp-content/uploads/2021/07/droidcam.png
[13]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#installation-instructions-1
[14]: https://copr.fedorainfracloud.org/coprs/meeuw/droidcam
[15]: https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/#proc_enabling-the-rpmfusion-repositories-using-command-line-utilities_enabling-the-rpmfusion-repositories
[16]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#nyxt
[17]: https://nyxt.atlas.engineer/
[18]: https://en.wikipedia.org/wiki/Emacs
[19]: https://en.wikipedia.org/wiki/Vim_(text_editor)
[20]: https://en.wikipedia.org/wiki/IBM_Common_User_Access
[21]: https://nyxt.atlas.engineer/#tree
[22]: https://nyxt.atlas.engineer/#fuzzy
[23]: https://fedoramagazine.org/wp-content/uploads/2021/07/nyxt.png
[24]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#installation-instructions-2
[25]: https://copr.fedorainfracloud.org/coprs/teervo/nyxt/
[26]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#bottom
[27]: https://github.com/ClementTsang/bottom
[28]: https://github.com/aksakalli/gtop
[29]: https://github.com/xxxserxxx/gotop
[30]: https://github.com/htop-dev/htop/
[31]: https://clementtsang.github.io/bottom/nightly/usage/widgets/process/
[32]: https://clementtsang.github.io/bottom/nightly/usage/widgets/cpu/
[33]: https://clementtsang.github.io/bottom/nightly/usage/widgets/memory/
[34]: https://clementtsang.github.io/bottom/nightly/usage/widgets/network/
[35]: https://clementtsang.github.io/bottom/nightly/usage/widgets/disk/
[36]: https://clementtsang.github.io/bottom/nightly/usage/widgets/temperature/
[37]: https://clementtsang.github.io/bottom/nightly/usage/widgets/battery/
[38]: https://clementtsang.github.io/bottom/nightly/usage/general-usage/#expansion
[39]: https://fedoramagazine.org/wp-content/uploads/2021/07/bottom.png
[40]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#installation-instructions-3
[41]: https://copr.fedorainfracloud.org/coprs/opuk/bottom/
