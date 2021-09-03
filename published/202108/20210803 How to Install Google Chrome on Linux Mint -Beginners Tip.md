[#]: subject: (How to Install Google Chrome on Linux Mint [Beginners Tip])
[#]: via: (https://itsfoss.com/install-chrome-linux-mint/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13659-1.html)

初级：如何在 Linux Mint 上安装 Google Chrome
======

![](https://img.linux.net.cn/data/attachment/album/202108/08/133301ni5k5i8rziezwe5i.jpg)

这应该是一个非常简单的话题，但我写这个是因为我看到很多网站推荐在 Linux Mint 上安装 Google Chrome 的奇怪命令行步骤。那是可行的，但那是不必要的复杂，特别是对于不熟悉命令行的初学者。

实际上，你根本不需要走终端方式。你所要做的就是去谷歌浏览器的网站，下载 Ubuntu 的安装文件并安装。

让我详细介绍一下步骤，供你了解。

### 在 Linux Mint 上安装 Google Chrome

进入 Google Chrome 的网站。

[Google Chrome Website][1]

你会看到一个 “Download Chrome” 的按钮。点击它。

![Download Chrome for Linux][2]

它将向你显示在 Linux 上下载 Chrome 的两个选项。选择 Debian/Ubuntu 选项并点击 “Accept and Install” 按钮。

![Select Debian/Ubuntu option for Chrome package on Mint][3]

在开始下载之前，Firefox 会询问你是否要用 Gdebi 打开下载的文件或保存它。你可以选择任何一个选项，因为最终你会 [使用 Gdebi 来安装 deb 文件][4]。然而，我更喜欢先保存文件。

![Save the deb file][5]

等待下载完成。

![Wait for Google Chrome download to finish][6]

下载完成后，在文件管理器中进入下载文件夹。要 [安装 deb 文件][7]，可以双击它或者右击它并选择 “Open With GDebi Package Installer”。

![Double click on the downloaded deb file to install it][8]

等待几秒钟，它应该给你一个安装的选项。

![Hit the Install Package option in Gdebi][9]

它将要求你提供 Linux Mint 的账户密码。在 Linux 中，你需要提供你的密码来安装任何应用。

![Enter your password for installing an application][10]

你就要完成了。它将显示哪些额外的软件包将与之一起安装（如果有的话）。点击继续按钮即可。

![Details on the packages to be installed][11]

安装完成应该只需要几秒钟或最多一分钟。

![Installing Chrome in progress][12]

安装完成后，你应该看到这样的屏幕。

![Chrome successfully installed on Linux Mint][13]

安装完成后，你可以在应用菜单中寻找 Google Chrome 来运行它。

![Run Google Chrome in Linux Mint][14]

然后在 Linux Mint 上享受 Google Chrome。

![Google Chrome running in Linux Mint][15]

### 如何在 Linux Mint 上更新 Google Chrome

这个方法的好处是，谷歌浏览器会随着系统的更新而更新。当你安装 deb 文件的时候，它也会在你的系统中添加一个来自谷歌的仓库。

![Chrome adds a repository to the system for providing updates][16]

由于这个添加的仓库，Chrome 浏览器上的更新将被添加到系统更新中。因此，当你更新 Linux Mint 时，它也会被更新（如果有可用的更新）。

### 如何从 Linux Mint 中删除 Google Chrome

不喜欢 Chrome？不用担心。你可以从 Linux Mint 中卸载谷歌浏览器。同样这次你也不需要使用终端。

点击菜单，搜索 Chrome。在 Chrome 图标上点击右键，你会看到一个 “Uninstall” 选项。选择它。

![Removing Google Chrome from Linux Mint][17]

当然，你必须输入你的密码。它将显示要删除的软件包。在这里点击 OK。

![Uninstalling Google Chrome from Linux mint][18]

你可以留下 Google Chrome 的仓库，也可以删除它。这是你的选择。

我希望你觉得这个教程对在 Linux Mint 上使用 Google Chrome 有帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-chrome-linux-mint/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.google.com/chrome/index.html
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/download-chrome-linux-mint.png?resize=800%2C320&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/downloading-chrome-linux-mint.png?resize=800%2C679&ssl=1
[4]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/saving-downloaded-chrome-linux-mint.png?resize=798%2C400&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/finishing-chrome-download-linux-mint.png?resize=799%2C315&ssl=1
[7]: https://itsfoss.com/install-deb-files-ubuntu/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/installing-google-chrome-deb-file-mint.png?resize=799%2C529&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/installing-google-chrome-gdebi-mint.png?resize=801%2C548&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/enter-password-for-installing-chrome-mint.png?resize=800%2C399&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/installing-chrome-mint.png?resize=799%2C483&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/installing-chrome-mint-progress.png?resize=799%2C489&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/chrome-installed-mint.png?resize=798%2C483&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/run-google-chrome-linux-mint.png?resize=798%2C580&ssl=1
[15]: https://itsfoss.com/wp-content/uploads/2021/08/google-chrome-in-linux-mint-800x450.webp
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/google-chrome-repo-added-mint.png?resize=799%2C272&ssl=1
[17]: https://itsfoss.com/wp-content/uploads/2021/08/removing-google-chrome-from-mint.webp
[18]: https://itsfoss.com/wp-content/uploads/2021/08/uninstalling-google-chrome-from-linux-mint.webp
