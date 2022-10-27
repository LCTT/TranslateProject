[#]: subject: (How to Install Nvidia Drivers on Linux Mint [Beginner’s Guide])
[#]: via: (https://itsfoss.com/nvidia-linux-mint/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install Nvidia Drivers on Linux Mint [Beginner’s Guide]
======

[Linux Mint][1] is a fantastic Ubuntu-based Linux distribution that aims to make it easy for newbies to experience Linux by minimizing the learning curve.

Not just limited to being one of the [best beginner-friendly Linux distros][2], it also does a [few things better than Ubuntu][3]. Of course, if you’re using Linux Mint like I do, you’re probably already aware of it.

We have many beginner-focused Mint tutorials on It’s FOSS. Recently some readers requested help with Nvidia drivers with Linux Mint and hence I came up with this article.

I have tried to mention different methods with a bit of explaining what’s going on and what you are doing in these steps.

But before that, you should know this:

  * Nvidia has two categories of drivers. Open source drivers called Nouveau and proprietary drivers from Nvidia itself.
  * Most of the time, Linux distributions install the open source Nouveau driver and you can manually enable the proprietary drivers.
  * Graphics drivers are tricky things. For some systems, Nouveau works pretty well while for some it could create issues like blank screen or poor display. You may switch to proprietary drivers in such cases.
  * The proprietary driver from Nvidia has different version numbers like 390, 450, 460. The higher the number, the more recent is the driver. I’ll show you how to change between them in this tutorial.
  * If you are opting for proprietary drivers, you should go with the latest one unless you encounter some graphics issue. In those cases, opt for an older version of the driver and see if that works fine for you.



Now that you have some familiarity with the terms, let’s see how to go about installing Nvidia drivers on Linux Mint.

### How to Install Nvidia Drivers on Linux Mint: The Easy Way (Recommended)

Linux Mint comes baked in with a [Driver Manager][4] which easily lets you choose/install a driver that you need for your hardware using the GUI.

By default, you should see the open-source [xserver-xorg-video-nouveau][5] driver for Nvidia cards installed, and it works pretty well until you start playing a high-res video or want to play a [game on Linux][6].

So, to get the best possible experience, proprietary drivers should be preferred.

You should get different proprietary driver versions when you launch the Driver Manager as shown in the image below:

![][7]

Basically, the higher the number, the latest driver it is. At the time of writing this article, driver **version 460** was the latest recommendation for my Graphics Card. You just need to select the driver version and hit “**Apply Changes**“.

Once done, all you need to do is just reboot your system and if the driver works, you should automatically get the best resolution image and the refresh rate depending on your monitor for the display.

For instance, here’s how it looks for me (while it does not detect the correct size of the monitor):

![][8]

#### Troubleshooting tips

Depending on your card, the list would appear to be different. So, **what driver version should you choose?** Here are some pointers for you:

  * The latest drivers should ensure compatibility with the latest games and should technically offer better performance overall. Hence, it is the recommended solution.
  * If the latest driver causes issues or fails to work, choose the next best offering. For instance, version 460 didn’t work, so I tried applying driver version 450, and it worked!



Initially, in my case (**Linux Mint 20.1** with **Linux Kernel 5.4**), the latest driver 460 version did not work. Technically, it was successfully installed but did not load up every time I booted.

**What to do if drivers fail to load at boot**

_How do you know when it does not work?_ You will boot up with a low-resolution screen, and you will be unable to tweak the resolution or the refresh rate of the monitor.

It will also inform you about the same in the form of an error:

![][9]

Fortunately, a solution from [Linux Mint’s forum][10] solved it for me. Here’s what you need to do:

1\. Access the modules file using the command:

```
xed admin:///etc/modules
```

2\. You’ll be prompted to authenticate the access with your account password. Once done, you just need to add the following lines at the bottom:

```
nvidia
nvidia-drm
nvidia-modeset
```

Here’s what it looks like:

![][11]

If that doesn’t work, you can launch the Driver Manager and opt for another version of Nvidia driver. It’s more of a hit and try.

### Install Nvidia Driver Using the Terminal (Special Use-Cases)

For some reasons, if you are not getting the latest drivers for your Graphics Card using the Driver Manager, opting for the terminal method could help.

It may not be the safest way to do it, but I did not have any issues installing the latest Nvidia driver 460 version.

I’ll always recommend sticking to the Driver Manager app unless you have your reasons.

To get started, first you have to check the available drivers for your GPU. Type in the following command to get the list:

```
ubuntu-drivers devices
```

Here’s how it looks in my case:

![][12]

**non-free** refers to the proprietary drivers and **free** points at the open-source nouveau Nvidia drivers.

As mentioned above, usually, it is preferred to try installing the recommended driver. In order to do that, you just type in:

```
sudo ubuntu-drivers autoinstall
```

If you want something specific, type in:

```
sudo apt install nvidia-driver-450
```

You just have to replace “**450**” with the driver version that you want and it will install the driver in the same way that you install an application via the terminal.

Once installed, you just need to restart the system or type it in the terminal:

```
reboot
```

**To check the Nvidia driver version and verify the installation, you can type the following command in the terminal:**

```
nvidia-smi
```

Here’s how it may look like:

![][13]

To remove the driver and its associated dependencies, simply mention the exact version of the driver:

```
sudo apt remove nvidia-driver-450
sudo apt autoremove
```

And, simply reboot. It should fallback to use the open-source nouveau driver.

install the open-source driver using the following command and then reboot to revert to the default open-source driver:

```
sudo apt install xserver-xorg-video-nouveau
```

### Installing Nvidia Drivers using the .run file from Official Website (Time Consuming/Not Recommended)

Unless you want the latest version of the driver from the official website or just want to experiment the process, you can opt to download the file (.run) and install it.

To proceed, you need to first disable the X server and then install the Nvidia driver which could turn out to be troublesome and risky.

You can follow the [official documentation][14] if you want to explore this method, but you may not need it at all.

### Wrapping Up

While it’s easy to install Nvidia drivers in Linux Mint, occasionally, you might find something that does not work for your hardware.

If one driver version does not work, I’d suggest you to try other available versions for your Graphics Card and stick to the one that works. Unless you’re gaming and want the latest software/hardware compatibility, you don’t really need the latest Nvidia drivers installed.

Feel free to share your experiences with installing Nvidia drivers on Linux Mint in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nvidia-linux-mint/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://linuxmint.com/
[2]: https://itsfoss.com/best-linux-beginners/
[3]: https://itsfoss.com/linux-mint-vs-ubuntu/
[4]: https://github.com/linuxmint/mintdrivers
[5]: https://nouveau.freedesktop.org/
[6]: https://itsfoss.com/linux-gaming-guide/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/linux-mint-driver-manager.jpg?resize=800%2C548&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/linux-mint-display-settings.jpg?resize=800%2C566&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/linux-mint-no-driver.jpg?resize=593%2C299&ssl=1
[10]: https://forums.linuxmint.com/viewtopic.php?p=1895521#p1895521
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/etc-modules-nvidia.jpg?resize=800%2C587&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/linux-mint-device-drivers-list.jpg?resize=800%2C506&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/nvidia-smi.jpg?resize=800%2C556&ssl=1
[14]: https://download.nvidia.com/XFree86/Linux-x86_64/440.82/README/installdriver.html
