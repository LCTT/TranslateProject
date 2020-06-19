[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fixing “The following packages have been kept back” Error While Updating Ubuntu and Debian-based Linux Distributions)
[#]: via: (https://itsfoss.com/following-packages-have-been-kept-back/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Fixing “The following packages have been kept back” Error While Updating Ubuntu and Debian-based Linux Distributions
======

The other day I was [updating my Ubuntu system][1]. I prefer the command line way of updating the system by using the combination of apt update and apt upgrade.

I encountered a [strange update error in Ubuntu][2] this time. It showed me that there are packages that can be upgraded but it could not upgrade those packages because of an error that read:

**The following packages have been kept back**:

Here’s the screenshot of the error I encountered:

![][3]

As you can see in the image above, the problem is arising because of fwupd which is the [firmware update manager daemon in Ubuntu][4] and other Linux.

Let me show you how to handle this error in Ubuntu and other Linux distributions like [Linux Mint][5], [Debian][6], Kali Linux etc.

### Fixing “The following packages have been kept back” Error

The fix for this error is really simple. All you have to do is to use the apt install command with package or packages in the question:

```
sudo apt install package_name
```

If you use apt install on an already installed package, it gets updated. In my case, fwupd package was kept back. So, here’s what I tried:

```
sudo apt install fwupd
```

As you can see in the below screenshot, it suggests two packages that will be installed and then those packages are installed as well.

![][7]

### Explained: Reason for the “The following packages have been kept back” error and how it was fixed

The above suggested fix should solve the problem for you. But are you curious what caused the error and how was it fixed? Let me explain that to you.

Normally, when you run the sudo apt update and sudo apt upgrade commands, it updates all the installed packages to their available newer versions.

However, if the dependencies of an installed package have been changed such that it requires installation of new packages, the installed package won’t be upgraded with the system update and you’ll see package kept back error.

In the example here, when fwupd was originally installed, tpm2-tools and tpm2-abrmd were not installed and fwupd did not depend on it. Later, a newer version of fwupd required the installation of these new packages.

This is a mechanism in Debian’s [APT package manager][8] that informs you that an already installed package now needs to install more new package as dependency. When you manually and individually update these packages, you see what new packages are going to be installed and the error is not shown anymore.

You may also use **apt full-upgrade/apt-get dist-upgrade** instead of **apt install package_name** in this case but I would not recommend that. The apt full-upgrade may automatically remove packages that it deems unnecessary while handling dependencies. This may lead to unwanted situations.

**Did you fix this error?**

Did this solution help you in getting rid of the “packages have been kept back” error? If yes, I welcome your quick ‘thank you’ message in the comment section. If not, let me know and I’ll try to help you out further.

--------------------------------------------------------------------------------

via: https://itsfoss.com/following-packages-have-been-kept-back/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/update-ubuntu/
[2]: https://itsfoss.com/how-to-fix-problem-with-mergelist/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/packages-have-been-kept-back-error-1.png?ssl=1
[4]: https://itsfoss.com/update-firmware-ubuntu/
[5]: https://www.linuxmint.com/
[6]: https://www.debian.org/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/packages-have-been-kept-back-error.png?ssl=1
[8]: https://wiki.debian.org/Apt
