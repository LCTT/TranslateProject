[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 Essential Things To Do After Installing Manjaro Linux)
[#]: via: (https://itsfoss.com/things-to-do-after-installing-manjaro/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

6 Essential Things To Do After Installing Manjaro Linux
======

So, you just did a [fresh installation of Manjaro Linux][1]. Now what?

Here are a few essential post installation steps I recommend you to follow.

Quite honestly, these are the things I prefer to do after installing Manjaro. Yours could differ depending on your need.

### Recommended Things To Do After Installing Manjaro Linux

![][2]

I am using Manjaro Xfce edition but the steps are applicable to other desktop variants of [Manjaro][3] as well.

#### 1\. Set the fastest mirror

Before even updating your system, I suggest to sort out your mirror list first. When refreshing the Manjaro system and downloading software from repositories, an optimized mirror list can have noticeable performance impact to the system.

Open the Terminal emulator and type the following command:

```
sudo pacman-mirrors --fasttrack
```

![][4]

#### 2\. Update your system

Keeping your system up-to-date reduces the chances of security vulnerabilities. Refreshing your system repository is also a recommended thing to do before installing new software.

You can [update your Manjaro system][5] by running the following command.

```
sudo pacman -Syu
```

![][6]

#### 3\. Enable AUR, Snap or Flatpak support

[Arch User Repository (AUR)][7] is one of the main reasons that a user chooses an [Arch-based system][8]. It gives you access to a huge number of additional software.

Optionally, you can also enable support for [Snaps][9] and [Flatpaks][10] directly from Pamac GUI package manager.

![][11]

#### 4\. Enable TRIM (SSD only)

If your root partition has been installed on SSD, enabling [TRIM][12] is one thing you need to do after installing Manjaro. TRIM helps to clean blocks in your SSD and extend the lifespan of your SSD.

To enable TRIM on Manjaro, run the following command in a terminal:

```
sudo systemctl enable fstrim.timer
```

![][13]

#### 5\. Installing a kernel of your choice (advanced users)

One of the topics that I covered in my [Manjaro Linux review][14], is how easily you can switch kernels through a graphical interface.

Do you prefer to use the command line? You can list the installed kernel(s) on your system and install a kernel using your terminal.

To list the installed kernels:

```
mhwd-kernel -li
```

**To install a new kernel** (the latest to date 5.8 kernel for example)**:**

```
sudo mhwd-kernel -i linux58
```

![][15]

#### 6\. Install Microsoft true type fonts (if you need it)

I have to often edit the work documents on my personal computer and hence I need the Microsoft fonts like Times New Roman or Arial.

If you also need to use Microsoft fonts, you can access the [package][16] from [AUR][7]. If you want to use the command line for AUR packages, you can install an [AUR helper][17].

![][18]

#### Conclusion

[Manjaro is a great distribution][19] if you want to use the benefits of Arch Linux on a pre-configured, desktop optimized distribution. Though it comes pre-configured with many essentials, there are a few steps that cannot be done in advance, as everyone has a different setup and different needs.

Please let us know in the comments below, which step apart from the already mentioned is the essential for you.

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-manjaro/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-manjaro-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/things-to-do-after-installing-manjaro.jpg?resize=800%2C450&ssl=1
[3]: https://manjaro.org
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/manjaro-fasttrack.png?resize=800%2C600&ssl=1
[5]: https://itsfoss.com/update-arch-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/sudo-pacman-Syu.png?resize=800%2C504&ssl=1
[7]: https://itsfoss.com/aur-arch-linux/
[8]: https://itsfoss.com/arch-based-linux-distros/
[9]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/pamac-2.png?resize=800%2C600&ssl=1
[12]: https://en.wikipedia.org/wiki/Trim_(computing)
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/fstrim.timer_.png?resize=800%2C600&ssl=1
[14]: https://itsfoss.com/manjaro-linux-review/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/manjaro-cli-kernels.png?resize=800%2C600&ssl=1
[16]: https://aur.archlinux.org/packages/ttf-ms-fonts
[17]: https://itsfoss.com/best-aur-helpers/
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/ttf-ms-fonts.png?resize=800%2C600&ssl=1
[19]: https://itsfoss.com/why-use-manjaro-linux/
