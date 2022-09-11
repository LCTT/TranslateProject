[#]: subject: "The New Raspberry Pi OS Update Brings in Sweet Little Improvements"
[#]: via: "https://news.itsfoss.com/raspberry-pi-os-sep-update/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The New Raspberry Pi OS Update Brings in Sweet Little Improvements
======
Raspberry Pi OS update adds NetworkManager support along with new shortcuts.

![The New Raspberry Pi OS Update Brings in Sweet Little Improvements][1]

If you're an enthusiastic fan of the little computer, you may know that the Raspberry Pi can be used as a fully-fledged desktop computer. Not to forget, it is also at the heart of various electronic/IoT projects.

While many Linux distributions offer images for the Raspberry Pi, the company maintains its official OS for the Pi known as [Raspberry Pi OS][2].

If you didn't know, Raspberry Pi OS is based on Debian. Specifically, [Debian 11 Bullseye][3] for the current version. It is lightweight and uses LXDE as its desktop environment.

### Raspberry Pi OS: What's New?

Although the latest update is not a major one, it still brings in a few helpful additions. If you use your Raspberry Pi as a desktop PC, you will certainly welcome them.

Let's take a look at what the new release offers.

#### Quick Search Functionality for Main Menu

While Windows and many Linux distros already include this basic feature, Raspberry Pi OS did not have it, until now.

Users can hit the Raspberry Pi key or the default host key on the keyboard which will open the main menu and a new search box appears automatically once the user starts typing the name of an app to be launched.

The arrow up and down keys can be used to navigate the menu and the enter key to select the app.

![New search box for main menu][4]

If the user does not type anything, the main menu will function exactly the same as it does when the Raspberry Pi icon is clicked to display the apps.

There's no need to use the mouse cursor to open up the apps anymore.

#### New Keyboard Shortcuts 

Just like the main menu, you can also bring up Wi-Fi and Bluetooth toggles by the keyboard.

Performing **Ctrl+Alt+W** will open the Wi-Fi menu while **Ctrl+Alt+B** is reserved for Bluetooth.

#### Enhanced Audio Input Control

The taskbar will now display two separate icons for input and output devices instead of the single default volume icon.

![Volume Slider][5]

A microphone icon will also pop up next to the speaker icon whenever an audio input device gets connected. Moreover, if multiple audio input devices are connected, users can perform a right click on the same icon to select a device from the list while a left click will display the volume control slider.

#### NetworkManager Support

NetworkManager is a popular daemon used by many Linux distros to handle networking functionality. It includes a host of features to help users tweak and configure network settings accordingly.

If you are curious, learn more about daemons in Linux here:

[What are Daemons in Linux? Why are They Used?][6]

For its functionality, initial support for NetworkManager as an alternate option to dhcpcd was introduced. This means that users can easily manage VPN connections without much hassle or even configure the Pi as a Wi-Fi access point.

![][8]

If you still want to try NetworkManager, there are a few advanced steps required to be followed. Users can be assured of the option to switch back to dhcpcd if they face any problems whilst using NetworkManager.

The [official release notes][9] includes a bit more details if you want to explore more about the release.

### Getting Raspberry Pi OS

Head over to the official downloads page linked below to download the new image.

You can use Raspberry Pi Imager on any of your systems to prepare a microSD card to use on a Raspberry Pi. In either case, you can separately download the Raspberry Pi OS file to get it set up.

[Get Raspberry Pi OS][10]

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
