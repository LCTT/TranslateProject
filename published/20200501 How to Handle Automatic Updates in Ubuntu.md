[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12257-1.html)
[#]: subject: (How to Handle Automatic Updates in Ubuntu)
[#]: via: (https://itsfoss.com/auto-updates-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 中处理自动的无人值守升级
======

> 本教程教你如何处理无人值守的升级，即 Ubuntu Linux 的自动系统更新。

![](https://img.linux.net.cn/data/attachment/album/202005/27/234040fxb0nkc53pk0nxvx.jpg)

有时，当你尝试[关闭 Ubuntu 系统][1]时，可能看到这个阻止你关闭的页面：

> 关机过程中正在进行无人值守升级，请不要关闭计算机。

![Unattended Upgrade In Progress In Ubuntu][2]

你可能会问这个“无人值守升级”是什么，怎么会在你不知情的情况下运行呢？

原因是 [Ubuntu][3] 非常重视系统的安全性。默认情况下，它会每天自动检查系统更新，如果发现安全更新，它会下载这些更新并自行安装。对于正常的系统和应用更新，它会通过软件更新程序通知你。

由于所有这些都是在后台发生的，所以在你尝试关闭系统或尝试自行安装应用程序之前，你甚至不会意识到这一点。

在这些无人值守的升级过程中，尝试安装新软件，会导致著名的[无法获得锁定的错误][4]。

![][5]

如你所见，自动更新带来了一些小麻烦。你可以选择禁用自动更新，但这意味着你必须一直手动检查并[更新你的 Ubuntu 系统][6]。

> **你真的需要禁用自动更新吗？**
>
> 请注意，这是一项安全功能。Linux 实际上允许你禁用系统中的所有功能，甚至禁用这些安全功能。 
>
> 但是我认为，作为普通用户，**你不应该禁用自动更新**。毕竟，它可以确保你的系统安全。
>
> 为了确保系统的安全性，你可以忍受自动更新所带来的小麻烦。

现在，你已经收到警告，还是觉得承担手动更新系统的额外任务更好，那么让我们看看如何处理自动更新。

与往常一样，有两种方法可以做到：GUI 和命令行。 我将向你展示两种方法。

我在这里使用 Ubuntu 20.04，但是这些步骤对 Ubuntu 18.04 和任何其他 Ubuntu 版本均有效。

### 方法 1：以图形方式禁用 Ubuntu 中的自动更新

进入菜单并查找“软件和更新”工具。

![Software & Updates Settings][7]

在此处，进入“更新”选项卡。查找“自动检查更新”。默认情况下，它设置为“每日”。

你可以将其更改为“从不”，你的系统将永远不会检查更新。如果不检查更新，它就不会找到要安装的新的更新。

![Disable Auto Updates in Ubuntu Completely][8]

如果这样做，那么必须不时手动更新系统。但是，这是额外的工作，你可能不会一直记得。

#### 在 Ubuntu 中处理自动更新的更好方法

就个人而言，我建议让它自己检查更新。如果你不希望它自动安装更新，那么可以更改该行为，以通知有关安全更新的可用性。

保持“自动检查更新”为“每日”，然后将“有安全更新时”选项更改为“立即显示”，而不是“自动下载并安装”。

![Get notified for security updates instead of automatically installing them][9]

这样，它会检查是否有更新，而不是在后台自动安装更新，软件更新程序会通知你有可用于系统的更新。而你的系统已经完成正常的系统和软件更新。

![Get notified about security updates][10]

使用此设置，关闭系统时将不会看到“正在进行的无人值守升级”。但是，由于两个不同的进程无法同时使用 apt 包管理器，因此你仍然可能会遇到“无法锁定”错误。

我相信这是一个更好的解决方案，你不认为是么？

如我承诺的同时有 GUI 和命令行方法一样，让我向你展示如何在终端中禁用无人值守的升级。

### 如何在 Ubuntu 中使用命令行禁用自动更新

你可以在 `/etc/apt/apt.conf.d/20auto-upgrades` 中找到自动升级设置。Ubuntu 终端中的默认文本编辑器是 Nano，因此你可以使用以下命令来编辑此文件：

```
sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

现在，如果你不希望系统自动检查更新，那么可以将 `APT::Periodic::Update-Package-Lists` 的值更改为 `"0"`。

```
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
```

如果你希望它检查更新但不自动安装无人值守的升级，那么可以选择将其设置为：

```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "0";
```

### 最后

由于某种原因，启用了自动安全更新，建议你保持这种状态。这个小烦恼实际上并不值得冒险损害系统安全性。你怎么看？

--------------------------------------------------------------------------------

via: https://itsfoss.com/auto-updates-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/schedule-shutdown-ubuntu/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/unattended-upgrade-in-progress-in-ubuntu.png?ssl=1
[3]: https://ubuntu.com/
[4]: https://itsfoss.com/could-not-get-lock-error/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/Could_not_get_lock.jpg?ssl=1
[6]: https://itsfoss.com/update-ubuntu/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-updates-settings-ubuntu-20-04.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/disable-auto-updates-ubuntu.jpg?ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/handle-auto-updates-ubuntu.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/updates-available-ubuntu.png?ssl=1
