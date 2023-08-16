[#]: subject: "Rolling-Release Ubuntu-based Rhino Linux Has Landed"
[#]: via: "https://news.itsfoss.com/rhino-linux-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Rolling-Release Ubuntu-based Rhino Linux Has Landed
======
Rhino Linux is an interesting option to have!
You might remember us covering [last year][1] that Rhino Linux would be the successor of the now-defunct '[Rolling Rhino Remix][2]'.

After much waiting, its first stable release is here!

Let's dig in and see what Rhino Linux has to offer.

### Rhino Linux: What is it? 🦏

![][3]

Rhino Linux is an Ubuntu-based, **rolling release distro** that uses a **modified version of XFCE 4.18** , alongside **Pacstall** at its core, for a hassle-free user experience.

📋

A rolling-release distro receives regular software upgrades instead of being limited to maintenance fixes.

The inclusion of XFCE 4.18 enables Rhino Linux to take advantage of the various improvements on offer, such as **improvements to the Thunar file manager** , **enhanced desktop/panel** , and more.

You can check out our coverage on the same to know more.

![][4]

Then there's '[Pacstall][5]', which is an AUR-inspired package manager that handles everything starting from kernel installs, all the way to installing a web browser.

As all Rhino Linux-related packages are packaged as '[pacscript][6]', any OS updates can be done through Pacstall.

**So, how does the distro feel and behave?**

Well, when you first boot up into Rhino Linux, you are greeted with a very **clean and modern-looking quick-setup wizard** built using Rust.

![][7]

📋

We have a new **[Rust Basics Series][8]** on It's FOSS. You may check it out to explore Rust programming language.

When you proceed, you are given the option to choose from three distinct package managers: **Flatpak** , **Snap,** and **AppImage**.

![][9]

Such functionality is thanks to implementing their **custom package management wrapper** , 'rhino-pkg'. Which allows you to search, install, remove, and update packages from the various supported repositories.

In contrast to the latest official Ubuntu flavors, you have the freedom to have Flatpak enabled out-of-the-box.

Then there are the extra settings that you can opt to enable.

One is to enable the wonderful Python-based frontend for apt package management, '[Nala][10]'.

![][11]

**Suggested Read** 📖

![][12]

The other is '[Apport][13]', a crash reporting system, that lets the developers know of any issues with your installation in the event of a system crash.

When you finish that, you get to see a **very clean desktop layout** with a neat wallpaper, and a floating dock.

![][14]

They have dubbed their desktop as ' **The Unicorn Desktop** ' which has been built in-house with a heavily modified version of XFCE.

It aims to combine the best of both traditional and modern approaches for the desktop user experience.

![][15]

The Unicorn desktop also features a few free add-on software solutions, such as [**uLauncher**][16], **a** **replacement for spotlight search** , **lightpad as the new app launcher** , and **many other features**.

![][17]

You can read more about their customized desktop experience **[here][18]**.

Overall, the user experience seems relatively straightforward, and the Rhino-themed wallpaper looks lovely.

**Any other highlights?**

Yes!

This release has an interesting variant that I am excited to see.

It is a **Rhino Linux port for PinePhone devices** (the original one/Pro), based on the latest version of **Ubuntu Touch (20.04)** , it is the first XFCE-based mobile environment.

As you can see from the video shared by Oren Klopfer, who is working on this port, it's in a very work-in-progress state.

He intends to switch to XFCE 4.20 when it releases to get Wayland's support and do away with X11.

I can't wait to see how this turns out!

You can check out the [announcement blog][19] for more details on Rhino Linux.

### 📥 Get Rhino Linux

Three distinct editions are on offer; one is a **Generic ISO for x86_64/ARM64** , the aforementioned **PinePhone ISO** , and finally, the **Raspberry Pi ISO**.

Head over to the [official site][20] to get the ISO of your choice.

[Rhino Linux][20]

You can also build it from scratch using the source code in its [GitHub repo][21].

I am excited to see what Rhino Linux can achieve in the future ⭐

📢

_Follow us on[Mastodon][22], and join our [Telegram channel][23] for news like this._

* * *

### More from It's FOSS...

  * Learn Bash scripting for FREE with this [Bash Tutorial series][24].
  * Join our [community forum][25].
  * 📩 Stay updated with the latest on Linux and Open Source. Get our [weekly Newsletter][26].



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/rhino-linux-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/rhino-linux/
[2]: https://github.com/rollingrhinoremix?ref=news.itsfoss.com
[3]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_1.png
[4]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[5]: https://pacstall.dev/?ref=news.itsfoss.com
[6]: https://github.com/pacstall/pacstall/wiki/Pacscript-101?ref=news.itsfoss.com
[7]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_2.png
[8]: https://itsfoss.com/tag/rust/?ref=news.itsfoss.com
[9]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_3.png
[10]: https://itsfoss.com/nala/?ref=news.itsfoss.com
[11]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_4.png
[12]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[13]: https://wiki.ubuntu.com/Apport?ref=news.itsfoss.com
[14]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_5.png
[15]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_6.png
[16]: https://ulauncher.io/?ref=news.itsfoss.com
[17]: https://news.itsfoss.com/content/images/2023/05/Rhino_Linux_7.png
[18]: https://rhinolinux.org/unicorn.html?ref=news.itsfoss.com
[19]: https://rhinolinux.org/news-6.html?ref=news.itsfoss.com
[20]: https://rhinolinux.org/download.html?ref=news.itsfoss.com
[21]: https://github.com/rhino-linux?ref=news.itsfoss.com
[22]: https://mastodon.social/@itsfoss?ref=news.itsfoss.com
[23]: https://t.me/itsfoss_official?ref=news.itsfoss.com
[24]: https://linuxhandbook.com/tag/bash-beginner/
[25]: https://itsfoss.community/
[26]: https://itsfoss.com/newsletter/
