[#]: subject: "EasyOS: An Experimental Distro With Unique Qualities"
[#]: via: "https://news.itsfoss.com/easyos/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

EasyOS: An Experimental Distro With Unique Qualities
======
EasyOS may not be for everyone, but it is an exciting distro to check
out.
Dubbed the “new paradigm” for a Linux distribution by its creator, EasyOS is a pretty unique distro that blends the best of [Puppy Linux][1] and Quirky, a variant of Puppy.

EasyOS's **development** **began back in 2017** , when its creator, Barry Kauler, came back after a break from his involvement in Puppy Linux.

Over the years, EasyOS has had plenty of releases, and with this article, we aim to show you what this distro is all about.

📋

Do keep in mind that this is an experimental distro that is constantly undergoing changes.

### EasyOS: Overview ⭐

![][2]

Designed from the get-go to be **container-friendly** , EasyOS is quite different from the usual Linux distros. It uses the RAM to handle most storage operations, resulting in **very fast app and container launches**.

The user also has the option to **run it off a flash drive** , without doing a full installation. And they can also **choose to save the session** by clicking on the 'Save' icon found on the desktop, or at system shutdown.

Another thing that sets it apart from other distros is the fact that **EasyOS is not offered as an ISO** , rather it is **provided as a .img file** that can be flashed onto a drive.

The rationale behind that move is that the ISO format has been around for a long time, and the **.img format allows the creator to be more flexible** with the maintenance overhead. You can read more about this [here][3].

Other than that, some of the most notable features of EasyOS include:

  * **A minimal user interface.**
  * **Designed to be very fast.**
  * **Roll-back/Roll-forward across version changes.**
  * **Four package managers.**



#### Initial Impressions

I tested EasyOS on a virtual machine setup via [Virtual Box 7.0][4], and my experience was good, except for one thing. More on that later; allow me to show you how this distro looks and feels.

**Suggested Read** 📖

![][5]

When I first booted into EasyOS, I was **welcomed by a quick-setup wizard** that had options to change the display resolution, time zone, network config, and other essential settings.

![][6]

I then proceeded to **configure the firewall** that was already pre-filled, with a generic firewall being set.

![][7]

Then there was the **sound card wizard** that promptly detected the sound card on my motherboard and allowed me to set the default output device.

![][8]

After all was set, I was welcomed by a cute-looking puppy with **essential first-launch info** regarding EasyOS. It covered various topics, starting from the desktop, all the way to network and storage.

![][9]

I then checked **out the package managers;** EasyOS features four of them!

The first one is **PKGget** , which is a traditional package manager featuring tarballs of various formats, such as **.deb** , **.rpm** , **.tar.xz** , and more.

The second one is **SFSget** , which handles large apps in a read-only format called 'SFS', and is mounted as a layer in EasyOS's layered file system.

The third one is **Appi** , which also has large apps but in the 'AppImage' format; the difference is that these are distro-independent and run in the main-file system without being installed.

And finally, the fourth one is **Flapi** , which is pretty similar to Appi but handles ' **Flatpaks** ' instead.

You can learn more about EasyOS's package manager system in its [documentation][10].

![][11]

After that, I checked out the **containers feature on EasyOS**. I was able to launch it from the 'kirkstone' option on the desktop.

The switch was almost instantaneous, with a keyboard shortcut being shown to switch back to the main desktop.

📋

The name 'kirkstone' might vary over different versions of EasyOS, look for the cute puppy logo instead.

![][12]

I then tried out the **EasyApps feature** , which allowed me to install apps in the container independently of the rest of the system.

![][13]

I chose to get Firefox, and after the download, I had the option to set it as the default web browser for the container.

I must say, that was pretty neat 😃 Of course, this is just a test, and you can have various use-cases with the container.

![][14]

And yeah, that was about it for my test of EasyOS; the overall user experience felt pretty solid after I got used to it.

I suggest you go through the detailed [blog post][15] by the creator of EasyOS to dive deeper into the inner workings of the distro.

You may be wondering, **what was that one thing that troubled me?**

Well, when I started out to test EasyOS on a VM, I had to convert the **.img** file into a **.vdi** file to run on VirtualBox.

I had to use [a workaround][16] to covert it, and if you are thinking of running it on a different hypervisor, you can ask around in EasyOS's [forum][17] or head to our forum to discuss with fellow Linux users.

![][18]

### 📥 Download EasyOS

You can grab the latest **.img** file for installing/running EasyOS on any type of storage drive from the [official release page][19] hosted on [Ibiblio][20].

For installation instructions, source code, and general info, you can refer to its [official website][21].

[EasyOS (Kirkstone)][22]

* * *

### More from It's FOSS...

  * Learn Bash scripting for FREE with this [Bash Tutorial series][23].
  * Join our [community forum][24].
  * 📩 Stay updated with the latest on Linux and Open Source. Get our [weekly Newsletter][25].



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/easyos/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://puppylinux-woof-ce.github.io/?ref=news.itsfoss.com
[2]: https://news.itsfoss.com/content/images/2023/07/EasyOS_1.jpg
[3]: https://easyos.org/about/why-the-iso-format-has-to-die.html?ref=news.itsfoss.com
[4]: https://news.itsfoss.com/virtualbox-7-0-release/
[5]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[6]: https://news.itsfoss.com/content/images/2023/07/EasyOS_2.jpg
[7]: https://news.itsfoss.com/content/images/2023/07/EasyOS_3.jpg
[8]: https://news.itsfoss.com/content/images/2023/07/EasyOS_4.jpg
[9]: https://news.itsfoss.com/content/images/2023/07/EasyOS_5.jpg
[10]: https://easyos.org/user/package-manager-concepts.html?ref=news.itsfoss.com
[11]: https://news.itsfoss.com/content/images/2023/07/EasyOS_6.jpg
[12]: https://news.itsfoss.com/content/images/2023/07/EasyOS_7.jpg
[13]: https://news.itsfoss.com/content/images/2023/07/EasyOS_8.jpg
[14]: https://news.itsfoss.com/content/images/2023/07/EasyOS_10.jpg
[15]: https://easyos.org/tech/how-easy-works.html?ref=news.itsfoss.com
[16]: https://ostechnix.com/how-to-convert-img-file-to-vdi-file-using-oracle-virtualbox/?ref=news.itsfoss.com
[17]: https://forum.puppylinux.com/viewforum.php?f=63&ref=news.itsfoss.com
[18]: https://itsfoss.community/uploads/default/optimized/1X/f274f9749e3fd8b4d6fbae1cf90c5c186d2f699c_2_180x180.png
[19]: https://distro.ibiblio.org/easyos/amd64/releases/?ref=news.itsfoss.com
[20]: https://www.ibiblio.org/?ref=news.itsfoss.com
[21]: https://easyos.org/?ref=news.itsfoss.com
[22]: https://distro.ibiblio.org/easyos/amd64/releases/kirkstone/?ref=news.itsfoss.com
[23]: https://linuxhandbook.com/tag/bash-beginner/
[24]: https://itsfoss.community/
[25]: https://itsfoss.com/newsletter/
