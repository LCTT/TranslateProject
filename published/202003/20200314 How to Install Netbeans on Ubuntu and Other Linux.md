[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12017-1.html)
[#]: subject: (How to Install Netbeans on Ubuntu and Other Linux)
[#]: via: (https://itsfoss.com/install-netbeans-ubuntu/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

如何在 Ubuntu 和其他 Linux 上安装 Netbeans
======

> 在本教程中，你将学习在 Ubuntu 和其他 Linux 发行版上安装 Netbeans IDE 的各种方法。

[NetBeans][1] 是一个开源集成开发环境，具有良好的跨平台支持。此工具已被 Java 和 C/C++ 开发社区广泛认可。

开发环境相当灵活。你可以配置它以支持各种开发。实际上，你可以用它来开发 Web、桌面和移动应用，而无需离开此平台。这太神奇了，不是吗？除此之外，用户可以添加许多已知语言，如 [PHP][2]、C、C++、HTML、[Ajax][3]、JavaScript、JSP、Ruby on Rails 等。

如果你正在了解如何在 Linux 上安装 Netbeans，那么有几种方法可以做到。我编写本教程主要是为了 Ubuntu，但一些安装方法也适用于其他发行版。

* [使用 apt 在 Ubuntu 上安装 Netbeans][4]：适用于 Ubuntu 和基于 Ubuntu 的发行版，但通常**它是旧版的 Netbeans**
* [使用 Snap 在 Ubuntu 上安装 Netbeans][5]：适用于已启用 Snap 包支持的任何 Linux 发行版
* [使用 Flatpak 安装 Netbeans] [6]：适用于所有支持 Flatpak 包的 Linux 发行版

### 使用 Apt 包管理器在 Ubuntu 上安装 Netbeans IDE

如果在 Ubuntu 软件中心搜索 Netbeans，你将找到两个版本的 Netbeans。Apache Netbeans 是 snap 版本，大小较大，但提供了最新的 Netbeans。

只需单击一下即可安装它。无需打开终端。是最简单的方法。

![Apache Netbeans in Ubuntu Software Center][7]

你也可以选择使用 `apt` 命令，但使用 `apt` 时，你无法获得最新的 Netbeans。例如，在编写本教程时，Ubuntu 18.04 中 Apt 提供 Netbeans 10，而 Snap 有最新的 Netbeans 11。

如果你是 [apt 或 apt-get][8] 的粉丝，那么可以[启用 universe 仓库][9]，并在终端中使用此命令安装 Netbeans：

```
sudo apt install netbeans
```

### 使用 Snap 在任何 Linux 发行版上安装 Netbeans IDE

![][10]

Snap 是一个通用包管理器，如果[发行版上启用了 Snap][11]，那么可以使用以下命令安装它：

```
sudo snap install netbeans --classic
```

此过程可能需要一些时间才能完成，因为总下载大小约为 1 GB。完成后，你将在应用程序启动器中看到它。

你不仅可以通过 Snap 获取最新的 Netbeans，已安装的版本将自动更新到较新版本。

### 使用 Flatpak 安装 Netbeans

[Flatpak][12] 是另一个类似 Snap 的包安装器。默认情况下，某些发行版支持 Flatpak，在其他发行版上你可以[启用 Flatpak 支持][13]。

发行版支持 Flatpak 后，你可以使用以下命令安装 Netbeans：

```
flatpak install flathub org.apache.netbeans
```

另外，你可以下载源码并自己编译。

- [下载 Netbeans][14]

希望你使用了上面其中一个方法在你的 Ubuntu 上安装了 Netbeans。但你使用的是哪个方法？有遇到问题么？让我们知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-netbeans-ubuntu/

作者：[Srimanta Koley][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://netbeans.org/
[2]: https://www.php.net/
[3]: https://en.wikipedia.org/wiki/Ajax_(programming)
[4]: tmp.ZNFNEC210y#apt
[5]: tmp.ZNFNEC210y#snap
[6]: tmp.ZNFNEC210y#flatpak
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/apache-netbeans-ubuntu-software-center.jpg?ssl=1
[8]: https://itsfoss.com/apt-vs-apt-get-difference/
[9]: https://itsfoss.com/ubuntu-repositories/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/Install_Netbeans_Linux.jpg?ssl=1
[11]: https://itsfoss.com/install-snap-linux/
[12]: https://flatpak.org/
[13]: https://itsfoss.com/flatpak-guide/
[14]: https://netbeans.apache.org/download/index.html
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/srimanta.jpg?ssl=1
