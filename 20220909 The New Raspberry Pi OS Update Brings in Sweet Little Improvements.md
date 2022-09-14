[#]: subject: "The New Raspberry Pi OS Update Brings in Sweet Little Improvements"
[#]: via: "https://news.itsfoss.com/raspberry-pi-os-sep-update/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: "zjsoftceo"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The New Raspberry Pi OS Update Brings in Sweet Little Improvements
======
译文：新树莓派操作系统更新带来甜蜜的小改进
======
Raspberry Pi OS update adds NetworkManager support along with new shortcuts.
======
译文：树莓派操作系统更新，增加网络管理器以及新的操作快捷方式的支持。
======
![The New Raspberry Pi OS Update Brings in Sweet Little Improvements][1]

If you're an enthusiastic fan of the little computer, you may know that the Raspberry Pi can be used as a fully-fledged desktop computer. Not to forget, it is also at the heart of various electronic/IoT projects.
======
译文：如果你是小型迷你计算机的狂热粉丝的话，您可能知道树莓派可以用作成熟的迷你桌面式计算机。不要忘记，它也是支持各种电子/物联网项目核心。
======
While many Linux distributions offer images for the Raspberry Pi, the company maintains its official OS for the Pi known as [Raspberry Pi OS][2].
======
译文：虽然许多Linux发行版为树莓派提供了许多系统镜像文件，但树莓派基金会保留了官方操作系统，我们便称之为树莓派操作系统。
======
If you didn't know, Raspberry Pi OS is based on Debian. Specifically, [Debian 11 Bullseye][3] for the current version. It is lightweight and uses LXDE as its desktop environment.
======
译文：如果你不知道，树莓派操作系统是基于Linux发行版Debian。具体来说，以Debian 11作为是当前树莓派操作系统最核心、轻量级版本并使用了LXDE作为其桌面应用环境。
======
### Raspberry Pi OS: What's New? 树莓派操作系统：带来了什么最新内容？

Although the latest update is not a major one, it still brings in a few helpful additions. If you use your Raspberry Pi as a desktop PC, you will certainly welcome them.
======
译文：尽管最新的更新并不是一个最主要的更新，但它仍然带来了一些有用的补充。如果您将树莓派用作迷你台式PC来使用，您一定会欢迎它们的。
======
Let's take a look at what the new release offers.
======
译文：让我们来看看新版本提供了什么。
======

#### Quick Search Functionality for Main Menu 主菜单的主目录具有快速搜索功能

While Windows and many Linux distros already include this basic feature, Raspberry Pi OS did not have it, until now.
======
译文：虽然Windows系统和许多Linux发行版已经包含了这个基本功能，但树莓派操作系统直到现在还没有它。
======

Users can hit the Raspberry Pi key or the default host key on the keyboard which will open the main menu and a new search box appears automatically once the user starts typing the name of an app to be launched.
======
译文：用户可以点击Raspberry Pi键或键盘上的默认主机键，这将打开主菜单，一旦用户开始键入要启动的应用程序的名称，就会自动出现一个新的搜索框。
======

The arrow up and down keys can be used to navigate the menu and the enter key to select the app.
======
译文：向上和向下箭头键可用于导航菜单，而回车键可用于选择应用。
======

![New search box for main menu][4]

If the user does not type anything, the main menu will function exactly the same as it does when the Raspberry Pi icon is clicked to display the apps.

There's no need to use the mouse cursor to open up the apps anymore.
======
译文：如果用户不键入任何内容，则主菜单的功能将与单击Raspberry Pi图标以显示应用程序时的功能完全相同。无需再使用鼠标光标打开应用程序。
======

#### New Keyboard Shortcuts 全新的键盘操作快捷方式

Just like the main menu, you can also bring up Wi-Fi and Bluetooth toggles by the keyboard.
======
译文：就像主菜单一样，您还可以通过键盘调出Wi-Fi和蓝牙功能的切换。
======
Performing **Ctrl+Alt+W** will open the Wi-Fi menu while **Ctrl+Alt+B** is reserved for Bluetooth.
======
译文：执行 Ctrl+Alt+W 将打开 Wi-Fi 菜单，而 Ctrl+Alt+B 是为蓝牙保留的。
======

#### Enhanced Audio Input Control 增强型音频输入控制

The taskbar will now display two separate icons for input and output devices instead of the single default volume icon.
======
译文：任务栏现在将为输入和输出设备显示两个单独的图标，而不是单个默认音量图标。
======

![Volume Slider][5]

A microphone icon will also pop up next to the speaker icon whenever an audio input device gets connected. Moreover, if multiple audio input devices are connected, users can perform a right click on the same icon to select a device from the list while a left click will display the volume control slider.
======
译文：每当连接音频输入设备时，扬声器图标旁边也会弹出一个麦克风图标。此外，如果连接了多个音频输入设备，用户可以右键单击同一图标以从列表中选择设备，而左键单击将显示音量控制滑块。
======
#### NetworkManager Support 网络管理功能支持

NetworkManager is a popular daemon used by many Linux distros to handle networking functionality. It includes a host of features to help users tweak and configure network settings accordingly.
======
译文：网络管理器是许多 Linux 发行版用来处理网络功能的流行守护程序。它包括许多功能，可帮助用户相应地调整和配置网络设置。
======

If you are curious, learn more about daemons in Linux here:
======
译文：如果您很好奇，请在此处了解有关 Linux 中守护程序的更多信息：
======

[What are Daemons in Linux? Why are They Used?][6] 什么是 Linux 中的守护进程？为什么使用它们？

For its functionality, initial support for NetworkManager as an alternate option to dhcpcd was introduced. This means that users can easily manage VPN connections without much hassle or even configure the Pi as a Wi-Fi access point.
======
译文：就其功能而言，引入了对网络管理器的初始支持，作为 dhcpcd 的替代选项。这意味着用户可以轻松管理VPN连接，而不会有太多麻烦，甚至可以将Pi配置为Wi-Fi接入点。
======

![][8]

If you still want to try NetworkManager, there are a few advanced steps required to be followed. Users can be assured of the option to switch back to dhcpcd if they face any problems whilst using NetworkManager.
======
译文：如果您仍然想尝试网络管理器，则需要遵循一些高级步骤。用户可以放心，如果他们在使用网络管理器时遇到任何问题，可以选择切换回dhcpcd。
======

The [official release notes][9] includes a bit more details if you want to explore more about the release.
======
译文：官方发行说明包括更多详细信息，如果您想了解有关该版本的更多信息。
======

### Getting Raspberry Pi OS 获取更多的树莓派操作系统

Head over to the official downloads page linked below to download the new image.
======
译文：前往下面链接的官方下载页面下载新的镜像文件。
======

You can use Raspberry Pi Imager on any of your systems to prepare a microSD card to use on a Raspberry Pi. In either case, you can separately download the Raspberry Pi OS file to get it set up.
======
译文：您可以在任何系统上使用树莓派成像仪来准备要在树莓派上使用的microSD卡。在任何一种情况下，您都可以单独下载树莓派操作系统文件进行设置。
======
[Get Raspberry Pi OS][10] 获取树莓派操作系统

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/raspberry-pi-os-sep-update/ 

作者：[Rishabh Moharir][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/raspberry-pi-os.jpg
[2]: https://www.raspberrypi.com/software/
[3]: https://news.itsfoss.com/debian-11-feature/
[4]: https://news.itsfoss.com/content/images/2022/09/menu.png
[5]: https://news.itsfoss.com/content/images/2022/09/mic.png
[6]: https://itsfoss.com/linux-daemons/
[8]: https://news.itsfoss.com/content/images/2022/09/nm.png
[9]: https://www.raspberrypi.com/news/the-latest-update-to-raspberry-pi-os/
[10]: https://www.raspberrypi.com/software/
