[#]: subject: "How to Upgrade to Ubuntu 21.10 Right Now"
[#]: via: "https://itsfoss.com/upgrade-ubuntu-to-newer-version/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13902-1.html"

如何现在就升级到 Ubuntu 21.10
======

[Ubuntu 21.10 “Impish Indri” 刚刚发布][1]。如果你正在使用 Ubuntu 21.04，你应该有升级到 Ubuntu 21.10 的选项。

![](https://img.linux.net.cn/data/attachment/album/202110/20/105035l6ig4lkjnk5cipuw.jpg)

然而，这种推出将是逐步的。这意味着不是每个人都会立即得到新版本可用的通知。在你看到升级选项之前，可能需要几周的时间。

但是，如果你迫不及待地想获得带有 GNOME 40 和其他新功能的 Ubuntu 21.10 呢？你真的需要等待吗？不用。

### 现在就从 Ubuntu 21.04 升级到 Ubuntu 21.10

以下是你要做的。打开“<ruby>软件和更新<rt>Software & Updates</rt></ruby>”应用：

![Start the Software & Updates application][3]

并确保你在“<ruby>更新<rt>Updates</rt></ruby>”标签下将“<ruby>通知我新的 Ubuntu 版本<rt>Notify me of a new Ubuntu version</rt></ruby>”设置为“<ruby>任何新版本<rt>For any new version</rt></ruby>”。

![Make sure that settings are right for new Ubuntu version notification][4]

现在打开终端，输入以下命令，以确保你的系统已经更新：

```
sudo apt update && sudo apt upgrade
```

当你的 Ubuntu 21.04 系统安装了所有的更新，运行更新管理器来寻找开发版本（本例中为 Ubuntu 21.10）。

```
update-manager -d
```

它将打开寻找更新的“<ruby>更新管理器<rt>Update Manager</rt></ruby>”。由于你已经更新了系统，它不会找到新的更新来安装。然而，它将看到 Ubuntu 21.10 现在已经可用。

![Hit the upgrade button][2]

你可以点击“<ruby>升级<rt>Upgrade</rt></ruby>”按钮，按照屏幕上的选项开始升级程序。你需要有良好的网络速度来下载 2GB 的更新。确保你的系统在升级过程中保持与电源的连接。

享受 Ubuntu 21.10！

--------------------------------------------------------------------------------

via: https://itsfoss.com/upgrade-ubuntu-to-newer-version/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-13887-1.html
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/upgrade-to-Ubuntu-21-10.webp?resize=797%2C287&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/software-and-updates.webp?resize=800%2C166&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/ubuntu-upgrade-settings.webp?resize=800%2C338&ssl=1
