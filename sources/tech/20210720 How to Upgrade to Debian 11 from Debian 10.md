[#]: subject: (How to Upgrade to Debian 11 from Debian 10)
[#]: via: (https://www.debugpoint.com/2021/07/upgrade-debian-11-from-debian-10/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Upgrade to Debian 11 from Debian 10
======
This guide explains the steps to upgrade debian 11 from debian 10.
[Debian][1] releases are rare. Because it is often a multi-year effort from the community. That is why Debian is truly universal operating system and rock solid stability wise.

[Debian 11][2], code named Bullseye, officially releases soon. On July 15, 2021, Debian 11 went to complete freeze, which means the release is imminent. Although the official date is not finalized, but you can install or upgrade to Debian 11 from Debian 10 right now.

This is how.

### Pre-Requisites

  * The upgrade process is very straightforward. However, it is a good practice to take certain pre-cautions. Specially if you are upgrading a server.
  * Take backup of your system, including all important data and files.
  * Try to disable/remove any external repositories (PPA) you may have added over the time. You can enable them after upgrade one-by-one.
  * Close all the running applications.
  * Stop any running services that you may have enabled. You can start them via [systemctl][3] after upgrade is complete. This includes web server, SSH server, FTP server or any other servers.
  * Make sure you have stable internet connection.
  * And have sufficient downtime of your system. Because depending on your system configuration, a Debian version upgrade takes time ~ between 1.5 hours to 2 hours.



### Upgrade Debian 10 Buster to 11 Bullseye Linux

  * Make sure your system is up-to-date, and your package list is up-to-date.



```
sudo apt update && sudo apt upgrade
```

  * Install the gcc-8-base package using the below command. This is required because, historically it has been seen, that upgrade fails because of certain dependencies which included in the below package.



```
sudo apt install gcc-8-base
```

![upgrade debian – system check][4]

  * Open the /etc/apt/sources.list and update with bullseye repositories, by commenting the Debian 10 buster packages.


  * Comment out all the buster repo by “#” at the beginning of the lines.



![Comment the Debian 10 lines][5]

  * Add the following lines at the end of the file.



```
deb http://deb.debian.org/debian bullseye main contrib non-free
deb http://deb.debian.org/debian bullseye-updates main contrib non-free
deb http://security.debian.org/debian-security bullseye-security main
deb http://ftp.debian.org/debian bullseye-backports main contrib non-free
```

![Add Debian 11 lines][6]

  * Press Ctrl + O to save the file and Ctrl + X to exit nano.


  * Update the system repository list once to verify the addition of the repositories.



```
sudo apt update
```

  * If the above command doesn’t give any error, then you have successfully added the bullseye repo.


  * Now, start the upgrade process by running the below command. The download size is around 1.2 GB for a base installation. That may be different based on your system config.



```
sudo apt full-upgrade
```

![Debian upgrade start][7]

  * This command takes time. But do not leave the system unattended. Because upgrade process requires various inputs during the course of upgrade.



![lib6 config][8]

![sudoers file][9]

  * Once it is completed, you can restart the system using –



```
systemctl reboot
```

  * After reboot, run the following commands to make sure your system is up-to-date, and you cleaned up all the unnecessary packages that is not required anymore.



```
sudo apt --purge autoremove
```

  * If all goes well, you should be seeing the Debian 11 bullseye. You can verify the version using the below command:



```
cat /etc/os-release
```

![Debian 11 after upgrade][10]

### Closing Notes

I hope this guide helps you to upgrade your system to Debian 11 bullseye. If you face any issues, let me know using the comment box below.

[][11]

SEE ALSO:   Debian 11 bullseye - Default Theme Revealed

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/upgrade-debian-11-from-debian-10/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debian.org/
[2]: https://www.debugpoint.com/2021/05/debian-11-features/
[3]: https://www.debugpoint.com/2020/12/systemd-systemctl-service/
[4]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/upgrade-debian-system-check-1024x503.jpeg
[5]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Cpmment-the-Debian-10-lines-1024x636.jpeg
[6]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Add-Debian-11-lines-1024x635.jpeg
[7]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Debian-upgrade-start-1024x226.jpeg
[8]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/lib6-config-1024x195.jpeg
[9]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/sudoers-file.jpeg
[10]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Debian-11-after-upgrade.jpeg
[11]: https://www.debugpoint.com/2020/11/debian-11-bullseye-theme/
