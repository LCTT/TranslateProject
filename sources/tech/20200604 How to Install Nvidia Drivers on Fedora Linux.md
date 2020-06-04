[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Nvidia Drivers on Fedora Linux)
[#]: via: (https://itsfoss.com/install-nvidia-drivers-fedora/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

How to Install Nvidia Drivers on Fedora Linux
======

Like most Linux distributions, [Fedora][1] does not come with the proprietary [Nvidia][2] drivers installed by default.

The default open source [Nouveau driver][3] works in most situations, but you may encounter issues like screen tearing with it.

![Display issue in Fedora with Nouveau graphics driver][4]

If you encounter such graphics/video issues, you may want to install the official proprietary Nvidia drivers in Fedora. Let me show you how to do that.

### Installing Nvidia drivers in Fedora

I am using [Fedora 32][5] in this tutorial but it should be applicable to other Fedora versions.

#### Step 1

Before you do anything else, make sure that your system is up-to-date. You can either use the Software Center or use the following command in the terminal:

```
sudo dnf update
```

#### Step 2

Since Fedora doesn’t ship the Nvidia driver, you need to add the [RPMFusion repos][6] to your system. You can use the following command in the terminal

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Don’t like terminal? Use GUI method to add RPMFusion repository

If you are using Firefox, you can also add the RPMFusion repositories from your browser. Go to the [Configuration page][7] and scroll down to the “Graphical Setup via Firefox web browser” section. Click the link for the free and then the nonfree repo. This will download the .rpm file, which will eventually install the repository.

![RPMFusion Browser Installation][8]

You can double click on the downloaded RPM file to install it.

![RPMFusion in the Software Center][9]

#### Step 3

Now you need to determine [what graphics card (or chip) you have in your Linux system][10]. Pull up the terminal and enter the following command:

```
lspci -vnn | grep VGA
```

![Video Card Lookup in Fedora][11]

Next, you need to look up what driver corresponds to that chip. You can find a list of the Nvidia chips [here][12]. You can also use [this tool][13] to search for your device.

**Note**: Keep in mind that there are only three drivers available to install, even though the Nvidia list shows more. The most recent cards are supported by the Nvidia driver. Old devices are supported by the nvidia-390 and nvidia-340 drivers.

#### Step 4

To install the required driver, enter one of the commands into the terminal. The following command is the one I had to use for my card. Update as appropriate for your system.

```
sudo dnf install akmod-nvidia sudo dnf install xorg-x11-drv-nvidia-390xx akmod-nvidia-390xx sudo dnf install xorg-x11-drv-nvidia-340xx akmod-nvidia-340xx
```

![Nvidia terminal installation][14]

#### Step 5

To make the changes take effect, reboot your system. It might take longer for your system to reboot because it is injecting the Nvidia driver into the Linux kernel.

Once you log in to your system after reboot, you should have a better visual performance and no screen tearing.

![Fedora with Nvidia drivers][15]

#### Bonus Tip:

This is an optional step but it is recommended. When you add the RPMFusion repos, you get access to multimedia packages that are not available in the regular repos.

This command will install packages for applications that use [gstreamer][16]:

```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```

This command will install packages needed by sound and video packages:

```
sudo dnf groupupdate sound-and-video
```

Hopefully, you find this tutorial useful in installing Nvidia drivers on Fedora. What other Fedora tutorials would you like to see on It’s FOSS?

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-nvidia-drivers-fedora/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://getfedora.org/
[2]: https://www.nvidia.com/en-us/
[3]: https://en.wikipedia.org/wiki/Nouveau_(software)
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/fedora-nouveau.jpg?resize=800%2C500&ssl=1
[5]: https://itsfoss.com/fedora-32/
[6]: https://rpmfusion.org/RPM%20Fusion
[7]: https://rpmfusion.org/Configuration
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/rpmfusion-gui-install.png?resize=800%2C500&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/rpmfusion-gui-install2.png?resize=800%2C500&ssl=1
[10]: https://itsfoss.com/check-graphics-card-linux/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/video-card-lookup-fedora.png?ssl=1
[12]: https://us.download.nvidia.com/XFree86/Linux-x86/367.57/README/supportedchips.html
[13]: https://www.nvidia.com/Download/index.aspx?lang=en-us
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/nvidia-cli-install.png?resize=800%2C500&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/fedora-nvidia.jpg?resize=800%2C500&ssl=1
[16]: https://en.wikipedia.org/wiki/GStreamer
