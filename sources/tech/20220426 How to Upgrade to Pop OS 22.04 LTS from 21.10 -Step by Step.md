[#]: subject: "How to Upgrade to Pop OS 22.04 LTS from 21.10 [Step by Step]"
[#]: via: "https://www.debugpoint.com/2022/04/upgrade-pop-os-22-04-from-21-10/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Upgrade to Pop OS 22.04 LTS from 21.10 [Step by Step]
======
WE GIVE YOU EASY STEPS TO UPGRADE TO POP OS 22.04 LTS FROM POP OS 21.10.
System76 [released][1] the Pop OS 22.04 LTS following [Ubuntu 22.04 LTS][2], which brings some exciting features. Pop OS 22.04 LTS is a long-term support release from System76 that brings automatic scheduling updates, customised GNOME 42, underlying performance improvements, and [many other features][3].

You must be excited to experience Pop OS 22.04 and planning to upgrade. Here we give you the steps to upgrade to Pop OS 22.04 LTS.

: You can not upgrade from Pop OS 20.04 to Pop OS 22.04. First, you need to upgrade to Pop OS 21.10 and follow the steps outlined here to upgrade to this release.

### Upgrade to Pop OS 22.04 from Pop OS 21.10

#### Before Upgrade

Pop OS upgrade process is relatively stable. Because as per our [last article on updates][4], many users faced upgrade issues. But if you are running Pop OS with NVIDIA hardware, I recommend you take backups.

  * Make sure your system is up to date. You can use the Pop Shop application and check for updates. Alternatively, you can open a terminal prompt and run the following for upgrades.



```

    sudo apt update && sudo apt upgrade

```

  * After the update is complete with the above steps, reboot your system.
  * Take backups to your documents, photos, videos or any document to separate disk partition or in a USB drive.
  * Disable all GNOME extensions before upgrading. Many extensions are in the process of migrating to GNOME 42. Hence, it would be best if you disabled all of them before upgrading and later enabled them.
  * Note down all the external software sources or PPA you may have added because they may not be compatible with the “jammy” branch. You may need to verify them after the upgrade.
  * Close all the running applications.
  * Finally, make sure you have some time in hand and a stable internet connection for the upgrade to finish.



[][5]

SEE ALSO:   How to Upgrade to Pop OS 21.04 from 20.10 [Step by Step]

### Upgrade Steps for Pop OS 22.04 LTS

#### GUI Method

If you are running Pop OS 21.10, you should see a prompt like the below if your system is updated.

![Pop OS 22.04 Upgrade Prompt][6]

Alternatively, you can open Settings and visit OS Upgrade and Recovery tab. Here you should see that update is available.

![Pop OS 22.04 Upgrade Prompt in Settings][7]

Click Download to start the upgrade process.

#### Terminal Method to Upgrade to Pop OS 22.04 LTS

  * Open a terminal and run the following commands.



```

    sudo apt update

```

```

    sudo apt full-upgrade

```

  * This ensures your system is up-to-date before the upgrade process begins. You may ignore this step if you have already completed this as part of the pre-upgrade steps described above.


  * Update the recovery partition using the below command and wait for it to be finished. This is only applicable for UEFI installs.



```

    pop-upgrade recovery upgrade from-release

```

  * Now start the upgrade process using the following:



```

    pop-upgrade release upgrade

```

![Start the upgrade process][8]

  * Firstly, the upgrade will start the download of the packages. As of our test, around 1600+ packages need downloading. Hence you should wait until it finishes.


  * Secondly, once the download is complete, the upgrader will prompt you for the reboot.



![Ready for upgrade][9]

  * Pop OS would start installing the latest packages to your system after the reboot.


  * Finally, the download process takes about an hour, so wait for it to be finished. I would not recommend stopping the upgrade mid-way as it may lead to an unstable system.



![Pop OS 22.04 LTS Desktop][10]

  * After the upgrade is complete, enjoy the brand new Pop OS 22.04 LTS.



* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][11], [Twitter][12], [YouTube][13], and [Facebook][14] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/upgrade-pop-os-22-04-from-21-10/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://blog.system76.com/post/682519660741148672/popos-2204-lts-has-landed
[2]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[3]: https://www.debugpoint.com/2022/04/pop-os-22-04-lts/
[4]: https://www.debugpoint.com/2021/12/upgrade-pop-os-21-10-from-21-04/
[5]: https://www.debugpoint.com/2021/07/upgrade-pop-os-21-04-from-20-10/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/04/Pop-OS-22.04-Upgrade-Prompt-1024x200.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Pop-OS-22.04-Upgrade-Prompt-in-Settings.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/04/Start-the-upgrade-process.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ready-for-upgrade-1024x323.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/04/Pop-OS-22.04-LTS-Desktop-1024x641.jpg
[11]: https://t.me/debugpoint
[12]: https://twitter.com/DebugPoint
[13]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[14]: https://facebook.com/DebugPoint
