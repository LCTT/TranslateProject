[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mirror your Android screen on your computer with Guiscrcpy)
[#]: via: (https://opensource.com/article/19/9/mirror-android-screen-guiscrcpy)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/holmjahttps://opensource.com/users/holmjahttps://opensource.com/users/rajaram121)

Mirror your Android screen on your computer with Guiscrcpy
======
Access your Android device from your PC with this open source
application based on scrcpy.
![Coding on a computer][1]

In the future, all the information you need will be just one gesture away, and it will all appear in midair as a hologram that you can interact with even while you're driving your flying car. That's the future, though, and until that arrives, we're all stuck with information spread across a laptop, a phone, a tablet, and a smart refrigerator. Unfortunately, that means when we need information from a device, we generally have to look at that device.

While not quite holographic terminals or flying cars, [guiscrcpy][2] by developer [Srevin Saju][3] is an application that consolidates multiple screens in one location and helps to capture that futuristic feeling.

Guiscrcpy is an open source (GNU GPLv3 licensed) project based on the award-winning [scrcpy][4] open source engine. With guiscrcpy, you can cast your Android screen onto your computer screen so you can view it along with everything else. Guiscrcpy supports Linux, Windows, and MacOS.

Unlike many scrcpy alternatives, Guiscrcpy is not a fork of scrcpy. The project prioritizes collaborating with other open source projects, so Guiscrcpy is an extension, or a graphical user interface (GUI) layer, for scrcpy. Keeping the Python 3 GUI separate from scrcpy ensures that nothing interferes with the efficiency of the scrcpy backend. You can screencast up to 1080p resolution and, because it uses ultrafast rendering and surprisingly little CPU, it works even on a relatively low-end PC.

Scrcpy, Guiscrcpy's foundation, is a command-line application, so it doesn't have GUI buttons to handle gestures, it doesn't provide a Back or Home button, and it requires familiarity with the [Linux terminal][5]. Guiscrcpy adds GUI panels to scrcpy, so any user can run it—and cast and control their device—without sending any information over the internet. Everything works over USB or WiFi (using only a local network). Guiscrcpy also adds a desktop launcher to Linux and Windows systems and provides compiled binaries for Linux and Windows.

### Installing Guiscrcpy

Before installing Guiscrcpy, you must install its dependencies, most notably scrcpy. Possibly the easiest way to install scrcpy is with [snap][6], which is available for most major Linux distributions. If you have snap installed and active, then you can install scrcpy with one easy command:


```
`$ sudo snap install scrcpy`
```

While it's installing, you can install the other dependencies. The [Simple DirectMedia Layer][7] (SDL 2.0) toolkit is required to display and interact with the phone screen, and the [Android Debug Bridge][8] (adb) command connects your computer to your Android phone.

On Fedora or CentOS:


```
`$ sudo dnf install SDL2 android-tools`
```

On Ubuntu or Debian:


```
`$ sudo apt install SDL2 android-tools-adb`
```

In another terminal, install the Python dependencies:


```
`$ python3 -m pip install -r requirements.txt --user`
```

### Setting up your phone

For your phone to accept an adb connection, it must have Developer Mode enabled. To enable Developer Mode on Android, go to **Settings** and select **About phone**. In **About phone**, find the **Build number** (it may be in the **Software information** panel). Believe it or not, to enable Developer Mode, tap **Build number** seven times in a row.

![Enabling Developer Mode][9]

For full instructions on all the many ways you can configure your phone for access from your computer, read the [Android developer documentation][10].

Once that's set up, plug your phone into a USB port on your computer (or ensure that you've configured it correctly to connect over WiFi).

### Using guiscrcpy

When you launch guiscrcpy, you see its main control window. In this window, click the **Start scrcpy** button. This connects to your phone, as long as it's set up in Developer Mode and connected to your computer over USB or WiFi.

![Guiscrcpy main screen][11]

It also includes a configuration-writing system, where you can write a configuration file to your **~/.config** directory to preserve your preferences between uses.

The bottom panel of guiscrcpy is a floating window that helps you perform basic controlling actions. It has buttons for Home, Back, Power, and more. These are common functions on Android devices, but an important feature of this module is that it doesn't interact with scrcpy's SDL, so it can function with no lag. In other words, this panel communicates directly with your connected device through adb rather than scrcpy.

![guiscrcpy's bottom panel][12]

The project is in active development and new features are still being added. The latest build has an interface for gestures and notifications.

With guiscrcpy, you not only _see_ your phone on your screen, but you can also interact with it, either by clicking the SDL window itself, just as you would tap your physical phone, or by using the buttons on the panels.

![guiscrcpy running on Fedora 30][13]

Guiscrcpy is a fun and useful application that provides features that ought to be official features of any modern device, especially a platform like Android. Try it out yourself, and add some futuristic pragmatism to your present-day digital life.

We took a look at 12 of the best open source Android games in the F-Droid repository.

All six apps are available from the F-Droid repository and licensed under the GPLv3, providing an...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/mirror-android-screen-guiscrcpy

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/holmjahttps://opensource.com/users/holmjahttps://opensource.com/users/rajaram121
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://github.com/srevinsaju/guiscrcpy
[3]: http://opensource.com/users/srevinsaju
[4]: https://github.com/Genymobile/scrcpy
[5]: https://www.redhat.com/sysadmin/navigating-filesystem-linux-terminal
[6]: https://snapcraft.io/
[7]: https://www.libsdl.org/
[8]: https://developer.android.com/studio/command-line/adb
[9]: https://opensource.com/sites/default/files/uploads/developer-mode.jpg (Enabling Developer Mode)
[10]: https://developer.android.com/studio/debug/dev-options
[11]: https://opensource.com/sites/default/files/uploads/guiscrcpy-main.png (Guiscrcpy main screen)
[12]: https://opensource.com/sites/default/files/uploads/guiscrcpy-bottompanel.png (guiscrcpy's bottom panel)
[13]: https://opensource.com/sites/default/files/uploads/guiscrcpy-screenshot.jpg (guiscrcpy running on Fedora 30)
