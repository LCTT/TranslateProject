如何轻松地检查 Ubuntu 版本以及其它系统信息
======

> 摘要：想知道你正在使用的 Ubuntu 具体是什么版本吗？这篇文档将告诉你如何检查你的 Ubuntu 版本、桌面环境以及其他相关的系统信息。

通常，你能非常容易的通过命令行或者图形界面获取你正在使用的 Ubuntu 的版本。当你正在尝试学习一篇互联网上的入门教材或者正在从各种各样的论坛里获取帮助的时候，知道当前正在使用的 Ubuntu 确切的版本号、桌面环境以及其他的系统信息将是尤为重要的。

在这篇简短的文章中，作者将展示各种检查 [Ubuntu][1] 版本以及其他常用的系统信息的方法。

### 如何在命令行检查 Ubuntu 版本

这个是获得 Ubuntu 版本的最好的办法。我本想先展示如何用图形界面做到这一点，但是我决定还是先从命令行方法说起，因为这种方法不依赖于你使用的任何[桌面环境][2]。 你可以在 Ubuntu 的任何变种系统上使用这种方法。

打开你的命令行终端 (`Ctrl+Alt+T`)， 键入下面的命令：

```
lsb_release -a
```

上面命令的输出应该如下：

```
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.4 LTS
Release:    16.04
Codename:   xenial
```

![How to check Ubuntu version in command line][3]

正像你所看到的，当前我的系统安装的 Ubuntu 版本是 Ubuntu 16.04， 版本代号： Xenial。

且慢！为什么版本描述中显示的是 Ubuntu 16.04.4 而发行版本是 16.04？到底哪个才是正确的版本？16.04 还是 16.04.4? 这两者之间有什么区别？

如果言简意赅的回答这个问题的话，那么答案应该是你正在使用 Ubuntu 16.04。这个是基准版本，而 16.04.4 进一步指明这是 16.04 的第四个补丁版本。你可以将补丁版本理解为 Windows 世界里的服务包。在这里，16.04 和 16.04.4 都是正确的版本号。

那么输出的 Xenial 又是什么？那正是 Ubuntu 16.04 的版本代号。你可以阅读下面这篇文章获取更多信息：[了解 Ubuntu 的命名惯例][4]。

#### 其他一些获取 Ubuntu 版本的方法

你也可以使用下面任意的命令得到 Ubuntu 的版本：

```
cat /etc/lsb-release
```

输出如下信息：

```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.4 LTS"
```

![How to check Ubuntu version in command line][5]


你还可以使用下面的命令来获得 Ubuntu 版本：

```
cat /etc/issue
```


命令行的输出将会如下：

```
Ubuntu 16.04.4 LTS \n \l
```

不要介意输出末尾的\n \l. 这里 Ubuntu 版本就是 16.04.4，或者更加简单：16.04。


### 如何在图形界面下得到 Ubuntu 版本

在图形界面下获取 Ubuntu 版本更是小事一桩。这里我使用了 Ubuntu 18.04 的图形界面系统 GNOME 的屏幕截图来展示如何做到这一点。如果你在使用 Unity 或者别的桌面环境的话，显示可能会有所不同。这也是为什么我推荐使用命令行方式来获得版本的原因：你不用依赖形形色色的图形界面。

下面我来展示如何在桌面环境获取 Ubuntu 版本。

进入‘系统设置’并点击下面的‘详细信息’栏。

![Finding Ubuntu version graphically][6]

你将会看到系统的 Ubuntu 版本和其他和桌面系统有关的系统信息 这里的截图来自 [GNOME][7] 。

![Finding Ubuntu version graphically][8]

### 如何知道桌面环境以及其他的系统信息

你刚才学习的是如何得到 Ubuntu 的版本信息，那么如何知道桌面环境呢？ 更进一步， 如果你还想知道当前使用的 Linux 内核版本呢？

有各种各样的命令你可以用来得到这些信息，不过今天我想推荐一个命令行工具， 叫做 [Neofetch][9]。 这个工具能在命令行完美展示系统信息，包括 Ubuntu 或者其他 Linux 发行版的系统图标。

用下面的命令安装 Neofetch：

```
sudo apt install neofetch
```

安装成功后，运行 `neofetch` 将会优雅的展示系统的信息如下。

![System information in Linux terminal][10]

如你所见，`neofetch` 完全展示了 Linux 内核版本、Ubuntu 的版本、桌面系统版本以及环境、主题和图标等等信息。


希望我如上展示方法能帮到你更快的找到你正在使用的 Ubuntu 版本和其他系统信息。如果你对这篇文章有其他的建议，欢迎在评论栏里留言。

再见。：）

--------------------------------------------------------------------------------

via: https://itsfoss.com/how-to-know-ubuntu-unity-version/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[DavidChenLiang](https://github.com/davidchenliang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://www.ubuntu.com/
[2]:https://en.wikipedia.org/wiki/Desktop_environment
[3]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/check-ubuntu-version-command-line-1-800x216.jpeg
[4]:https://itsfoss.com/linux-code-names/
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/check-ubuntu-version-command-line-2-800x185.jpeg
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/ubuntu-version-system-settings.jpeg
[7]:https://www.gnome.org/
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/checking-ubuntu-version-gui.jpeg
[9]:https://itsfoss.com/display-linux-logo-in-ascii/
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2013/03/ubuntu-system-information-terminal-800x400.jpeg
