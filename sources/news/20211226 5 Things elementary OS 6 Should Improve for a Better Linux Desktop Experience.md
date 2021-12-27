[#]: subject: "5 Things elementary OS 6 Should Improve for a Better Linux Desktop Experience"
[#]: via: "https://news.itsfoss.com/elementary-os-6-things-to-improve/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 Things elementary OS 6 Should Improve for a Better Linux Desktop Experience
======

[elementary OS 6.1 is the latest release][1] with many essential improvements and new features.

Of course, the choice of a Linux distro for your system varies on many levels. However, I think there are a few things in elementary OS that could have been done differently.

Here, I list some of the aspects that could use some improvements in elementary OS.

_**Note that this is entirely my opinion, so take it with a pinch of salt.**_

### Things That Can Be Improved in elementary OS

If you are curious, I plan to point out things I don’t like for other distributions as well (starting with this).

It is usual to feature the good stuff but unless someone points out the potential nuances in a distro, you cannot really decide whether the distro is for you or not.

#### 1\. No Built-in Debian Package Installer

![][2]

Considering it as an Ubuntu-based distribution, downloading a deb file to only find that you cannot install, makes you look for solutions.

This makes sense because elementary OS switched to a Flatpak-only model with [elementary OS 6 release][3], even for the first-party applications.

However, new users are likely to be unaware of solutions like “**Eddy**” which is a Debian package installer and available in the AppCenter.

A notice/tip that points to you to the tool when you try installing a deb package should make it clear. Or, having Eddy pre-installed should make things convenient.

#### 2\. Flathub Support out of the box

![][4]

The Flatpak-first approach makes things more secure and convenient. However, you cannot install Flatpak applications via Flathub unless you manually add the third-party Flatpak repo (using the terminal).

Even though AppCenter features Flatpak applications, it may not be enough for all users. In contrast, Flathub offers a massive collection of Flatpaks.

While it is good to offer a first-party experience and give the ability to the user to enable third-party (Flathub) if required, but can something be done to easily enable the Flathub support without heading to the terminal? (ignoring the flatpak ref files)

![][5]

Well, I think a quick toggle switch to enable/disable out-of-the-box support for Flathub could make things better.

Or, mention the command along with the suggestion to enable Flathub as you noticed in the screenshots above.

#### 3\. Minimize button

![][6]

Considering elementary OS does not feature any auto-tiling window feature like Pop!_OS, the lack of minimize button on many applications could prove to be annoying.

Yes, you can utilize the keyboard shortcut **Super + H** to hide/minimize the window. However, for mouse-oriented users, it does not feel comfortable to not have a minimize button.

#### 4\. No System Tray Support

![][7]

As per their design choices, the elementary OS team thinks that its best to not have system tray support (or so I read as per some Reddit posts).

Unfortunately, the system tray icons are incredibly useful for quick access, and to keep an eye on the status of something.

For instance, I can quickly access the Flameshot screenshot tool from the app indicator icon, check sync status when using a tool like Insync, and also get informed when there is a message for me in Slack.

And, without the system tray icon integration support, I cannot do any of this, which is a deal-breaker.

#### 5\. A Separate NVIDIA ISO

![][8]

A separate NVIDIA ISO (or Nvidia graphics installation mode) is much more convenient than installing a proprietary Nvidia driver through the software center.

Sure, I did not have any issues installing Nvidia drivers using the AppCenter. But, with a separate ISO, you eliminate the additional step after installation.

### Wrapping Up

There are flaws in every operating system, a Linux distribution is not an exception.

Sometimes these nuances are there by design, as per their targeted users. You may or may not like everything that a distro does, which is why it is important to know what can they do better (or if it is suitable for you).

elementary OS is undoubtedly [one of the most beautiful Linux distributions][9] out there. But, is it the one for you?

Well, if some of the points that I mention do not bother you, it should be a great experience for you.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/elementary-os-6-things-to-improve/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/elementary-os-6-1-release/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU0NyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://news.itsfoss.com/elementary-os-6-release/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU1MSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjE5MCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUzMiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0NiIgd2lkdGg9IjM5MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM3OSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://itsfoss.com/beautiful-linux-distributions/
