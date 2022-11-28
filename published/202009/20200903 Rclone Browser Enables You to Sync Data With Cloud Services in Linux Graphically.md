[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12605-1.html)
[#]: subject: (Rclone Browser Enables You to Sync Data With Cloud Services in Linux Graphically)
[#]: via: (https://itsfoss.com/rclone-browser/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Rclone Browser 让你在 Linux 中以图形化的方式与云服务同步数据
======

> Rclone Browser 是一款高效的 GUI 程序，它可以让你轻松地使用 Rclone 管理和同步云存储上的数据。在这里，我们来看看它提供的功能和工作方式。

如果你想原生地在 Linux 上毫不费力地使用 One Drive 或 [Google Drive][1]，你可以选择像 [Insync][2] 这样的高级 GUI 工具。

如果你能在终端上下功夫，你可以使用 [rclone][4] 与许多 [Linux 上的云存储服务][5]进行同步。我们有一份详细的[在 Linux 中使用 Rclone 与 OneDrive 同步的指南][6]。

[rclone][4] 是一个相当流行且有用的命令行工具。rclone 提供的功能是很多有经验的用户需要的。

然而，即使它足够有用，也不是每个人都能从终端使用它。

因此，在本文中，我将介绍一个令人印象深刻的 GUI “Rclone Browser”，它可以让你轻松地使用 Rclone 管理和同步云存储上的数据。

值得注意的是，rclone 确实提供了一个实验性的基于 Web 的 GUI。但我们将在这里专注于 [Rclone Browser][7]。

![][8]

### Rclone Browser：Rclone 的开源 GUI

Rclone Browser 是一款可以让你浏览、修改、上传/下载、列出文件，并在想充分利用远程存储位置的情况下，做更多你想做的事情的 GUI。

它提供了一个简单的用户界面，并且工作良好（根据我的快速测试）。让我们详细看看它提供的功能以及如何开始使用它。

### Rclone Browser 的功能

![][9]

它提供了很多选项和控制来管理远程存储位置。根据你的使用情况，你可能会发现它的功能丰富或不知所措。以下是它的功能：

  * 浏览和修改 rclone 远程存储位置
  * 支持加密云存储
  * 支持自定义位置和配置加密
  * 不需要额外的配置。它将使用相同的 rclone 配置文件（如果你有的话）
  * 在不同的标签页中同时导航多个位置
  * 按层次列出文件（按文件名、大小和修改日期）
  * rclone 命令的执行是异步的，不会使 GUI 冻结
  * 你可以上传、下载、创建新文件夹、重命名、删除文件和文件夹
  * 上传文件时支持拖放
  * 在 VLC 等播放器中播放流媒体文件
  * 挂载和卸载文件夹/云端驱动器
  * 能够计算文件夹的大小、导出文件列表，并将 rclone 命令复制到剪贴板
  * 支持便携模式
  * 支持共享驱动器（如果你使用 Google Drive）。
  * 针对支持共享链接的远程存储服务，支持获取共享链接
  * 能够创建任务，你可以很容易地保存，以便以后再次运行或编辑。
  * 黑暗模式
  * 跨平台支持（Windows、macOS 和 Linux）。

### 在 Linux 上安装 Rclone Browser

在使用 Rclone Browser 之前，你需要在你的 Linux 发行版上安装 rclone。请按照[官方安装说明][10]来安装。

你可以在 [GitHub 页面][7]的[发布页][11]找到 Rclone Browser 的 AppImage 文件。所以，你在任何 Linux 发行版上运行它都不会有问题。

如果你不知道 AppImage，我会推荐你阅读我们的[在 Linux 上使用 AppImage][12] 指南。

你也可以选择构建它。操作说明在 GitHub 页面上。

- [下载 Rclone Browser][7]

### 开始使用 Rclone Browser

在这里，我只分享一下使用 Rclone Browser 应该知道的几件事。

![][13]

如果你在终端中使用 rclone 时有任何现有的远程位置，它将自动显示在 GUI 中。你也可以点击 “Refresh” 按钮来获取最新的新增内容。

如上图所示，当你点击 “Config” 按钮时，它会启动终端，让你轻松地添加一个新的远程或按你的要求配置它。当终端弹出的时候不用担心，Rclone browser 会执行命令来完成所有必要的任务，你只需要在需要的时候设置或编辑一些东西。你不需要执行任何 rclone 命令。

如果你有一些现有的远程位置，你可以使用 “Open” 按钮打开它们，并在不同的标签页中访问云存储，如下所示。

![][14]

你可以轻松地挂载云驱动器，上传/下载文件，获取详细信息，共享文件夹的公共链接（如果支持），以及直接播放流媒体文件。

如果你想复制、移动或与远程存储位置同步数据，你可以简单地创建一个任务来完成。只需确保设置正确，你可以模拟执行或者直接运行任务。

你可以在 “Jobs” 页面找到所有正在运行的任务，如果需要，你可以取消/停止它们。

![][15]

除了上面提到的所有基本功能外，你可以前往 “File->Preferences” 更改 rclone 位置、挂载选项、下载文件夹、带宽设置以及代理。

![][16]

要了解更多关于它的用法和功能，你可能需要前往 [GitHub 页面][7]了解所有的技术信息。

### 总结

Rclone Browser 对于每一位想要使用 rclone 强大功能的 Linux 用户来说，绝对是得心应手。

你是否已经尝试过了呢？你更喜欢通过 GUI 还是终端来使用 rclone？请在下面的评论中告诉我你的想法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/rclone-browser/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/use-google-drive-linux/
[2]: https://itsfoss.com/recommends/insync/
[3]: https://itsfoss.com/affiliate-policy/
[4]: https://rclone.org/
[5]: https://itsfoss.com/cloud-services-linux/
[6]: https://itsfoss.com/use-onedrive-linux-rclone/
[7]: https://github.com/kapitainsky/RcloneBrowser
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/Cloud-sync.gif?resize=800%2C450&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/rclone-browser-screenshot.jpg?resize=800%2C618&ssl=1
[10]: https://rclone.org/install/
[11]: https://github.com/kapitainsky/RcloneBrowser/releases/tag/1.8.0
[12]: https://itsfoss.com/use-appimage-linux/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/rclone-browser-howto.png?resize=800%2C412&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/rclone-browser-drive.png?resize=800%2C505&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/rclone-browser-task.jpg?resize=800%2C493&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/rclone-browser-preferences.jpg?resize=800%2C590&ssl=1
