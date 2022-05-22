[#]: subject: "How to Enable Minimize, Maximize Window Buttons in elementary OS"
[#]: via: "https://www.debugpoint.com/2021/08/enable-minimize-maximize-elementary/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Enable Minimize, Maximize Window Buttons in elementary OS
======
This is how you can enable the Minimize, Maximize window buttons in elementary OS.

Many people (mostly new users to elementary OS) asks these questions in various forums:

1. How do I enable minimize buttons in elementary OS?
2. How to I enable restore, minimize, maximize?
3. Is it possible to bring back the minimize and maximize buttons?

And they are completely valid questions, and It’s okay to ask questions. Right? This guide to help them to get those buttons in elementary OS.

The Pantheon desktop which is used by elementary OS does not come with default standard window buttons. The reason primarily being a different concept of handling user behavior and activities via Dock and Application menu. Arguably, this design or implementation of this behavior mimics macOS.

That said, many users prefers the window buttons because it is a “muscle-memory'” thing and some migrated from other desktop environments, even windows.

Although elementary doesn’t provide you this as a default settings, you can still enable it. Here’s how.

### Enable minimize maximize Buttons – elementary OS

Open a terminal and install the software properties common which is required for adding a PPA. By default, this package is not installed in elementary OS (don’t ask me why, seriously?).

```
sudo apt install software-properties-common
```

#### elementary OS 6 Odin

The Tweak tool is renamed with a new name and being developed separately. It is called [Pantheon Tweaks][1]. And using the following commands you can install it.

```
sudo add-apt-repository -y ppa:philip.scott/pantheon-tweaks
sudo apt install -y pantheon-tweaks
```

#### elementary OS 5 Juno and below

If you are using elementary OS 5 June and below, you can install the earlier [elementary-tweaks][2] using the same PPA. Follow the below commands from terminal.

```
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo apt install -y elementary-tweaks
```

#### Change the settings

* After installation, click on the Application at the top bar and open System Settings.In the System settings window, click on Tweaks under Personal section.
* In the Tweaks window, go to Appearance section.
* Under Window Controls, select Layout: Windows.

![enable minimize maximize buttons elementary OS][3]

* And you should have the minimized, maximize and close button on the right side of the top window bar.

There are other combinations as well, such as Ubuntu, macOS, etc. You can choose whatever you feel like:

![Other Options of Window buttons in elementary][4]

This step completes the guide. There are other options in gsettings which you may try to use, but the window manager gala recently removed those options. Hence, they may not work at the moment.

I hope this guide helps you to enable minimize maximize buttons elementary OS. Let me know in the comment box below if you need any help.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/enable-minimize-maximize-elementary/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://github.com/pantheon-tweaks/pantheon-tweaks
[2]: https://github.com/elementary-tweaks/elementary-tweaks
[3]: https://www.debugpoint.com/wp-content/uploads/2021/08/enable-minimize-maximize-buttons-elementary-OS.png
[4]: https://www.debugpoint.com/wp-content/uploads/2021/08/Other-Options-of-Window-buttons-in-elementary.jpg
