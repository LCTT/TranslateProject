[#]: subject: "I Ditched Ubuntu for Manjaro: Here’s What I Think After a Week"
[#]: via: "https://news.itsfoss.com/manjaro-linux-experience/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

I Ditched Ubuntu for Manjaro: Here’s What I Think After a Week
======

Primarily, I rely on Ubuntu-based distributions like Pop!_OS, Zorin OS, Linux Mint, or Ubuntu itself for work.

They get out of the way when I work on something, along with seamless software updates. Not to forget, they get along well with my Intel-Nvidia-powered system.

Everything (can be subjective) works out of the box.

However, I recently decided to switch to Arch Linux on bare metal (because I mostly used it on virtual machines).

And then, I ended up using **Manjaro Linux** (an Arch-based distro).

### Here’s Why I Picked Manjaro Linux

To my surprise, I couldn’t even get past the “_nouveau DRM: core notifier timeout_” error, let alone proceed with the installation when using a **live USB for Arch Linux**. Yes, I’m aware of the [guided installer with Arch Linux][1], but the connected displays just kept on flickering, highlighting this error, no matter what.

The best solution to this problem was not to get an NVIDIA card with my recent upgrade.

_Too bad, I prefer Nvidia GPUs…_

AMD’s RX 6600 XT is similarly priced to RTX 3060 Ti; it did not make sense to get that card for 1440p.

So, yes, RTX 3060 Ti can be the problem in my case.

While I found some methods to troubleshoot the issue, I was too lazy. I just wanted to see if I could experience Arch Linux without putting in a great effort.

**So, here’s what I did:**

The next-best option would be to try any of the [best Arch-based distros][2] tailored to make things easy, right?

And that’s where **Manjaro Linux** comes in.

Manjaro Linux is a popular Arch-based distro, and I’ve noticed regular improvements to it with every update (while using it on a VM).

Furthermore, I like Manjaro’s default theme accent color for my desktop experience.

So, I decided to give it a try…

### Manjaro Linux: Rough Start

![][3]

I did not have any issues installing Manjaro with proprietary Nvidia drivers. However, a recent point update, i.e., **Manjaro Linux 21.2.6,** messed up the system.

I couldn’t access the login screen and the [TTY][4] (all I could see was the motherboard’s manufacturer logo)

So, I had to re-install Manjaro Linux using the latest ISO, and so far, so good (touch wood).

And during my usage of Manjaro Linux, I noticed a few things that make up for its good and bad points.

Here, I highlight some of my experiences. These insights should help you explore more about it if you haven’t tried it yet.

#### 1\. Easy Installation

The primary highlight of an Arch-based distro is to make things easy to set up. And I had no issues whatsoever.

It was a breeze installing Manjaro Linux on my secondary drive. The bootloader was correctly configured to display the Manjaro-themed boot menu that lets me select Windows/Manjaro Linux for dual-boot.

#### 2\. Manjaro Hello

![][5]

The welcome experience makes up for a significant part of a user experience when trying something new. And Manjaro Linux does not disappoint in this regard.

You get all the essential information if you pay close attention to the information available via the welcome screen.

The GNOME Layouts Manager lets you pick a suitable layout to get yourself comfortable.

![][6]

However, I couldn’t get the “**Window Tiling**” functionality working when I tried to enable it here:

![][7]

#### 3\. Package Manager is Fast and Versatile

![][8]

Considering that GNOME is my favorite desktop environment, I have had terrible experiences with the software center (or even with distro-specific stores like Pop!_Shop).

While they get the work done, sometimes they do not respond or aren’t responsive enough as I expect them to be.

With Manjaro Linux, I found [Pamac][9] installed as the package manager. It seems to be one of the [best ways to install and remove software on Manjaro Linux][10].

In my experience, it was blazing fast with installations and removing packages. You also get prompts for conflicts in packages or if something needs to be replaced/removed. The package manager gives plenty of information about the optional/required dependencies when you install something.

Overall, it was a pretty good experience without any slowdowns. To sweeten the experience, the package manager lets you quickly enable the support for **Flatpaks/Snaps/AUR** by tweaking the preferences of pamac.

![][11]

So, you do not have to use the terminal or different software stores. Everything will be available under a single roof, which is a big time saver.

#### 4\. Trying out the ZSH Shell

![][12]

I am used to the bash shell on Ubuntu-based distros. However, Manjaro Linux features the ZSH shell by default. I believe ZSH is better than bash, but I’ll take a deep dive into the comparison with a separate article soon.

In other words, I get to try something different out of the box. To my excitement, the terminal prompt and the theme for the shell (or the terminal) that follows the Manjaro branding accent colors look pretty impressive!

![][12]

Hence, I do not need to [customize the look of the terminal here][13].

To explore more, you might want to check some of our resources on [what ZSH is][14] and [how to install it][15].

#### 5\. Lack of Official Software Support

![][16]

I hope this improves soon. But, as of now, many software/utilities offer direct support for Ubuntu and Fedora only.

You can find official DEB/RPM packages for various tools, but neither will work directly with Manjaro Linux.

You will have to rely on the packages available in Arch Linux repositories or [AUR][17].

Fortunately, there are good chances to find the software in AUR or their repositories maintained by the community or distro developers. Just like I was able to get [Insync][18] (_affiliate link_) to work on Manjaro Linux with file manage integration extensions available.

However, without official support for the platform, you may/may not miss out on some features or quick updates.

Of course, if you rely on [Flatpak][19] or Snap packages, it should not be an issue for you. Furthermore, if you are new to Linux, you can refer to our [Flatpak guide][20] for more information.

#### 6\. No Fractional Scaling

I have a dual-monitor setup with 1080p + 1440p resolutions. So, fractional scaling helps, but I can manage without it.

To enable fractional scaling on Manjaro, you will have to install x11-scaling enabled packages for Mutter and GNOME control center. The packages include:

  * **mutter-x11-scaling** 
  * **gnome-control-center-x11-scaling**



This will replace your existing mutter and gnome control center packages. So, you will lose the default theme/accent settings for your desktop.

You may have to utilize GNOME Tweaks to get things right. But, it can turn out to be an annoying experience.

### Final Thoughts

Overall, I enjoy the desktop experience with Manjaro Linux. If another system update doesn’t break the experience, I think I will continue with Manjaro Linux as my new daily driver.

_What do you think are the strong/weak points for Manjaro Linux? Did I miss something as part of my new experience? Do you have any suggestions as an experienced Arch Linux user?_

_Please let me know your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/manjaro-linux-experience/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/arch-new-guided-installer/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjkwMCIgd2lkdGg9IjE2MDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[4]: https://itsfoss.com/what-is-tty-in-linux/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjcxMyIgd2lkdGg9IjkzNSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY1MSIgd2lkdGg9Ijg1MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY3MyIgd2lkdGg9Ijg1MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYwMiIgd2lkdGg9IjEwMDIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[9]: https://wiki.manjaro.org/index.php/Pamac
[10]: https://itsfoss.com/install-remove-software-manjaro/
[11]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYyOCIgd2lkdGg9IjY5MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[12]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYwMSIgd2lkdGg9Ijc4OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[13]: https://itsfoss.com/customize-linux-terminal/
[14]: https://linuxhandbook.com/why-zsh/
[15]: https://linuxhandbook.com/install-zsh/
[16]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYxNyIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[17]: https://itsfoss.com/aur-arch-linux/
[18]: https://itsfoss.com/recommends/get-insync/
[19]: https://itsfoss.com/what-is-flatpak/
[20]: https://itsfoss.com/flatpak-guide/
