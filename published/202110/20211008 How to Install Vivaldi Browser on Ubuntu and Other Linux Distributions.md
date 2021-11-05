[#]: subject: "How to Install Vivaldi Browser on Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/install-vivaldi-ubuntu-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "imgradeone"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13877-1.html"

[初级] 如何在 Ubuntu 中安装 Vivaldi 浏览器
======

![](https://img.linux.net.cn/data/attachment/album/202110/13/142545reotvtqgqpfvmmvp.jpg)

> 你将在本篇新手教程中学习如何在 Ubuntu、Debian 及其他 Linux 发行版中安装 Vivaldi 网页浏览器，同时本教程也将介绍如何更新和卸载该软件。

[Vivaldi][1] 是一款日益流行的网页浏览器。它基于 Chromium 内核，因此它拥有和 Chrome 类似的功能，但它也新增了一些其他特色功能，让这款浏览器与众不同、更为直观。

它内置了标签组、广告拦截、鼠标手势、笔记管理，甚至还有命令连锁。你甚至可以借助切分视图来一次性浏览多个页面。当然，相比于 Chrome，Vivaldi 更加尊重你的隐私。

![标签平铺，一次性分割浏览多个页面][2]

[Manjaro Linux 近期使用 Vivaldi 取代 Firefox 作为其部分变体的默认浏览器][3]，你可以从这件事来了解 Vivaldi 浏览器的受欢迎程度。

如果你想尝试一下这款浏览器的话，接下来让我告诉你，如何在 Linux 上安装 Vivaldi。你将了解到：

  * 安装 Vivaldi 的 GUI 和命令行方式
  * 将 Vivaldi 更新到最新版本的技巧
  * 在 Ubuntu 中卸载 Vivaldi 的方式

> **非自由软件警告！**  
> 
> Vivaldi 并非完全的开源软件。它的 UI 界面是闭源的。之所以在这里介绍这款浏览器，是因为 Vivaldi 团队正努力让该软件在 Linux 平台上可用。

### 方式 1：在 Ubuntu 中安装 Vivaldi [GUI 方式]

好消息是，Vivaldi 提供了预先构建好的安装包，包括 Ubuntu/Debian 的 DEB 文件，以及 Fedora、Red Hat、SUSE 的 RPM 文件。

它支持 32 位和 64 位平台，也支持 [像树莓派之类的 ARM 设备][4]。

![Vivaldi 为各类 Linux 发行版提供了安装包][5]

安装过程非常简单。你只需要前往 Vivaldi 的官网下载正确的安装包文件，双击打开，然后安装，大功告成。

我将详细介绍在 Ubuntu/Debian 下的安装过程。对于其他类型的发行版，你可以使用类似的步骤。

#### 第 1 步：下载 Vivaldi

前往 Vivaldi 的下载页面，下载支持 Ubuntu 的 DEB 格式安装包。

- [下载 Vivaldi][6]

![下载支持 Ubuntu/Debian 的 DEB 安装包][7]

#### 第 2 步：安装刚刚下载的 DEB 文件

前往你刚刚下载 DEB 文件的下载文件夹。[安装 DEB 文件][8] 非常简单，只需要双击打开，或者右键后使用软件中心打开即可。

![右键点击下载的 DEB 文件并用软件中心打开以安装][9]

这将打开软件中心，在这里可以看到安装 Vivaldi 的选项。点击安装按钮即可。

![点击安装按钮][10]

你将需要输入系统账户的密码，输入密码授权后，Vivaldi 很快就能完成安装，随后安装按钮也变成了移除按钮。这表明 Vivaldi 已经安装完成了。

#### 第 3 步：使用 Vivaldi

按下 `Super`（`Windows`）键打开系统菜单，搜索 Vivaldi，然后单击 Vivaldi 的图标。

![在系统菜单中搜索 Vivaldi][11]

首次启动时，你将看到如下界面。

![运行于 Ubuntu 的 Vivaldi][12]

既然你已经知道了这个方法，那我接下来将展示在 Ubuntu/Debian 使用终端安装 Vivaldi 的方法。

### 方式 2：借助终端，在 Ubuntu/Debian 上安装 Vivaldi

打开终端，确认你已经安装了用于 [在命令行下下载文件][13] 的 `wget`。

```
sudo apt install wget
```

接下来，获取 Vivaldi 仓库的公钥并添加到系统，以让系统信任该来源的软件包。如果你感兴趣的话，你可以阅读 [关于在 Ubuntu 添加第三方软件仓库的文章][14]。

```
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
```

添加完该密钥后，再添加 Vivaldi 的仓库：

```
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
```

现在距离完成也只有一步之遥了。更新软件仓库缓存并安装 Vivaldi。

```
sudo apt update && sudo apt install vivaldi-stable
```

大功告成。现在，前往系统菜单搜索并启动 Vivaldi 吧。

### 在 Ubuntu 中更新 Vivaldi

GUI 和命令行这两种方式都会在系统里添加 Vivaldi 的仓库。这意味着，只要 Vivaldi 发布了新版本，你就可以在系统更新中一并获取 Vivaldi 的更新。

![已添加到系统中的 Vivaldi 仓库][15]

一般情况下，你更新 Ubuntu 系统时，如果 Vivaldi 发布了新版本，那么 Vivaldi 也同时会被更新。

![Vivaldi 浏览器会跟随系统更新][16]

### 在 Ubuntu 中卸载 Vivaldi

如果你不喜欢 Vivaldi 或者不再使用，你可以直接卸载。现在，如果你想 [在 Ubuntu 中卸载软件][17]，你可能会想到软件中心，但软件中心不会查找到外部和第三方的软件包。

目前你必须使用终端卸载 Vivaldi，即便你是使用 GUI 方式安装的。其实这也很简单，打开终端，输入以下命令：

```
sudo apt remove vivaldi-stable
```

`sudo` 会 [在 Ubuntu 中给予你 root 权限][18]。你需要输入当前账户的密码。输入密码时，你可能不会在屏幕上看见输入密码的痕迹。这是正常现象，直接输入密码即可，随后 Vivaldi 将被卸载。

希望这篇关于如何在 Linux 安装 Vivaldi 的教程对你有用。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vivaldi-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[imgradeone](https://github.com/imgradeone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://vivaldi.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/tab-tiling.webp?resize=800%2C448&ssl=1
[3]: https://news.itsfoss.com/vivaldi-replaces-firefox-manjaro/
[4]: https://itsfoss.com/raspberry-pi-alternatives/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/downloading-vivaldi-linux.webp?resize=800%2C541&ssl=1
[6]: https://vivaldi.com/download/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/vivaldi-download-linux.webp?resize=800%2C438&ssl=1
[8]: https://itsfoss.com/install-deb-files-ubuntu/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/installing-vivaldi-ubuntu.webp?resize=800%2C466&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/install-vivaldi-ubuntu-software.png?resize=800%2C407&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/running-vivaldi-in-ubuntu.png?resize=703%2C229&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/Vivaldi-in-Ubuntu.webp?resize=800%2C450&ssl=1
[13]: https://itsfoss.com/download-files-from-linux-terminal/
[14]: https://itsfoss.com/adding-external-repositories-ubuntu/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/Vivaldi-repo-ubuntu.png?resize=800%2C403&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/chrome-edge-update-ubuntu.png?resize=716%2C421&ssl=1
[17]: https://itsfoss.com/uninstall-programs-ubuntu/
[18]: https://itsfoss.com/root-user-ubuntu/
