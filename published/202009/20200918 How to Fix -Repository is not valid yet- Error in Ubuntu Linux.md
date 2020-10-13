[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12666-1.html)
[#]: subject: (How to Fix “Repository is not valid yet” Error in Ubuntu Linux)
[#]: via: (https://itsfoss.com/fix-repository-not-valid-yet-error-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何修复 Ubuntu Linux 中的 “Release file is not valid yet” 错误
======

我最近[在我的树莓派上安装了 Ubuntu 服务器][1]。我[在 Ubuntu 终端连接上了 Wi-Fi][2]，然后做了我在安装任何 Linux 系统后都会做的事情，那就是更新系统。

当我使用 `sudo apt update` 命令时，它给了一个对我而言特别的错误。它报出仓库的发布文件在某个时间段内无效。

> E: Release file for <http://ports.ubuntu.com/ubuntu-ports/dists/focal-security/InRelease> is not valid yet (invalid for another 159d 15h 20min 52s). Updates for this repository will not be applied.**

下面是完整输出：

```
ubuntu@ubuntu:~$ sudo apt update
Hit:1 http://ports.ubuntu.com/ubuntu-ports focal InRelease    
Get:2 http://ports.ubuntu.com/ubuntu-ports focal-updates InRelease [111 kB]                           
Get:3 http://ports.ubuntu.com/ubuntu-ports focal-backports InRelease [98.3 kB]      
Get:4 http://ports.ubuntu.com/ubuntu-ports focal-security InRelease [107 kB]                     
Reading package lists... Done
E: Release file for http://ports.ubuntu.com/ubuntu-ports/dists/focal/InRelease is not valid yet (invalid for another 21d 23h 17min 25s). Updates for this repository will not be applied.
E: Release file for http://ports.ubuntu.com/ubuntu-ports/dists/focal-updates/InRelease is not valid yet (invalid for another 159d 15h 21min 2s). Updates for this repository will not be applied.
E: Release file for http://ports.ubuntu.com/ubuntu-ports/dists/focal-backports/InRelease is not valid yet (invalid for another 159d 15h 21min 32s). Updates for this repository will not be applied.
E: Release file for http://ports.ubuntu.com/ubuntu-ports/dists/focal-security/InRelease is not valid yet (invalid for another 159d 15h 20min 52s). Updates for this repository will not be applied.

```

### 修复 Ubuntu 和其他 Linux 发行版中 “Release file is not valid yet” 的错误。

![][3]

错误的原因是系统上的时间和现实世界的时间不同。

你看，每个仓库文件都是在某个日期签名的，你可以通过查看发布文件信息了解：

```
sudo head /var/lib/apt/lists/ports.ubuntu.com_ubuntu_dists_focal_InRelease
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Origin: Ubuntu
Label: Ubuntu
Suite: focal
Version: 20.04
Codename: focal
Date: Thu, 23 Apr 2020 17:33:17 UTC
Architectures: amd64 arm64 armhf i386 ppc64el riscv64 s390x
```

现在，由于某些原因，我的 Ubuntu 服务器上的时间是过去时间，这也是为什么 Ubuntu 报出发布文件已经无效 X 天的原因。

如果你连接到了互联网，你可以**等待几分钟让系统同步时间**。

如果不行，你可以强制系统使用本地时间作为实时时钟（硬件时钟）：

```
sudo timedatectl set-local-rtc 1
```

`timedatectl` 命令可以让你在 Linux 上配置时间、日期和[更改时区][4]。

你应该不需要重新启动。它可以立即工作，你可以通过[更新你的 Ubuntu 系统][5]再次验证它。

如果问题解决了，你可以将[实时时钟][6]设置为使用 UTC（Ubuntu 推荐的）。

```
sudo timedatectl set-local-rtc 0
```

**是否为你解决了这个问题？**

我希望这个提示能帮助你解决这个错误。如果你仍然遇到这个问题，请在评论栏告诉我，我会尽力帮助你。

--------------------------------------------------------------------------------

via: https://itsfoss.com/fix-repository-not-valid-yet-error-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[2]: https://itsfoss.com/connect-wifi-terminal-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/Repository-not-valid-yet-error-ubuntu.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/change-timezone-ubuntu/
[5]: https://itsfoss.com/update-ubuntu/
[6]: https://www.computerhope.com/jargon/r/rtc.htm
