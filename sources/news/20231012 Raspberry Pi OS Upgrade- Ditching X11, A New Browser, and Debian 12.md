[#]: subject: "Raspberry Pi OS Upgrade: Ditching X11, A New Browser, and Debian 12"
[#]: via: "https://news.itsfoss.com/raspberry-pi-os-bookworm/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Raspberry Pi OS Upgrade: Ditching X11, A New Browser, and Debian 12
======
The Raspberry Pi OS is ready for the latest Raspberry Pi 5 hardware with
Debian 12 and other big changes.
A new release of Raspberry Pi OS is here to complement the recently launched [Raspberry Pi 5][1].

The developers have worked on it for quite some time now. It features loads of improvements and a major change that signifies the move to a more modern approach to window systems.

Let's see what they've accomplished.

### Raspberry Pi OS: What's New?

![][2]

Based on the latest **[Debian 12 'Bookworm'][3]** release, the developers have had to make **major architectural changes to the Raspberry Pi Desktop**.

Some key highlights include:

  * **Wayland Only**
  * **Networking Improvements**
  * **PipeWire by Default**
  * **Raspberry Pi-Optimized Firefox**



Naturally, you can expect the core benefits of Debian 'Bookworm' along with the above-mentioned changes.

#### Wayland Only

Yes, you read that right.

The Raspberry Pi Desktop has moved to the [Wayland][4] window system as its default, dropping the [X11][5] window system owing to various limitations, with the primary selling point being that **Wayland performs better on modern hardware**.

All of this was made possible thanks to the implementation of the [**Wayfire**][6] compositor, which also allowed the devs to keep **** the **user experience a familiar one.**

Quoting the devs from the release announcement:

> If you boot Raspberry Pi OS on a Pi 4 or 5, you will now get a Wayfire desktop. It should look pretty much identical to the desktop you are used to from Bullseye, but appearances are deceptive — it has taken a lot of work to get to the point where the two desktop environments look the same!

**We are not surprised by this move, though.**

Recently, we have been seeing an increase in transition to Wayland from older window systems like X11 and [Openbox][7].

For instance, the recent move by GNOME that has kick-started the transition to **[a Wayland-only future][8]**. Even **Fedora Linux 40 is all set to drop the X11 session** for an XWayland approach with [Plasma 6][9].

It is interesting to see Raspberry Pi OS make the move already 😄

📋

Fret not, **for users who still want to use the older X11/Openbox display systems** , they can do so by re-enabling these from the 'Advanced Settings' menu under 'raspi-config'.

#### Networking Improvements

![][10]

Working on the previously implemented [NetworkManager][11] network controller, the devs have been able to improve it by having **the networking plugin on the taskbar**.

It looks almost the same as in the previous versions but with a new 'Advanced Options' element that allows users to access the new functions made available by NetworkManager.

#### PipeWire by Default

Raspberry Pi Desktop now features [PipeWire][12] for handling all audio/video-related tasks. It replaces [PulseAudio][13], for **a more modern and flexible approach** to audio/video handling.

On the user side, you can take advantage of **better Bluetooth audio device management** , **lower latency** , **better interoperability with Wayland,** and more.

Users do have **the option to revert to PulseAudio** by following the same steps mentioned above for switching the windowing systems.

#### Raspberry Pi-Optimized Firefox

![][14]

For the first time, an **officially supported, Raspberry Pi-optimized version of[Mozilla Firefox][15]** is being made available through this release of Raspberry Pi OS.

Users can now utilize the **V4L2 codec support** **for** **using the hardware h.264 decoder** on their Raspberry Pi, which should help in **better HD video playback.**

They have also enabled [Widevine DRM][16] for **a hassle-free streaming experience** on major video streaming platforms.

There are a few other subtle changes in this release. Refer to the [official blog][17] to learn more.

### 📥 Download Raspberry Pi OS

As the changes to the operating system are significant, the developers recommend that you **start with a fresh installation** (re-image your SD card).

Sure, you can upgrade at your own risk.

You can head over to the [official website][18] to get started.

[Raspberry Pi OS][18]

_💬 Are you excited about the new Raspberry Pi OS upgrade? Let us know in the comments._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/raspberry-pi-os-bookworm/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/raspberry-pi-5/
[2]: https://news.itsfoss.com/content/images/2023/10/RaspberryPi_OS_Bookworm_1.png
[3]: https://news.itsfoss.com/debian-12-release/
[4]: https://wayland.freedesktop.org/
[5]: https://en.wikipedia.org/wiki/X_Window_System
[6]: https://github.com/WayfireWM/wayfire
[7]: https://en.wikipedia.org/wiki/Openbox
[8]: https://news.itsfoss.com/gnome-wayland-xorg/
[9]: https://fedoraproject.org/wiki/Changes/KDE_Plasma_6
[10]: https://news.itsfoss.com/content/images/2023/10/RaspberryPi_OS_Bookworm_2.png
[11]: https://networkmanager.dev/
[12]: https://pipewire.org/
[13]: https://www.freedesktop.org/wiki/Software/PulseAudio/
[14]: https://news.itsfoss.com/content/images/2023/10/RaspberryPi_OS_Bookworm_3.png
[15]: https://www.mozilla.org/en-US/firefox/new/
[16]: https://www.widevine.com/solutions/widevine-drm
[17]: https://www.raspberrypi.com/news/bookworm-the-new-version-of-raspberry-pi-os/
[18]: https://www.raspberrypi.com/software/operating-systems/
