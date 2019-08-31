[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11262-1.html)
[#]: subject: (How to Reinstall Ubuntu in Dual Boot or Single Boot Mode)
[#]: via: (https://itsfoss.com/reinstall-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在双启动或单启动模式下重新安装 Ubuntu
======

如果你弄坏了你的 Ubuntu 系统，并尝试了很多方法来修复，你最终放弃并采取简单的方法：重新安装 Ubuntu。

我们一直遇到这样一种情况，重新安装 Linux 似乎比找出问题并解决来得更好。排查 Linux 故障能教你很多，但你不会总是花费更多时间来修复损坏的系统。

据我所知，Ubuntu 中没有像 Windows 那样的系统恢复分区。那么，问题出现了：如何重新安装 Ubuntu？让我告诉你如何重新安装 Ubuntu。

**警告！**

> **磁盘分区始终是一项危险的任务。我强烈建议你在外部磁盘上备份数据。**

### 如何重新安装 Ubuntu Linux

![][1]

以下是重新安装 Ubuntu 的步骤。

#### 步骤 1：创建一个 live USB

首先，在网站上下载 Ubuntu。你可以下载[任何需要的 Ubuntu 版本][2]。

- [下载 Ubuntu][3]

获得 ISO 镜像后，就可以创建 live USB 了。如果 Ubuntu 系统仍然可以使用，那么可以使用 Ubuntu 提供的启动盘创建工具创建它。

如果无法使用你的 Ubuntu，那么你可以使用其他系统。你可以参考这篇文章来学习[如何在 Windows 中创建 Ubuntu 的 live USB][4]。

#### 步骤 2：重新安装 Ubuntu

有了 Ubuntu 的 live USB 之后将其插入 USB 端口。重新启动系统。在启动时，按下 `F2`/`F10`/`F12` 之类的键进入 BIOS 设置，并确保已设置 “Boot from Removable Devices/USB”。保存并退出 BIOS。这将启动进入 live USB。

进入 live USB 后，选择安装 Ubuntu。你将看到选择语言和键盘布局这些常用选项。你还可以选择下载更新等。

![Go ahead with regular installation option][5]

现在是重要的步骤。你应该看到一个“<ruby>安装类型<rt>Installation Type</rt></ruby>”页面。你在屏幕上看到的内容在很大程度上取决于 Ubuntu 如何处理系统上的磁盘分区和安装的操作系统。

在此步骤中仔细阅读选项及它的细节。注意每个选项的说明。屏幕上的选项可能在不同的系统中看上去不同。

![Reinstall Ubuntu option in dual boot mode][7]

在这里，它发现我的系统上安装了 Ubuntu 18.04.2 和 Windows，它给了我一些选项。

第一个选项是擦除 Ubuntu 18.04.2 并重新安装它。它告诉我它将删除我的个人数据，但它没有说删除所有操作系统（即 Windows）。

如果你非常幸运或处于单一启动模式，你可能会看到一个“<ruby>重新安装 Ubuntu<rt>Reinstall Ubuntu</rt></ruby>”的选项。此选项将保留现有数据，甚至尝试保留已安装的软件。如果你看到这个选项，那么就用它吧。

**双启动系统注意**

> **如果你是双启动 Ubuntu 和 Windows，并且在重新安装中，你的 Ubuntu 系统看不到 Windows，你必须选择 “Something else” 选项并从那里安装 Ubuntu。我已经在[在双启动下安装 Linux 的过程][8]这篇文章中说明了。**

对我来说，没有重新安装并保留数据的选项，因此我选择了“<ruby>擦除 Ubuntu 并重新安装<rt>Erase Ubuntu and reinstall</rt></ruby>”。该选项即使在 Windows 的双启动模式下，也将重新安装 Ubuntu。

我建议为 `/` 和 `/home` 使用单独分区就是为了重新安装。这样，即使重新安装 Linux，也可以保证 `/home` 分区中的数据安全。我已在此视频中演示过：

选择重新安装 Ubuntu 后，剩下就是单击下一步。选择你的位置、创建用户账户。

![Just go on with the installation options][9]

以上完成后，你就完成重装 Ubuntu 了。

在本教程中，我假设你已经知道我说的东西，因为你之前已经安装过 Ubuntu。如果需要澄清任何一个步骤，请随时在评论栏询问。

--------------------------------------------------------------------------------

via: https://itsfoss.com/reinstall-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/Reinstall-Ubuntu.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/which-ubuntu-install/
[3]: https://ubuntu.com/download/desktop
[4]: https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/reinstall-ubuntu-1.jpg?resize=800%2C473&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/reinstall-ubuntu-dual-boot.jpg?ssl=1
[8]: https://itsfoss.com/replace-linux-from-dual-boot/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/reinstall-ubuntu-3.jpg?ssl=1
