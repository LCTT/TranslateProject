[#]: subject: (How to Upgrade to Linux Mint 20.2 from 20.1)
[#]: via: (https://www.debugpoint.com/2021/07/upgrade-linux-mint-20-2/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Upgrade to Linux Mint 20.2 from 20.1
======
In this post, we walk you through the steps needed to Upgrade to Linux
Mint 20.2 from 20.1.
If you are using [Linux Mint 20.1 Ulyssa][1], then you should already receive notification for upgrade. If not, follow the guide as outlined below, and you can get the Linux Mint 20.2 in no time.

[Linux Mint 20.2 “Uma”][2] brings an array of changes and features. This release is powered by Ubuntu 20.04.2, Linux Kernel 5.4, Cinnamon 5.0, Xfce 4.16, MATE 1.24, Firefox 89 and more changes. It also features a new Mint native application, “Bulky” for renaming files in batch. You can read our coverage here [for more details][3].

That said, the Linux Mint upgrade process is very stable and tested well. So, you do not need to worry about anything. However, there are cases when an upgrade fails. So, first take some pre-cautions before you jump in.

### Upgrade to Linux Mint 20.2

  * Take backups of your home, download, pictures, videos and other directories.


  * Make sure to create a system restore point using TimeShift. This is one of the recommended step that you should follow.
  * Make sure you have around 30 minutes on average for upgrade completion and a stable internet connection.
  * Disable screensaver because during upgrade process if screensaver kicks in, you might run into unstable system.
  * Open the Update Manager and make sure your system is up-to-date including all the Cinnamon Spices by “Install Update” option.
  * Once you ensure that your system is up-to date, then from the update manager, choose Upgrade to Linux Mint 20.2.



![Upgrade to Linux Mint 20.2 Prompt][4]

  * In the following screen, click Next to start the process.



![Upgrade step 1][5]

  * In the next two screens, you can read about the new features and release notes if you want. Otherwise, click Next.
  * In the Requirement screen, choose ‘I Understand the risk…’ and click Apply. The upgrader starts downloading packages and install.



[][6]

SEE ALSO:   Linux Mint 20.1 "Ulyssa" Beta is now Available for Download

![Upgrader is downloading packages][7]

  * This step might take some time depending on the internet connection. So, wait for the download to complete.
  * If all goes well, you get a prompt like below that upgrade is complete.



![Linux Mint 20.2 Upgrade Complete][8]

  * Reboot your computer and experience the new Linux Mint 20.2.



### Troubleshooting

  * If the upgrade option is not available, then make sure you have latest versions of mintupdate (5.7.3 or higher) and mint-upgrade-info (1.1.8 or higher)
  * The above process is same for Xfce, MATE edition of Linux Mint as well.
  * If your screen goes blank for screensaver or some other reason during upgrade, then go to terminal session via pressing CTRL+ALT+F1 and login. Then kill the process for screensaver via `killall cinnamon-screensaver`. And go back to update GUI via CTRL+ALT+F7.



I hope this guide helps you to upgrade your Linux Mint system. If you run into a problem, let me know using the comment box below.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/upgrade-linux-mint-20-2/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2021/01/linux-mint-20-1-release-announcement/
[2]: https://blog.linuxmint.com/?p=4102
[3]: https://www.debugpoint.com/2021/07/linux-mint-20-2-release-announcement/
[4]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Update-Manager-Prompt-1024x464.jpeg
[5]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Upgrade-step-1.jpeg
[6]: https://www.debugpoint.com/2020/12/linux-mint-20-1-beta/
[7]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Upgrade-step-3-1024x759.jpeg
[8]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/upgrade-complete-1024x758.jpeg
