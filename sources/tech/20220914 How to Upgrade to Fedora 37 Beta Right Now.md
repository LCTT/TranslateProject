[#]: subject: "How to Upgrade to Fedora 37 Beta Right Now"
[#]: via: "https://itsfoss.com/upgrade-to-fedora-beta/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Upgrade to Fedora 37 Beta Right Now
======

Fedora 37 will be releasing next month. Fedora 37 beta is already released and it features the [awesome new GNOME 43][1].

If you are running Fedora 36 right now and want to enjoy GNOME 43 and [all the other features that come with Fedora 37][2], you can easily do that.

In this tutorial, I’ll show the steps for upgrading to Fedora 37 beta using terminal as well as the GUI method.

**Keep in mind that you cannot downgrade to Fedora 36 the same way you upgraded to Fedora 37. You’ll have to reinstall it.**

### Upgrade to Fedora beta via command line

Unlike [upgrading to beta version in Ubuntu][3], Fedora doesn’t need additional steps to exclusively mention that you are looking for a pre-release version upgrade. The steps are the same as upgrading to any Fedora stable version. Fedora presumes that you know what you are asking for.

With that information, it’s time to see the steps of the upgrade procedure.

The first step is to upgrade all the installed packages to the latest available version. Normally, it should not take long if you [update your Fedora system][4] regularly.

```
sudo dnf upgrade --refresh
```

Then, install the system upgrade plugin for DNF if not already installed. This will be quick.

```
sudo dnf install dnf-plugin-system-upgrade
```

At this step, you should provide the number of version you are upgrading. In this case, you are looking to upgrade to Fedora 37, so instruct your system to download the release of Fedora 37 with `releasever=37`.

The longest time will be taken by this step. Grab a cup of coffee or even go to lunch if you don’t have superfast internet.

```
sudo dnf system-upgrade download --releasever=37
```

![Packages to download for fedora 37 upgrade][5]

When this process completes, you need to reboot your system with this command to start the actual upgrade process:

```
sudo dnf system-upgrade reboot
```

You’ll see a dark screen with progress of your system upgrade:

![Installing fedora 37 updates on reboot][6]

Once the process completes, you’ll be logged in to Fedora 37 beta.

### Upgrading to Fedora 37 beta graphically with GNOME Software Center (works only for GNOME desktop)

If you are using the GNOME desktop environment that comes with Fedora by default, you have the option to upgrade to the beta version graphically using the GNOME Software application.

Well … almost graphically. Because you’ll need to run this command in the terminal anyway:

```
gsettings set org.gnome.software show-upgrade-prerelease true
```

With that done, open the GNOME Software Center and go to the Updates tab. Make sure there are no pending updates to install. If there are any, install them.

If you don’t see the availability of the next release in the software center, you can either restart your system or kill any instance of GNOME Software with this command:

```
pkill gnome-software
```

Now start GNOME Software again and you should see the availability of the beta version of Fedora 37. Hit the download button.

![Fedora 37 upgrade available notice in GNOME software center][7]

When the download finishes, you’ll be prompted to install and restart your system.

![Restart and install updates][8]

### What happens when the stable version of Fedora 37 is released?

You don’t have to do anything special to get the stable version if you are already using the beta version. Just keep your system updated and you’ll have the stable version automatically. That’s convenient, right?

I hope you find the steps to upgrade to Fedora 37 beta useful. If you have any questions, please do ask in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/upgrade-to-fedora-beta/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/gnome-43-features/
[2]: https://news.itsfoss.com/fedora-37-features/
[3]: https://itsfoss.com/upgrade-ubuntu-beta/
[4]: https://itsfoss.com/update-fedora/
[5]: https://itsfoss.com/wp-content/uploads/2022/09/packages-to-download-for-fedora-37-upgrade.png
[6]: https://itsfoss.com/wp-content/uploads/2022/09/installing-fedora-37-updates-on-reboot.png
[7]: https://itsfoss.com/wp-content/uploads/2022/09/fedora-37-upgrade-available-notice-in-gnome-software-center.png
[8]: https://itsfoss.com/wp-content/uploads/2022/09/restart-and-install-updates.png
