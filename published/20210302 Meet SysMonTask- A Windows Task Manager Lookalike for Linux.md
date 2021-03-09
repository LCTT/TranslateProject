[#]: subject: (Meet SysMonTask: A Windows Task Manager Lookalike for Linux)
[#]: via: (https://itsfoss.com/sysmontask/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13189-1.html)

SysMonTask：一个类似于 Windows 任务管理器的 Linux 系统监控器
======

![](https://img.linux.net.cn/data/attachment/album/202103/09/232304ljsr5jfgluffn4a4.jpg)

得益于桌面环境，几乎所有的 [Linux 发行版都带有任务管理器应用程序][1]。除此之外，还有 [一些其他的 Linux 的系统监控应用程序][2]，它们具有更多的功能。

但最近我遇到了一个为 Linux 创建的任务管理器，它看起来像……嗯……Windows 的任务管理器。

你自己看看就知道了。

![][3]

就我个人而言，我不确定用户界面的相似性是否有意义，但开发者和其他一些 Linux 用户可能不同意我的观点。

### SysMonTask: 一个具有 Windows 任务管理器外观的系统监控器

![][4]

开源软件 [SysMonTask][5] 将自己描述为“具有 Windows 任务管理器的紧凑性和实用性的 Linux 系统监控器，以实现更高的控制和监控”。

SysMonTask 以 Python 编写，拥有以下功能：

  * 系统监控图。 
  * 显示 CPU、内存、磁盘、网络适配器、单个 Nvidia GPU 的统计数据。
  * 在最近的版本中增加了对挂载磁盘列表的支持。
  * 用户进程选项卡可以进行进程过滤，显示递归-CPU、递归-内存和列头的汇总值。
  * 当然，你可以在进程选项卡中杀死一个进程。
  * 还支持系统主题（深色和浅色）。

### 体验 SysMonTask

SysMonTask 需要提升权限。当你启动它时，你会被要求提供你的管理员密码。我不喜欢一个任务管理器一直用 `sudo` 运行，但这只是我的喜好。

我玩了一下，探索它的功能。磁盘的使用量基本稳定不变，所以我把一个 10GB 的文件从外部 SSD 复制到笔记本的磁盘上几次。你可以看到文件传输时对应的峰值。

![][6]

进程标签也很方便。它在列的顶部显示了累积的资源利用率。

杀死按钮被添加在底部，所以你要做的就是选择一个进程，然后点击“Killer” 按钮。它在 [杀死进程][7] 之前会询问你的确认。

![][8]

### 在 Linux 发行版上安装 SysMonTask

对于一个简单的应用程序，它需要下载 50 MB 的存档文件，并占用了大约 200 MB 的磁盘。我想这是因为 Python 的依赖性。

还有就是它读取的是 env。

在写这篇文章的时候，SysMonTask 可以通过 [PPA][9] 在基于 Ubuntu 的发行版上使用。

在基于 Ubuntu 的发行版上，打开一个终端，使用以下命令添加 PPA 仓库：

```
sudo add-apt-repository ppa:camel-neeraj/sysmontask
```

当然，你会被要求输入密码。在新版本中，仓库列表会自动更新。所以，你可以直接安装应用程序：

```
sudo apt install sysmontask
```

基于 Debian 的发行版也可以尝试从 deb 文件中安装它。它可以在发布页面找到。

对于其他发行版，没有现成的软件包。令我惊讶的是，它基本上是一个 Python 应用程序，所以可以为其他发行版添加一个 PIP 安装程序。也许开发者会在未来的版本中添加它。

由于它是开源软件，你可以随时得到源代码。

- [SysMonTask Deb 文件和源代码][10]

安装完毕后，在菜单中寻找 SysMonTask，并从那里启动它。

#### 删除 SysMonTask

如果你想删除它，使用以下命令：

```
sudo apt remove sysmontask
```

最好也 [删除 PPA][11]：

```
sudo add-apt-repository -r ppa:camel-neeraj/sysmontask
```

你也可以在这里 [使用 PPA 清除][12] 工具，这是一个处理 PPA 应用程序删除的方便工具。

### 你会尝试吗？

对我来说，功能比外观更重要。SysMonTask 确实有额外的功能，监测磁盘性能和检查 GPU 统计数据，这是其他系统监视器通常不包括的东西。

如果你尝试并喜欢它，也许你会喜欢添加 `Ctrl+Alt+Del` 快捷键来启动 SysMonTask，以获得完整的感觉 :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/sysmontask/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/task-manager-linux/
[2]: https://itsfoss.com/linux-system-monitoring-tools/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/sysmontask-1.png?resize=800%2C559&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/SysMonTask-CPU.png?resize=800%2C537&ssl=1
[5]: https://github.com/KrispyCamel4u/SysMonTask
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/sysmontask-disk-usage.png?resize=800%2C498&ssl=1
[7]: https://itsfoss.com/how-to-find-the-process-id-of-a-program-and-kill-it-quick-tip/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/kill-process-sysmontask.png?resize=800%2C500&ssl=1
[9]: https://itsfoss.com/ppa-guide/
[10]: https://github.com/KrispyCamel4u/SysMonTask/releases
[11]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[12]: https://itsfoss.com/ppa-purge/
