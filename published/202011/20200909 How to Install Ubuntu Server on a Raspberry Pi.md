[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12783-1.html)
[#]: subject: (How to Install Ubuntu Server on a Raspberry Pi)
[#]: via: (https://itsfoss.com/install-ubuntu-server-raspberry-pi/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

如何在树莓派上安装 Ubuntu 服务器？
======

![][6]

[树莓派][1]是最著名的[单板计算机][2]。最初，树莓派项目的范围旨在促进学校和发展中国家的计算机基础科学的教学。

它的低成本、便携性和极低的功耗，使得它的受欢迎程度远远超过预期。从气象站到家庭自动化，玩家们用树莓派搭建了许多[酷炫的项目][3]。

[第四代树莓派][4]具备了普通台式电脑的功能和处理能力。但本文并不是要介绍如何使用树莓派作为桌面。相反，我会告诉你如何在树莓派上安装 Ubuntu 服务器。

在本教程中，我将使用树莓派 4，以下是我将介绍的内容：

  * 在 microSD 卡上安装 Ubuntu 服务器
  * 在树莓派上设置无线网络连接
  * 通过 SSH 访问你的树莓派

![][5]

**本教程需要以下设备**：

  * 一张 micro SD 卡（建议使用 8GB 或更大的卡）
  * 一台带有 micro SD 卡读卡器的计算机（运行 Linux、Windows 或 macOS）
  * 树莓派 2、3 或 4
  * 良好的互联网连接
  * 用于树莓派 2 和 3 的 HDMI 线和用于树莓派 4 的 micro HDMI 线（可选）
  * 一套 USB 键盘（可选）

### 在树莓派上安装 Ubuntu 服务器

在本教程中，我使用 Ubuntu 来创建树莓派 SD 卡，但你可以在其他 Linux 发行版、macOS 和 Windows 上创建它。这是因为准备 SD 卡的步骤对 Raspberry Pi Imager 工具而言是一样的。

Raspberry Pi Imager 工具会自动下载你[选择的树莓派系统][7]镜像。这意味着你需要一个良好的网络连接来下载 1GB 左右的数据。

#### 步骤 1：用 Raspberry Pi Imager 准备 SD 卡

确保你已将 microSD 卡插入电脑，并在电脑上安装 Raspberry Pi Imager。

你可以从这些链接中下载适合你操作系统的 Imager 工具：

  * [用于 Ubuntu/Debian 的 Raspberry Pi Imager][8]
  * [用于 Windows 的 Raspberry Pi Imager][9]
  * [用于 MacOS 的 Raspberry Pi Imager][10]

尽管我使用的是 Ubuntu，但我不会使用上面列出的 Debian 软件包，而是使用命令行安装 snap 包。这个方法可以适用于更广泛的 Linux 发行版。

```
sudo snap install rpi-imager
```

安装好 Raspberry Pi Imager 工具后，找到并打开它，点击 “CHOOSE OS” 菜单。

![][11]

滚动菜单并点击 “Ubuntu” （“核心”和“服务器”镜像）。

![][12]

从可用的镜像中，我选择了 Ubuntu 20.04 LTS 64 位。如果你有一个树莓派 2，那你只能选择 32 位镜像。

**重要提示：如果你使用的是最新的树莓派 4 - 8 GB 内存型号，你应该选择 64 位操作系统，否则只能使用 4 GB 内存。**

![][13]

从 “SD Card” 菜单中选择你的 microSD 卡，然后点击 “WRITE”。

![][14]

如果它显示一些错误，请尝试再次写入它。现在它将下载 Ubuntu 服务器镜像并将其写入 micro SD 卡。

当这个过程完成时，它将通知你。

![][15]

#### 步骤 2：在 Ubuntu 服务器上添加 WiFi 支持

烧录完 micro SD 卡后，你就差不多可以使用它了。在使用它之前，有一件事情你可能想做，那就是添加 Wi-Fi 支持。

SD 卡仍然插入读卡器中，打开文件管理器，找到卡上的 “system-boot” 分区。

你要找的和需要编辑的文件名为 `network-config`。

![][16]

这个过程也可以在 Windows 和 MacOS 上完成。如前所述，编辑 `network-config` 文件，添加你的 Wi-Fi 凭证。

首先，取消矩形框内的行的注释（删除开头的标签 `#`）。

之后，将 `myhomewifi` 替换为你的 Wi-Fi 网络名，比如 `"itsfoss"`，将 `"S3kr1t"` 替换为 Wi-Fi 密码，用引号括起来，比如 `"12345679"`。

![][17]

它可能看上去像这样：

```
wifis:
  wlan0:
    dhcp4: true
    optional: true
    access-points:
      "your wifi name":
      password: "your_wifi_password"
```

保存文件并将 micro SD 卡插入到你的树莓派中。在第一次启动时，如果你的树莓派无法连接到 Wi-Fi 网络，只需重启你的设备。

#### 步骤 3：在树莓派上使用 Ubuntu 服务器（如果你有专门的显示器、键盘和鼠标的话）

如果你有一套额外的鼠标，键盘和显示器，你可以很容易地像其他电脑一样使用树莓派（但没有 GUI）。

只需将 micro SD 卡插入树莓派，连接显示器、键盘和鼠标。现在[打开你的树莓派][18]。它将出现 TTY 登录屏幕（黑色终端屏幕）并询问用户名和密码。

  * 默认用户名：`ubuntu`
  * 默认密码：`ubuntu`

看到提示符时，用 `ubuntu` 作为密码。登录成功后，[Ubuntu 会要求你更改默认密码][19]。

享受你的 Ubuntu 服务器吧！

#### 步骤 3：通过 SSH 远程连接到你的树莓派（如果你没有树莓派的显示器、键盘和鼠标的话）

如果你没有专门与树莓派一起使用的显示器也没关系。当你可以直接通过 SSH 进入它并按照你的方式使用它时，谁还需要一个带有显示器的服务器呢？

**在 Ubuntu 和 Mac OS**上，通常已经安装了一个 SSH 客户端。要远程连接到你的树莓派，你需要找到它的 IP 地址。检查[连接到你的网络的设备][20]，看看哪个是树莓派。

由于我没有 Windows 机器，你可以访问[微软][21]提供的综合指南。

打开终端，运行以下命令：

```
ssh ubuntu@raspberry_pi_ip_address
```

你可能会看到以下信息确认连接：

```
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

输入 `yes`，然后点击回车键。

![][22]

当提示时，用前面提到的 `ubuntu` 作为密码。当然，你会被要求更改密码。

完成后，你将自动注销，你必须使用新密码重新连接。

你的 Ubuntu 服务器就可以在树莓派上运行了！

### 总结

在树莓派上安装 Ubuntu 服务器是一个简单的过程，而且它的预配置程度很高，使用起来很愉快。

我不得不说，在所有[我在树莓派上尝试的操作系统][7]中，Ubuntu 服务器是最容易安装的。我并没有夸大其词。请查看我的[在树莓派上安装 Arch Linux][23] 的指南，以供参考。

希望这篇指南也能帮助你在树莓派上安装 Ubuntu 服务器。如果你有问题或建议，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-ubuntu-server-raspberry-pi/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://itsfoss.com/raspberry-pi-alternatives/
[3]: https://itsfoss.com/raspberry-pi-projects/
[4]: https://itsfoss.com/raspberry-pi-4/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/Ubuntu-Server-20.04.1-LTS-aarch64.png?resize=800%2C600&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/ubuntu-server-raspberry-pi.png?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/raspberry-pi-os/
[8]: https://downloads.raspberrypi.org/imager/imager_amd64.deb
[9]: https://downloads.raspberrypi.org/imager/imager.exe
[10]: https://downloads.raspberrypi.org/imager/imager.dmg
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/raspberry-pi-imager.png?resize=800%2C600&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/raspberry-pi-imager-choose-ubuntu.png?resize=800%2C600&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/raspberry-pi-imager-ubuntu-server.png?resize=800%2C600&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/raspberry-pi-imager-sd-card.png?resize=800%2C600&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/ubuntu-server-installed-raspberry-pi.png?resize=799%2C506&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/ubuntu-server-pi-network-config.png?resize=800%2C565&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/Ubuntu-server-wifi.png?resize=800%2C600&ssl=1
[18]: https://itsfoss.com/turn-on-raspberry-pi/
[19]: https://itsfoss.com/change-password-ubuntu/
[20]: https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/
[21]: https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/ubuntu-server-change-password.png?resize=800%2C600&ssl=1
[23]: https://itsfoss.com/install-arch-raspberry-pi/
