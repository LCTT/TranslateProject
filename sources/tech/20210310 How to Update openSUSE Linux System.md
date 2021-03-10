[#]: subject: (How to Update openSUSE Linux System)
[#]: via: (https://itsfoss.com/update-opensuse/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Update openSUSE Linux System
======

I have been an Ubuntu user for as long as I remember. I distrohopped a little but keep on coming back to Ubuntu. But recently, I have started using openSUSE to try something non-Debian.

As I keep exploring [openSUSE][1], I keep on stumbling upon things that are slightly different in SUSE-worse and I plan to cover them in tutorials on It’s FOSS.

As a first, I am writing about updating openSUSE system. There are two ways you can do that:

  * Using terminal (valid for openSUSE desktops and servers)
  * Using a graphical tool (valid for openSUSE desktops)



### Update openSUSE via command line

The simplest way to update openSUSE is by using the zypper command. It provides full functionality of patches and updates management. It takes care of the file conflicts and dependency problems. The updates also include Linux kernel.

If you are using openSUSE Leap, use this command:

```
sudo zypper update
```

You may also use `up` instead of `update` but I find it easier to remember.

If you are using openSUSE Tumbleweed, use the `dist-upgrade` or `dup` (in short). Tumbleweed is [rolling release distribution][2] and hence it is advised to use dist-upgrade option.

```
sudo zypper dist-upgrade
```

It will show you the list of the packages to be upgraded, removed or installed.

![][3]

You’ll be notified if your system requires reboots.

If you just want to refresh the repositories (like sudo apt update), you may use this command:

```
sudo zypper refresh
```

If you want to list the available updates, you can also do that:

```
sudo zypper list-updates
```

### Graphical way to update openSUSE

If you are using openSUSE as a desktop, you’ll have the additional option of using the GUI tools for installing the updates. This tool may change depending on [which desktop environment you are using][4].

For example, KDE has its own Software center called Discover. You can use it to search and install new applications. You can also use it to install system updates.

![][5]

In fact, KDE notifies you of available system updates in the notification area. You’ll have to open Discover explicitly because clicking on the notification doesn’t automatically take you to Discover.

![][6]

If you find that annoying, you may disable it using these commands:

```
sudo zypper remove plasma5-pk-updates
sudo zypper addlock plasma5-pk-updates
```

I wouldn’t recommend it though. It’s better to get notified of available updates.

There is also the YAST Software Management [GUI tool][7] which you can use for more granular control on package managements.

![][8]

That’s it. It was a short one. In the next SUSE tutorial, I’ll show you some common zypper commands with examples. Stay tuned.

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-opensuse/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.opensuse.org/
[2]: https://itsfoss.com/rolling-release/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/update-opensuse-with-zypper.png?resize=800%2C406&ssl=1
[4]: https://itsfoss.com/find-desktop-environment/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/opensuse-update-gui.png?resize=800%2C500&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/update-notification-opensuse.png?resize=800%2C259&ssl=1
[7]: https://itsfoss.com/gui-cli-tui/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/yast-software-management-suse.png?resize=800%2C448&ssl=1
