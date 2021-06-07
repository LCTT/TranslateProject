如何在 Ubuntu 18.04 上更新固件
======

通常，Ubuntu 和其他 Linux 中的默认软件中心会处理系统固件的更新。但是如果你遇到了错误，你可以使用 `fwupd` 命令行工具更新系统的固件。

我使用 [Dell XPS 13 Ubuntu 版本][1]作为我的主要操作系统。我全新[安装了 Ubuntu 18.04][2]，我对硬件兼容性感到满意。蓝牙、外置 USB 耳机和扬声器、多显示器，一切都开箱即用。

困扰我的一件事是软件中心出现的一个[固件][3]更新。

![Updating firmware in Ubuntu][4]

单击“更新”按钮会在几秒钟后出现错误。

![Updating firmware in Ubuntu][5]

错误消息是：

> Unable to update “Thunderbolt NVM for Xps Notebook 9360”: could not detect device after update: timed out while waiting for device

在这篇文章中，我将向你展示如何在 [Ubuntu][6] 中更新系统固件。

### 在 Ubuntu 18.04 中更新固件

![How to update firmware in Ubuntu][7]

有一件事你应该知道 GNOME Software（即 Ubuntu 18.04 中的软件中心）也能够更新固件。但是在由于某种原因失败的情况下，你可以使用命令行工具 `fwupd`。

[fwupd][8] 是一个开源守护进程，可以处理基于 Linux 的系统中的固件升级。它由 GNOME 开发人员 [Richard Hughes][9] 创建。戴尔的开发人员也为这一开源工具的开发做出了贡献。

基本上，它使用 LVFS —— <ruby>Linux 供应商固件服务<rt>Linux Vendor Firmware Service</rt></ruby>。硬件供应商将可再发行固件上传到 LVFS 站点，并且多亏 `fwupd`，你可以从操作系统内部升级这些固件。`fwupd` 得到了 Ubuntu 和 Fedora 等主要 Linux 发行版的支持。

首先打开终端并更新系统：

```
sudo apt update && sudo apt upgrade -y
```

之后，你可以逐个使用以下命令来启动守护程序，刷新可用固件更新列表并安装固件更新。

```
sudo service fwupd start
```

守护进程运行后，检查是否有可用的固件更新。

```
sudo fwupdmgr refresh
```

输出应如下所示：

```
Fetching metadata https://cdn.fwupd.org/downloads/firmware.xml.gz
Downloading…                         [****************************]
Fetching signature https://cdn.fwupd.org/downloads/firmware.xml.gz.asc
```

在此之后，运行固件更新：

```
sudo fwupdmgr update
```

固件更新的输出可能与此类似：

```
No upgrades for XPS 13 9360 TPM 2.0, current is 1.3.1.0: 1.3.1.0=same
No upgrades for XPS 13 9360 System Firmware, current is 0.2.8.1: 0.2.8.1=same, 0.2.7.1=older, 0.2.6.2=older, 0.2.5.1=older, 0.2.4.2=older, 0.2.3.1=older, 0.2.2.1=older, 0.2.1.0=older, 0.1.3.7=older, 0.1.3.5=older, 0.1.3.2=older, 0.1.2.3=older
Downloading 21.00 for XPS13 9360 Thunderbolt Controller…
Updating 21.00 on XPS13 9360 Thunderbolt Controller…
Decompressing…    [***********]
Authenticating…      [***********] 
Restarting device… [***********]
```

这应该处理了在 Ubuntu 18.04 中的固件更新。我希望这篇文章可以帮助你在 Linux 中进行固件更新。

如果你有任何问题或建议，请在下面的评论栏留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-firmware-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://itsfoss.com/dell-xps-13-ubuntu-review/
[2]: https://itsfoss.com/install-ubuntu-dual-boot-mode-windows/
[3]: https://en.wikipedia.org/wiki/Firmware
[4]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/ubuntu-firmware-update-error-1.png
[5]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/ubuntu-firmware-update-error-2.jpg
[6]: https://www.ubuntu.com/
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/update-firmware-ubuntu.png
[8]: https://fwupd.org/
[9]: https://github.com/hughsie/fwupd
