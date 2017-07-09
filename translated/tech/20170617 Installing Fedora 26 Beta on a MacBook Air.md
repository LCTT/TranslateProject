Translated by cycoe

在 MacBook Air 上安装 Fedora 26 测试版
======================


距离 Fedora 26 测试版发布已有几天，我认为是时候把它安装在我的 13 寸 MacBook Air 上了。

这代 MacBook Air 的型号为 A1466 EMC 2925，拥有 8gb 内存，2.2GHz i7 处理器，512gb ssd，以及与 2015ish 相似的外观。

首先我下载了 beta 版镜像，你能够从 [GetFedora][1] 网站获取。一旦你下载完成，就可将它安装在 USB 闪存驱动器上。在 Linux 上，你可以用 `dd` 命令方便的完成这个操作。

将 USB 驱动器插入到你的电脑上，并使用 `tail` 命令读取 `/var/log/syslog` 或 `/var/log/messages` 文件的最后几行。你也可以使用 `df -h` 命令查看存储设备从而找到正确的 /dev/sdX。

在下面的例子中，我们假设 USB 闪存驱动器为 /dev/sdc

代码:
```
dd if=/home/rob/Downloads/Fedora-Workstation-Live-x86_64-26_Beta-1.4.iso of=/dev/sdc bs=8M status=progress oflag=direct
```

这将花费一点点时间... 让我们耐心等待。

接下来，我关掉 MacBook，等待 5 s 后将它重新启动。在按下电源键后，我按住 'option' 键来呼出启动选项。我的选择如下图：

![macbook-air-fedora.jpg](https://www.linux.org/attachments/macbook-air-fedora-jpg.2763/)

点击 'fedora' 下面的箭头进入安装过程。

在进入安装过程后我注意到我没有 wifi 网络。幸运的是我有个雷电口转以太网的转接器，因为这个笔记本实际上没有以太网接口。我寄希望于谷歌并于 [此处][2] 找到了一些很棒的指导。

设置 wifi 前先更新内核

代码：
```
sudo dnf update kernel
```

（然后重启）

安装 rpmfusion 仓库

代码：
```
su -c 'dnf install -y http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
```

安装 akmods 和 kernel-devel 包

代码：
```
sudo dnf install -y akmods "kernel-devel-uname-r == $(uname -r)"
```

从 rpmfusion 仓库安装 broadcom-wl 包

代码：
```
sudo dnf install -y broadcom-wl
```

重构内核扩展

代码：
```
sudo akmods
```

然后重启连接你的 wifi！

到目前为止我们已经解决，这使我印象非常深刻！所有我关心的功能键都能够正常工作，如屏幕亮度、键盘背光、音量。

接下来，等 7 月份发布非测试版时，我将马上使用 dnf 升级！

感谢你，Fedora！

--------------------------------------------------------------------------------

via: https://www.linux.org/threads/installing-fedora-26-beta-on-a-macbook-air.12464/

作者：[Rob ][a]
译者：[cycoe](https://github.com/cycoe)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.org/members/rob.1/
[1]:https://getfedora.org/en/workstation/prerelease/
[2]:https://gist.github.com/jamespamplin/7a803fd5be61d4f93e0c5dcdea3f99ee
