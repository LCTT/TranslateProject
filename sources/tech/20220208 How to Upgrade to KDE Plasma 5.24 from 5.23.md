[#]: subject: "How to Upgrade to KDE Plasma 5.24 from 5.23"
[#]: via: "https://www.debugpoint.com/2022/02/upgrade-kde-plasma-5-24/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Upgrade to KDE Plasma 5.24 from 5.23
======
THE KDE TEAM ANNOUNCED THE KDE PLASMA 5.24 LTS EDITION, WHICH IS
AVAILABLE TO DOWNLOAD AND INSTALL. IF YOU ARE PLANNING TO UPGRADE FROM
THE PRIOR VERSION – HERE WE GIVE YOU QUICK STEPS TO UPGRADE TO KDE
PLASMA 5.24 FROM 5.23.
![KDE Plasma 5.24 Desktop][1]

KDE Plasma 5.24 is the 26th edition of Plasma desktop that brings significant visual refresh with some backend performance boost. With this release, you get a brand new wallpaper, visual refresh to the Breeze theme, fingerprint login and a brand new overview screen. And many more updates.

Here, you can read details about the [KDE Plasma 5.24 features in our round-up post][2].

If you are running an earlier version of KDE Plasma, this is how you can upgrade to the latest version.

### How to Upgrade to KDE Plasma 5.24

The upgrade size in this release is moderate, around 450 MB+ in my test machine. So, make sure to close all applications and save your data before starting the upgrade process.

In general, the KDE update is very stable. It never fails. But if you want to be extra cautious and have valuable data, you may want to take a backup of those. But again, I believe it’s unnecessary, in my opinion.

#### Steps

If you are running KDE Plasma 5.23 in KDE Neon, Or any rolling release distributions such as Arch Linux, Manjaro, or any other distro, you can open the KDE utility Discover and click on the check for update.

You can verify whether Plasma 5.24 is available via the Discover upgrade package list.

Once you have verified, click on the ‘Update All’ button in the Discover window at the top right.

Alternatively, you can also run the below commands from the terminal and start the upgrade process in KDE Neon.

```

    sudo apt update

```

```

    sudo pkcon update

```

Restart the system after the upgrade process is complete.

And after reboot, you should see the brand new KDE Plasma 5.24 welcomes you.

### KDE Plasma 5.24 in Fedora 35 and Ubuntu 21.10

As of writing this, [Fedora 35][3] and [Ubuntu 21.10][4] are the two primary distribution versions. Fedora 35 would not be getting this version due to the [update policy][5] and Fedora 36 also would be released soon.

[][2]

SEE ALSO:   KDE Plasma 5.24 – Top New Features and Release Details

However, If you still want to experiment, you can install this new version of Plasma desktop in Ubuntu 21.10 and Ubuntu 21.04 using the below backports PPA. Make sure you keep a backup of your data while doing so.

```

    sudo add-apt-repository ppa:kubuntu-ppa/backports
    sudo apt-get full-upgrade

```

In Fedora 35, I tried to install via the below copr repo. But there are too many dependency conflicts to resolve and it’s risky to try this in a stable system. I would recommend not to try the below in Fedora 35 at this time. You can still install by “allowerasing” flag. But don’t do it.

Also, I guess the official Fedora 35 repo will be updated on the first point release i.e. 5.24.1 which is due on Feb 15, 2022. So you can wait until then.

Also, it is wiser to wait for Fedora 36 which brings this version as default. Fedora 36 is due on April 2022.

![Trying to Install Plasma 5.24 in Fedora 35][6]

```

    sudo dnf copr enable marcdeop/plasma
    sudo dnf copr enable marcdeop/kf5
    sudo dnf upgrade --refresh

```

### Post Upgrade Feedback

I ran the upgrade process in a virtual machine with a fresh KDE Plasma 5.23 install. The upgrade process went smooth, so surprises or errors. Well, it never failed for me to date.

The upgrade time entirely depends on your internet connection and KDE servers. In general, it should b completed within 30 minutes.

The first restart after the upgrade process went fine and did not take much time.

Performance-wise, I felt it’s a little smooth over the prior releases, thanks to several bug fixes and under the hood performance optimizations.

So, overall, you can safely upgrade if you are in KDE Neon. And wait for the packages for Ubuntu and Fedora stable releases.

Enjoy the brand new KDE Plasma!

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][7], [Twitter][8], [YouTube][9], and [Facebook][10] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/upgrade-kde-plasma-5-24/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/02/KDE-Plasma-5.4-Desktop-1024x576.jpg
[2]: https://www.debugpoint.com/2022/01/kde-plasma-5-24/
[3]: https://www.debugpoint.com/2021/09/fedora-35/
[4]: https://www.debugpoint.com/2021/07/ubuntu-21-10/
[5]: https://docs.fedoraproject.org/en-US/fesco/Updates_Policy/#stable-releases
[6]: https://www.debugpoint.com/wp-content/uploads/2022/02/Trying-to-Install-Plasma-5.24-in-Fedora-35-1024x576.jpg
[7]: https://t.me/debugpoint
[8]: https://twitter.com/DebugPoint
[9]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[10]: https://facebook.com/DebugPoint
