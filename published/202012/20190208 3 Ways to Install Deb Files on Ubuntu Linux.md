[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12956-1.html)
[#]: subject: (3 Ways to Install Deb Files on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-deb-files-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Ubuntu Linux 上安装 Deb 文件的 3 种方法
======

> 这篇初学者文章解释了如何在 Ubuntu 中安装 deb 软件包。它稍后也向你展示如何移除这些 deb 软件包。

这是 Ubuntu 初学者系列的另一篇文章。如果你对 Ubuntu 很陌生，你可能会想知道 [如何安装应用程序][1]。

最简单的方法是使用 Ubuntu 软件中心。在软件中心中搜索应用程序的名称并安装它。如果你能在软件中心中找到所有的应用程序，那么生活就太惬意了。但是，不幸的是，这是不可能的发生的。

一些软件包可以通过 DEB 软件包的形式获得。它们是以 .deb 扩展名为结尾的存档文件。你可以把 .deb 文件看作为 Windows 中的 .exe 文件。在 Windows 中，你双击 .exe 文件，它将开始安装过程。DEB 软件包也是非常类似的。

你可以从软件提供商网站的下载区域找到这些 DEB 软件包。例如，如果你想 [在 Ubuntu 上安装 Google Chrome][2] ，你可以从它的网站下载 Chrome 的 DEB 软件包。

现在问题产生了，你将如何安装 deb 文件呢？在 Ubuntu 中有多种安装 DEB 软件包的方法。在这篇教程中，我将向你依次地展示它们。

![在 Ubuntu 中安装 deb 文件][3]

### 在 Ubuntu 和基于 Debian 的 Linux 发行版中安装 .deb 文件

你可以选择一个 GUI 工具或一个命令行工具来安装一个 deb 软件包。你拥有选择权。

让我们继续看看如何安装 deb 文件。

#### 方法 1: 使用默认的软件中心

在 Ubuntu 中，最简单的方法是使用默认的软件中心。在这里你不必要做任何特别的事。只需要转到你所下载的 .deb 文件的文件夹下（它应该是 Downloads 文件夹），并在这个文件上双击。

![在 Ubuntu 上的 Google Chrome 的 deb 文件][4]

在已下载的 .deb 文件上双击以开始安装。

它将打开软件中心，并且你将看到安装软件时的选项。你所需要做的全部工作就是：点击安装按钮并输入你的登录密码。

![在 Ubuntu 软件中心中安装 Google Chrome][5]

.deb 文件的安装将通过软件中心来执行。

看，它甚至比在 Windows 中安装一个 .exe 文件更简单，不是吗？

#### 方法 2: 使用 Gdebi 应用程序来安装 deb 软件包及其依赖项

再提一次，如果事情总是进展顺利，生活可能会更简单一些。但是生活并不是我们熟知的那样。

现在，你已经知道 .deb 文件可以简单地通过软件中心来安装，接下来，让我告诉你一些软件包可能会遇到的依赖项的错误。

发生错误的原因是，一个程序可能依赖于另外一个软件包（库）。当开发者为你准备 DEB 软件包时，他/她可能会假设你的系统中已经有了所依赖的软件包（库）。

但是如果情况并不是这样的，你的系统没有这些所需要的软件包（库），你将遇到臭名昭著的“依赖项错误”。

软件中心不能处理这样的错误，因此你不得不使用另外一个名称为 [gdebi][6] 的工具。

gdebi 是一个轻量级的 GUI 应用程序，它只有安装 deb 软件包的一个用途。

它将识别依赖项，并尝试在安装 .deb 文件的同时安装这些依赖项。

![gdebi 在安装 deb 软件包时处理依赖项][7]

就我个人而言，我更喜欢使用 gdebi 而不是使用软件包中心来安装 deb 文件。它是一个轻量级应用程序，因此安装过程看起来更快一点。更多的信息，你可以阅读[使用 gDebi ，并使其成为安装 DEB 软件包的默认设置][6]。

你可以从软件中心或使用下面的命令来安装 gdebi ：

```
sudo apt install gdebi
```

#### 方法 3: 在命令行中使用 dpkg 安装 .deb 文件

如果你想在命令行中安装 deb 软件包，你可以使用 `apt` 命令或者 `dpkg` 命令。实际上，`apt` 命令在底层上使用 [dpkg][9] 命令，但是 `apt` 却更流行和易于使用。

如果你想对 deb 文件使用 `apt` 命令，像这样使用它：

```
sudo apt install path_to_deb_file
```

如果你想对将要安装的 deb 软件包使用 `dpkg` 命令，在这里是如何完成它：

```
sudo dpkg -i path_to_deb_file
```

在这两个命令中，你应该使用你已下载的 deb 文件的路径和名称来替换 `path_to_deb_file` 。

![在 Ubuntu 中使用 dpkg 命令安装 deb 文件][10]

如果你在安装 deb 软件包的过程中得到一个依赖项的错误，你可以使用下面的命令来修复依赖项的问题：

```
sudo apt install -f
```

### 如何移除 deb 软件包

移除一个 deb 软件包也不是一件什么大事。并且，你不需要用于安装程序的原始的 deb 文件。

#### 方法 1: 使用 apt 命令移除 deb 软件包

你所需要的全部东西就是你所已安装程序的名称，接下来你可以使用 `apt` 或 `dpkg` 来移除这个程序。

```
sudo apt remove program_name
```

现在，问题来了，在移除命令中，你如何找到你所需要使用的准确的程序名称？为此，`apt` 命令也有一个解决方案。

你可以使用 `apt` 命令找到所有已安装文件的列表，但是手动完成这一过程将会是一件令人头疼的事。因此，你可以使用 `grep` 命令来搜索你的软件包。

例如，在先前的部分中，我已安装 AppGrid 应用程序，但是如果我想知道准确的程序名称，我可以像这样使用一些东西：

```
sudo apt list --installed | grep grid
```

这将给予我全部的名称中含有 “grid” 的软件包，从这里，我可以得到准确的程序名称。

```
apt list --installed | grep grid
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
appgrid/now 0.298 all [installed,local]
```

正如你所看到的，一个名称为 “appgrid” 的软件包已经安装。现在，你可以在 `apt remove` 命令中使用这个程序名称。

#### 方法2: 使用 dpkg 命令移除 deb 软件包

你可以使用 `dpkg` 来找到已安装程序的名称：

```
dpkg -l | grep grid
```

该输出将给予所有的名称中有 “grid” 的软件包。

```
dpkg -l | grep grid

ii appgrid 0.298 all Discover and install apps for Ubuntu
```

在上面的命令输出中的 `ii` 意味着软件包已经被正确地安装。

现在，你有了程序名称，你可以使用 `dpkg` 命令来移除它：

```
dpkg -r program_name
```

**提示：更新 deb 软件包**

一些 deb 软件包 （像 Chrome）通过系统更新来提供其更新，但是对于大多数的其它的程序，你将不得不先移除已存在的程序，并在接下来安装更新的版本。

我希望这篇初学者指南能够帮助你在 Ubuntu 上安装 deb 软件包。我添加了移除部分，以便你可以更好地控制你所安装的程序。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-deb-files-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/remove-install-software-ubuntu/
[2]: https://itsfoss.com/install-chrome-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/deb-packages-ubuntu.png?resize=800%2C450&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/install-google-chrome-ubuntu-4.jpeg?resize=800%2C347&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/install-google-chrome-ubuntu-5.jpeg?resize=800%2C516&ssl=1
[6]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/gdebi-handling-dependency.jpg?ssl=1
[8]: http://xmodulo.com
[9]: https://help.ubuntu.com/lts/serverguide/dpkg.html.en
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/install-deb-file-with-dpkg.png?ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/deb-packages-ubuntu.png?fit=800%2C450&ssl=1
