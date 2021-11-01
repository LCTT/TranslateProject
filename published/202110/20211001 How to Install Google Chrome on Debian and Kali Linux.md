[#]: subject: "How to Install Google Chrome on Debian and Kali Linux"
[#]: via: "https://itsfoss.com/install-chrome-debian-kali-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13895-1.html"

如何在 Debian 和 Kali Linux 上安装 Chrome 浏览器
======

> Debian 和基于 Debian 的 Kali Linux 将 Firefox 作为默认的网页浏览器。但这并不意味着你不能在其中安装其他网页浏览器。

![](https://img.linux.net.cn/data/attachment/album/202110/18/175716cfvxnvf05b5je1ax.jpg)

Chrome 浏览器非常流行，你可能已经在其他系统上使用它了。如果你想在 Debian 上安装 Chrome，你肯定可以这样做。

你在 Debian 的软件库中找不到 Chrome，因为它不是开源软件，但你可以从 Chrome 网站下载并安装它。

在本教程中，我将向你展示在 Debian 上安装 Chrome 的两种方法：

  * GUI 方法
  * 命令行方法

让我们先从 GUI 方法开始。

> 注意：我在这里的例子中使用的是 Debian，但由于 Kali Linux 是基于 Debian 的，所以同样的方法也适用于 Kali Linux。

### 方法 1: 在 Debian 上以图形方式安装 Chrome 浏览器

这是一个不费吹灰之力的方法。你去 Chrome 网站，下载 deb 文件，然后双击它来安装它。我将详细地展示这些步骤，这样你就能很容易地掌握了。

前往  Chrome 的网站。

[Get Google Chrome][1]

你会看到下载 Chrome 的选项。

![Click on the Download Chrome button][2]

当你点击下载按钮时，它会给你两个下载安装文件的选项。选择写着 Debian/Ubuntu 的那个。

![Download the Chrome installer file for Debian][3]

**请注意，Chrome 浏览器不适用于 32 位系统。**

接下来，你应该选择将文件保存到电脑中，而不是在软件中心打开进行安装。这样一来，下载的文件将被保存在下载文件夹中，而不是临时目录中。

![Save the downloaded DEB file for Google Chrome][4]

进入下载文件夹，右击下载的 DEB 文件，选择用 “Software Install” 打开它。

![Right click on the downloaded DEB file and open with Software Install][5]

它将打开软件中心，你应该看到现在安装 Chrome 浏览器的选项。点击安装按钮。

![Click on the install button][6]

你会被要求输入账户的密码。这是你用来登录系统的同一密码。

![Enter your account’s password][7]

在不到一分钟的时间里，Chrome 就会安装完毕。你现在应该看到一个删除选项，这表明软件已经安装完毕。

![Chrome is now installed][8]

当 Chrome 在 Debian 上安装完毕，在系统菜单中搜索它并启动它。

![Start Google Chrome][9]

它将要求成为你的默认浏览器，并将崩溃报告发送给谷歌。你可以取消勾选这两个选项。然后你就可以看到谷歌浏览器的窗口。

![][10]

如果你登录了你的谷歌账户，你应该可以在这里同步你的密码、书签和其他浏览数据。好好体验吧！

还有一点，安装完 Chrome 后，你可以从系统中删除下载的 DEB 文件。不再需要它了，甚至在卸载 Chrome 时也不需要。

### 方法 2：在 Debian 上从终端安装 Chrome

你刚才看到的内容可以在终端中轻松实现。

首先，确保你的软件包缓存已经刷新，并且你已经安装了 `wget`，用于 [在终端中从网上下载文件][11]。

```
sudo apt update && sudo apt install wget
```

接下来是下载 Chrome 的 .deb 文件。

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

下载后，你可以用 `apt` 命令 [在终端安装 deb 文件][12]，像这样：

```
sudo apt install ./google-chrome-stable_current_amd64.deb
```

安装完成后，你就可以开始使用 Chrome 了。

### 额外提示：更新 Chrome

这两种方法都会将谷歌的软件库添加到你的系统中。你可以在你的 `sources.list.d` 目录中看到它：

```
cat /etc/apt/sources.list.d/google-chrome.list
```

这意味着 Chrome 将与 Debian 和 Kali Linux 中的其他系统更新一起被更新。你知道 [如何在命令行中更新你的 Kali Linux][13] 或 Debian 系统么？只要使用这个命令：

```
sudo apt update && sudo apt upgrade -y
```

### 从你的系统中卸载 Chrome

即使你选择用 GUI 方法在 Debian 上安装 Chrome，你也必须使用终端来删除它。

不要担心。这其实只是一个命令：

```
sudo apt purge google-chrome-stable
```

根据要求输入你的账户密码。当你输入密码时，屏幕上没有任何显示。这没关系。输入它并按回车键，确认删除。

![][14]

好了，就这些了。我希望你觉得这个教程有帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-chrome-debian-kali-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.google.com/chrome/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/download-chrome-on-debian.webp?resize=800%2C344&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/downloading-google-chrome.webp?resize=800%2C512&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/save-downloaded-chrome-installer-file-debian.webp?resize=800%2C430&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/open-deb-file-with-software-install.webp?resize=800%2C419&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-chrome-debian.webp?resize=800%2C408&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/enter-account-password-while-installing-deb-file.webp?resize=800%2C420&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/chrome-installed-debian.webp?resize=800%2C384&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/start-chrome-debian.webp?resize=800%2C276&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/Chrom-in-Debian.webp?resize=800%2C450&ssl=1
[11]: https://itsfoss.com/download-files-from-linux-terminal/
[12]: https://itsfoss.com/install-deb-files-ubuntu/
[13]: https://linuxhandbook.com/update-kali-linux/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/remove-google-chrome-ubuntu.webp?resize=800%2C450&ssl=1
