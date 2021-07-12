[#]: subject: (How to Upgrade to Pop OS 21.04 from 20.10 [Step by Step])
[#]: via: (https://www.debugpoint.com/2021/07/upgrade-pop-os-21-04-from-20-10/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Upgrade to Pop OS 21.04 from 20.10 [Step by Step]
======
In this post, we cover some basic steps required to upgrade to Pop OS
21.04 from Pop OS 20.10.Note
The GNOME based desktop environment Pop OS 21.04 is released by [System76][1] for download and upgrade. This release brings updated packages, Linux Kernel and a brand new COSMIC Desktop. The new COSMIC Desktop brings a new approach to pre-GNOME 40 desktop (GNOME 3.38.4), new launcher, different workspace view and a good deal of new productivity boost.

You can read our release coverage of Pop OS 21.04 [here][2] to learn about the new features. That said, if you are running Pop OS 20.10, then follow the below steps to upgrade your system to Pop OS 21.04.

: If you are using Pop OS 20.04 LTS, it is not recommended upgrading due to incompatible software and packages between both the version.

### Upgrade to Pop OS 21.04 from 20.10

#### Before Upgrade

Follow the below steps before upgrade. These are only recommended guideline. You may/may not want to follow them.

  * Pop OS upgrade process is very stable. But to be safe, make sure to take backups of your personal documents from home and other directories.
  * Note down the additional application you have installed over the time.
  * Disable all GNOME Extensions before upgrade. Extensions create problems due to incompatibility. You can enable them after upgrade process completes.
  * Close all the running applications.
  * Make sure you have stable internet connection.



#### Upgrade Steps

  * If you are running Pop OS 20.10, then you should see a popup like below showing that the upgrade is available.



![Pop OS 21.04 Update Notification][3]

  * Open a terminal and run the following commands.



```
sudo apt update
```

```
sudo apt full-upgrade
```

  * This ensures your system is up-to-date before the upgrade process begins.


  * Update the recovery partition using the command and wait for it to be finished.



```
pop-upgrade recovery upgrade from-release
```

  * Now start the upgrade process using the following:



```
pop-upgrade release upgrade
```

![pop-upgrade][4]

  * The upgrade process would download the files first.



[][5]

SEE ALSO:   Pop!_OS 20.04 Review: Best Ubuntu based Linux Distribution

![Upgrade Continues][6]

  * After the download is complete, it would prompt you for reboot.



![Downloading is Complete and Upgrade to start][7]

  * During reboot, the upgrade would install all the necessary components.


  * The entire upgrade process takes around ~1 hour, including download plus upgrade. So, wait for the process to complete.



After completion, you can enjoy the brand-new Pop OS 21.04. As this new version comes with COSMIC desktop, it would give you an initial setup steps to customize it, even if it’s an upgrade path.

So, that’s about it. If you are planning to upgrade, go for it. It is stable and should work without any glitches.

In case if you run into issues, let me know in the comment box below.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/upgrade-pop-os-21-04-from-20-10/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://system76.com/
[2]: https://www.debugpoint.com/2021/06/pop-os-21-04-release/
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Pop-OS-21.04-Update-Notification.png
[4]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/pop-upgrade.png
[5]: https://www.debugpoint.com/2020/05/pop-os-20-04-review/
[6]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Upgrade-Continues.png
[7]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Downloading-is-Complete-and-Upgrade-to-start.png
