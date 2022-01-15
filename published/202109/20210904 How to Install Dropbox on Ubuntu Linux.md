[#]: subject: "How to Install Dropbox on Ubuntu Linux"
[#]: via: "https://itsfoss.com/install-dropbox-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13773-1.html"

如何在 Ubuntu Linux 上安装 Dropbox
======

![](https://img.linux.net.cn/data/attachment/album/202109/11/112839qa96g29ws99z9479.jpg)

Dropbox 是 [最受欢迎的云存储服务之一，可用于 Linux][1] 和其他操作系统。

事实上，Dropbox 是最早提供原生 Linux 应用的服务之一。它仍然 [支持 32 位 Linux 系统][2]，这也是一项值得称赞的工作。

在这个初学者的教程中，我将展示在 Ubuntu 上安装 Dropbox 的步骤。这些步骤其实很简单，但有些网站把它弄得不必要的复杂。

### 在 Ubuntu 桌面上安装 Dropbox

让我们来看看安装步骤，一步一步来。

#### 第一步：获取 Ubuntu 的 Dropbox 安装程序

Dropbox 为其安装程序提供 DEB 文件。进入网站的下载页面：

- [下载 Dropbox][3]

下载相应的 DEB 文件。考虑到你使用的是 64 位的 Ubuntu，请获取 64 位版本的 DEB 文件。

![Download the Dropbox installer][4]

#### 第二步：安装 Dropbox 安装程序

你下载的 deb 文件只是 Dropbox 的一个安装程序。实际的 Dropbox 安装稍后开始，类似于 [在 Ubuntu 上安装 Steam][5]。

要 [安装下载的 deb 文件][6]，可以双击它，或者右击并选择用软件安装打开。

![Installing the downloaded Dropbox deb file][7]

它将打开软件中心，你可以点击安装按钮。

![Installing Dropbox deb file][8]

等待安装完成。

#### 第三步：开始安装 Dropbox

现在 Dropbox 安装程序已经安装完毕。按 `Windows` 键（也叫 `Super` 键），搜索 Dropbox 并点击它。

![Start Dropbox for installation][9]

第一次启动时，它显示两个弹出窗口。一个是关于重启 Nautilus（Ubuntu 中的文件资源管理器），另一个是关于 Dropbox 的安装。

![Starting Dropbox installation][10]

点击 “Restart Nautilus” -> “Close”（在 Nautilus 弹出窗口）或 “OK”（在安装弹出窗口），开始实际的 Dropbox 客户端下载和安装。如果 “Nautilus Restart” 在点击关闭按钮时没有关闭，请点击 “X” 按钮。

等待 Dropbox 的安装完成。

![Installing Dropbox][11]

哦！需要重新启动 Nautilus，因为 Dropbox 增加了一些额外的功能，如在文件资源管理器中显示同步状态。

当 Dropbox 安装完毕，它应该会自动带你到 Dropbox 的登录页面，或者你可以点击顶部的 Dropbox 图标并选择登录选项。

![Sign in to Dropbox after installation][12]

事实上，这就是你今后访问 Dropbox 设置的方式。

#### 第四步：开始在 Ubuntu 上使用 Dropbox

![Sign in into Dropbox][13]

**注意**：在你成功登录之前，Dropbox 将不会工作。这里有一个问题。免费版的 Dropbox 限制了你可以链接到你的账户的设备数量。**如果你已经有 3 个链接的设备，你应该删除一些你不使用的旧设备。**

当你成功登录后，你应该看到在你的家目录中创建了一个 Dropbox 文件夹，你的云端文件开始出现在这里。

![Dropbox folder is created under home directory][14]

如果你想节省磁盘空间或带宽，你可以进入偏好设置并选择<ruby>选择性同步<rt>Selective Sync</rt></ruby>选项。该选项允许你只在本地系统上同步来自 Dropbox 云的选定文件夹。

![Using selective sync in Dropbox][15]

Dropbox 会在每次启动时自动启动。我相信，这是你应该从任何云服务中期待的行为。

这就是你在 Ubuntu 上开始使用 Dropbox 所需要的一切。我希望这个教程对你有帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-dropbox-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/cloud-services-linux/
[2]: https://itsfoss.com/32-bit-linux-distributions/
[3]: https://www.dropbox.com/install-linux
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/get-dropbox-for-ubuntu.png?resize=800%2C294&ssl=1
[5]: https://itsfoss.com/install-steam-ubuntu-linux/
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/dropbox-installer-ubuntu.png?resize=797%2C476&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-dropbox-deb-file.png?resize=800%2C346&ssl=1
[9]: https://itsfoss.com/wp-content/uploads/2021/09/start-drobox-ubuntu.webp
[10]: https://itsfoss.com/wp-content/uploads/2021/09/starting-dropbox-installation-800x599.webp
[11]: https://itsfoss.com/wp-content/uploads/2021/09/installing-dropbox.webp
[12]: https://itsfoss.com/wp-content/uploads/2021/09/sign-in-to-dropbox-after-first-installation.webp
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/sign-in-dropbox.png?resize=800%2C409&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/dropbox-folder-ubuntu.png?resize=800%2C491&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/Dropbox-selective-sync.png?resize=800%2C399&ssl=1
