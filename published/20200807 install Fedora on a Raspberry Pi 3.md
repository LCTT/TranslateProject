[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12520-1.html)
[#]: subject: (install Fedora on a Raspberry Pi 3)
[#]: via: (https://fedoramagazine.org/install-fedora-on-a-raspberry-pi/)
[#]: author: (Nick Hardiman https://fedoramagazine.org/author/nickhardiman/)

在树莓派 3 上安装 Fedora
======

![][1]

> 在树莓派上运行 Fedora。

[树莓派基金会][2]这几年来生产了很多型号。本文的安装过程已经在第三代树莓派上进行了测试：[3B v1.2][3] 和 [B+][4]（较旧的 [树莓派 2][5] 和新的 [树莓派 4][6] 都还没有测试）。这些是已经发布了几年的信用卡大小的树莓派。

### 获取硬件

你需要一些硬件组件，包括树莓派。你不需要任何 [HaT（安装在顶部的硬件）][7] 板或 USB 天线。如果你使用过树莓派，那么可能会有这些。

  * **当前网络**。也许是你的家庭实验室。
  * **网线**。连接当前网络到树莓派
  * **树莓派 3**，型号 B 或 B+。
  * **电源**。
  * **8 GB 或更大容量的 micro-SD 卡**。
  * **键盘**和**显示器**。

键盘和显示器共同组成本地控制台。即使没有控制台，也能进行操作（尽管很复杂），例如设置自动安装然后通过网络连接。在 Fedora 首次启动时，本地控制台可轻松回应配置问题。同样，在 AP 配置期间出错可能会破坏网络配置，从而阻止远程用户连入。

### 下载 Fedora Minimal

  * 查找 Fedora 的[其他可选架构镜像][8]。
  * 下载 [ARM® aarch64 架构镜像][9]。

Fedora Minimal 镜像是 [Fedora 的其他可选下载之一][10]，它有所有必需的核心软件包和网络软件包（嗯，是几乎，注意下面的 dnsmasq）。该镜像包含一个现成的文件系统，它已经安装了 400 多个软件包。此最小镜像不包括流行的软件包，像开发环境、互联网服务或桌面。这些类型的软件不是这里所必需的，如果安装它们，可能会占用过多的内存。

Fedora Minimal 原始镜像可安装在小型 SD 卡上，并在少于 1GB 的内存中运行（这些旧的树莓派有 1GB 的内存）。

下载文件的名称类似于 `Fedora-Minimal-32-1.6.aarch64.raw.xz`。该文件已压缩，大小约为 700MB。文件解压缩后为 5GB。这是一个 ext4 文件系统，它大部分是空的：已使用约 1GB，空余 4GB。这些空的空间是压缩文件比未压缩的原始文件小得多的原因。

### 复制到 micro-SD 卡

  * 将镜像复制到 micro-SD 卡。

这可能比听起来更复杂，而且会带来痛苦的体验。找到一个[良好的 micro-SD 卡][11]需要花费精力。然后是将卡插到计算机的挑战。也许你的笔记本电脑有全尺寸的 SD 卡插槽，你还需要卡适配器，或者你需要一个 USB 适配器。然后，在进行复制时，操作系统可能会帮助你，也可能会妨碍你。你可能很幸运有 [Fedora Media Writer][12]，或使用这些 Linux 命令：

```
unxz ./Fedora-Minimal-32-1.6.aarch64.raw.xz
dd if=./Fedora-Minimal-32-1.6.aarch64.raw of=/dev/mmcblk0 bs=8M status=progress oflag=direct
```

### 安装 Fedora

  * 连接树莓派、电源线、网线和 micro-SD 卡。
  * 打开电源。
  * 当图形芯片通电时，看见彩色框。
  * 等待 [anaconda 安装程序][13]启动。
  * 回答 anaconda 的设置问题。

操作系统的初始配置需要几分钟的时间。等待启动需要花费几分钟，还需要花费一些时间填写 anaconda 的文本安装程序的问题。在下面的例子中，用户名为 `nick`，并且还是管理员（`wheel` 组的成员）。

恭喜你！你的树莓派已启动并可运行。

### 更新软件

  * 用 `dnf update` 更新软件包。
  * 通过 `systemctl reboot` 重启。

多年来，很多人为使树莓派正常工作付出了很多工作。使用最新的软件，以确保你从他们的辛勤工作中受益。如果你跳过此步骤，你可能会发现有些东西无法正常工作。

此次更新下载并安装了约一百个软件包。由于存储设备是 micro-SD 卡，因此写入新软件的过程很慢。这就是 90 年代使用存储器的感觉。

### 可以摆弄的东西

如果你想摆弄的话，此时可以设置其他一些内容。这都是可选的。试试这些。

  * `sudo hostnamectl set-hostname raspi` 替换 `localhost` 主机名。
  * 用 `ip addr` 查找 IP 地址。
  * 尝试 SSH 登录，甚至使用 `ssh-copy-id` 设置基于密钥的登录。
  * 使用 `systemctl poweroff` 关机。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-fedora-on-a-raspberry-pi/

作者：[Nick Hardiman][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nickhardiman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/fedora-on-rpi-816x346.png
[2]: https://www.raspberrypi.org/about/
[3]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[4]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/
[5]: https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
[6]: https://www.raspberrypi.org/products/raspberry-pi-4-model-b/
[7]: https://www.raspberrypi.org/blog/introducing-raspberry-pi-hats/
[8]: https://alt.fedoraproject.org/alt/
[9]: https://download.fedoraproject.org/pub/fedora-secondary/releases/32/Spins/aarch64/images/Fedora-Minimal-32-1.6.aarch64.raw.xz
[10]: https://alt.fedoraproject.org/
[11]: https://www.jeffgeerling.com/blog/2019/raspberry-pi-microsd-card-performance-comparison-2019
[12]: https://fedoramagazine.org/make-fedora-usb-stick/
[13]: https://fedoraproject.org/wiki/Anaconda
