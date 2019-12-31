[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11733-1.html)
[#]: subject: (Fedora Desktops – Memory Footprints)
[#]: via: (https://fedoramagazine.org/fedora-desktops-memory-footprints/)
[#]: author: (Troy Dawson https://fedoramagazine.org/author/tdawson/)

Fedora 上的桌面环境内存占用测试
======

![][1]

Fedora 中有 40 多种桌面环境（DE）。每种桌面环境都有自己的优点和缺点。通常，根据功能、外观和其它品质，选择桌面是一件非常个人的偏好。但有时，你选择的桌面环境还会受到硬件限制。

本文旨在帮助人们根据桌面环境占用的基准内存来比较 Fedora 桌面环境。为了缩小范围，我们仅查看具有正式 Fedora Live 镜像的桌面环境。

### 安装与系统配置

每个桌面环境都安装在自己的 KVM 虚拟机上。每个虚拟机都有 1 个 CPU、4GB 内存、15GB virtio 固态磁盘，以及 RHEL 8.0 kvm 上所有其他标准配置。

用于安装的镜像是标准的 Fedora 31 Live 镜像。对于 GNOME，该镜像是 “Fedora 工作站”。对于其它桌面，使用了相应的 Spin 版本。未对“<ruby>糖葫芦<rt>Sugar On A Stick</rt></ruby>”（SOAS）进行测试，因为它不容易安装到本地驱动器上。

用 Live CD 启动虚拟机，然后选择“安装到硬盘”。在安装过程中，仅使用默认值。创建了一个 root 用户和一个普通用户。安装并重新启动后，live 镜像已确认不在虚拟 CDROM 中。

每个桌面环境的设置都没有改动。它们每个都以 Live CD 环境中默认的设置运行。每个桌面环境都是通过普通用户登录的。打开了一个终端，在每台虚拟机中都使用 `sudo` 运行了 `dnf -y update`。在更新后，在该 sudo 终端中，每台虚拟机都运行 `/sbin/shutdown -h now` 以关闭。

### 测试方式

每台机器都已启动。桌面环境已通过普通用户登录。打开了三个桌面终端。xterm 从未使用过，始终用的是该桌面环境的终端，例如 konsole。

在一个终端中，启动 `top` 并按下 `M`，以显示按内存排序的进程。在另一个终端中，一个简单的 `while` 循环每 30 秒显示一次 `free -m`。第三个终端闲置。

然后，我等待了 5 分钟。这样就可以让所有启动的服务都启动完成。我记录了最终的 `free` 结果，以及 `top` 中最终的前三名内存使用者。

### 结果

  * Cinnamon
    * 使用了624 MB 
    * cinnamon 4.8% / Xorg 2.2% / dnfdragora 1.8%
  * GNOME
    * 使用了 612 MB
    * gnome-shell 6.9% / gnome-software 1.8% / ibus-x11 1.5%
  * KDE
    * 使用了 733 MB
    * plasmashell 6.2% / kwin\_x11 3.6% / akonadi\_mailfil 2.9%
  * LXDE
    * 使用了 318 MB
    * Xorg 1.9% / nm-applet 1.8% / dnfdragora 1.8%
  * LXQt
    * 使用了 391 MB
    * lxqt-panel 2.2% / pcmanfm-qt 2.1% / Xorg 2.1%
  * MATE
    * 使用了 465 MB
    * Xorg 2.5% / dnfdragora 1.8% / caja 1.5%
  * XFCE
    * 使用了 448 MB
    * Xorg 2.3% / xfwm4 2.0% / dnfdragora 1.8%



### 结论

我会让数字说明一切。

请记住，这些数字来自默认的 Live 安装环境。如果删除或添加服务和功能，则内存使用量将发生变化。但是，如果要根据内存消耗确定桌面环境，这是一个很好的基准。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-desktops-memory-footprints/

作者：[Troy Dawson][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/tdawson/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/desktop-memory-footprint-816x346.jpg
