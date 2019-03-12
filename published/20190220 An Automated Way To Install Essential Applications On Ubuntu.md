[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10600-1.html)
[#]: subject: (An Automated Way To Install Essential Applications On Ubuntu)
[#]: via: (https://www.ostechnix.com/an-automated-way-to-install-essential-applications-on-ubuntu/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

在 Ubuntu 上自动化安装基本应用的方法
======

![](https://www.ostechnix.com/wp-content/uploads/2019/02/alfred-720x340.png)

默认安装的 Ubuntu 并未预先安装所有必需的应用。你可能需要在网上花几个小时或者向其他 Linux 用户寻求帮助才能找到并安装 Ubuntu 所需的应用。如果你是新手，那么你肯定需要花更多的时间来学习如何从命令行（使用 `apt-get` 或 `dpkg`）或从 Ubuntu 软件中心搜索和安装应用。一些用户，特别是新手，可能希望轻松快速地安装他们喜欢的每个应用。如果你是其中之一，不用担心。在本指南中，我们将了解如何使用名为 “Alfred” 的简单命令行程序在 Ubuntu 上安装基本应用。

Alfred 是用 Python 语言编写的自由、开源脚本。它使用 Zenity 创建了一个简单的图形界面，用户只需点击几下鼠标即可轻松选择和安装他们选择的应用。你不必花费数小时来搜索所有必要的应用程序、PPA、deb、AppImage、snap 或 flatpak。Alfred 将所有常见的应用、工具和小程序集中在一起，并自动安装所选的应用。如果你是最近从 Windows 迁移到 Ubuntu Linux 的新手，Alfred 会帮助你在新安装的 Ubuntu 系统上进行无人值守的软件安装，而无需太多用户干预。请注意，还有一个名称相似的 Mac OS 应用，但两者有不同的用途。

### 在 Ubuntu 上安装 Alfred

Alfred 安装很简单！只需下载脚本并启动它。就这么简单。

```
$ wget https://raw.githubusercontent.com/derkomai/alfred/master/alfred.py
$ python3 alfred.py
```

或者，使用 `wget` 下载脚本，如上所示，只需将 `alfred.py` 移动到 `$PATH` 中：

```
$ sudo cp alfred.py /usr/local/bin/alfred
```

使其可执行：

```
$ sudo chmod +x /usr/local/bin/alfred
```

并使用命令启动它：

```
$ alfred
```

### 使用 Alfred 脚本轻松快速地在 Ubuntu 上安装基本应用程序

按照上面所说启动 Alfred 脚本。这就是 Alfred 默认界面的样子。

![][2]

如你所见，Alfred 列出了许多最常用的应用类型，例如：

  * 网络浏览器，
  * 邮件客户端，
  * 消息，
  * 云存储客户端，
  * 硬件驱动程序，
  * 编解码器，
  * 开发者工具，
  * Android，
  * 文本编辑器，
  * Git，
  * 内核更新工具，
  * 音频/视频播放器，
  * 截图工具，
  * 录屏工具，
  * 视频编码器，
  * 流媒体应用，
  * 3D 建模和动画工具，
  * 图像查看器和编辑器，
  * CAD 软件，
  * PDF 工具，
  * 游戏模拟器，
  * 磁盘管理工具，
  * 加密工具，
  * 密码管理器，
  * 存档工具，
  * FTP 软件，
  * 系统资源监视器，
  * 应用启动器等。

你可以选择任何一个或多个应用并立即安装它们。在这里，我将安装 “Developer bundle”，因此我选择它并单击 OK 按钮。

![][3]

现在，Alfred 脚本将自动你的 Ubuntu 系统上添加必要仓库、PPA 并开始安装所选的应用。

![][4]

安装完成后，你将看到以下消息。

![][5]

恭喜你！已安装选定的软件包。

你可以使用以下命令[在 Ubuntu 上查看最近安装的应用][6]：

```
$ grep " install " /var/log/dpkg.log
```

你可能需要重启系统才能使用某些已安装的应用。类似地，你可以方便地安装列表中的任何程序。

提示一下，还有一个由不同的开发人员编写的类似脚本，名为 `post_install.sh`。它与 Alfred 完全相同，但提供了一些不同的应用。请查看以下链接获取更多详细信息。

- [Ubuntu Post Installation Script](https://www.ostechnix.com/ubuntu-post-installation-script/)

这两个脚本能让懒惰的用户，特别是新手，只需点击几下鼠标就能够轻松快速地安装他们想要在 Ubuntu Linux 中使用的大多数常见应用、工具、更新、小程序，而无需依赖官方或者非官方文档的帮助。

就是这些了。希望这篇文章有用。还有更多好东西。敬请期待！

干杯！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/an-automated-way-to-install-essential-applications-on-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2019/02/alfred-1.png
[3]: http://www.ostechnix.com/wp-content/uploads/2019/02/alfred-2.png
[4]: http://www.ostechnix.com/wp-content/uploads/2019/02/alfred-4.png
[5]: http://www.ostechnix.com/wp-content/uploads/2019/02/alfred-5-1.png
[6]: https://www.ostechnix.com/list-installed-packages-sorted-installation-date-linux/
