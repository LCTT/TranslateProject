[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12958-1.html)
[#]: subject: (How to Install RPM Files on Fedora Linux [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/install-rpm-files-fedora/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Fedora Linux 上安装 RPM 文件
======

![](https://img.linux.net.cn/data/attachment/album/202012/26/182851bxi1lstdz13siuif.jpg)

> 这篇初学者文章介绍如何在 Fedora 和 Red Hat Linux 上安装 RPM 软件包。它也随后向你展示如何移除这些 RPM 软件包。

当你开始使用 Red Hat 系的 Fedora Linux 时，你早晚会偶然发现 .rpm 文件。就像在 Windows 中的 .exe 文件，以及在 Ubuntu 和 Debian 中的 .deb 文件一样，一个 rpm 文件能够使你在 [Fedora][1] 上快速安装一个软件。

你可以从软件中心中找到并安装大量的软件，特别是 [如果你在 Fedora 中启用附加的存储库的话][2]。但是有时你会在它们的网站上找到可用的 RPM 格式的软件包。

就像在 Windows 中的 .exe 文件一样，你可以通过 **下载 .rpm 文件并双击它来安装**。不用担心，我将向你展示详细的步骤。

### 在 Fedora 和 Red Hat Linux 上安装 RPM 文件

我将向你展示安装 RPM 文件的三个方法：

  * [使用软件中心安装 RPM 文件][3]（GUI 方法）
  * [使用 DNF 命令安装 RPM 文件][4]（CLI 方法）
  * [使用 Yum 命令安装 RPM 文件][5]（Red Hat 的 CLI 方法）

#### 方法 1: 使用软件中心

在 Fedora 中使用默认的软件中心是最简单的方法。它真地很简单。转到你下载的 .rpm 文件的文件夹位置。它通常在 “Downloads” 文件夹。

只需要 **双击 RPM 文件，它将会在软件中心中打开**。

或者，你可以在 RPM 文件上右键单击并选择通过软件中心来安装它。

![或者双击或者右键并选择软件安装][6]

当它在软件中心打开时，你应该会看到“安装”选项。只需要点击“安装”按钮并在提示时输入你的账号密码。

![通过 Fedora 软件中心安装 RPM][7]

它很简单，对吗？

#### 方法 2: 使用 DNF 命令来安装 RPM 文件

这是命令行方法。Fedora 使用新的 `dnf` [软件包管理器][8] ，你也可以使用它来安装下载的 RPM 文件。

打开一个终端并切换到你下载 RPM 文件的目录下。你也可以通过到 RPM 文件的路径。像这样使用 `dnf` 命令：

```
sudo dnf install rpm_file_name
```

这是一个我 [在 Fedora 上使用 dnf 命令安装 Google Chrome][9] 屏幕截图：

![使用 DNF 命令安装 RPM 文件][10]

#### 方法 3: 在 Red Hat 中使用 Yum 命令安装 RPM 文件

不像 Fedora ，Red Hat 仍然使用很好的旧式的 Yum 软件包管理器。在这里你还不能找到 `dnf` 命令。

这个过程与 `dnf` 命令相同。转到 RPM 文件所在的目录或提供它的路径。

```
sudo yum install path_to_RPM_file
```

就是这样。没有一点异常花哨的东西。

### 如何移除 RPM 软件包

移除一个 RPM 软件包也不是一个什么大的问题。并且，你不需要原始的用来安装程序的 rpm 文件。

你可以在软件中心中找到已安装的软件包，并从其中移除应用程序。

![移除 RPM 软件包][11]

或者，你可以使用带有 `remove` 选项的 `dnf` 或 `yum` 命令。

使用 `dnf` ，使用这个命令：

```
sudo dnf remove rpm_package_name
```

使用 `yum` ，使用这个命令：

```
sudo yum remove rpm_package_name
```

你可能不记得准确的软件包名称，没有关系。你可以做的是输入软件包的前几个字母，然后敲击 `tab` 按键。这是假设你已经启用 `tab` 按键补全，通常是这样的。

这就是你需要做的全部。相当简单，对吧？作为一个初学者，你可能会为这样一个简单的任务而挣扎，我希望像这样的快速教程会让你对 Fedora 更自信一些。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-rpm-files-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://getfedora.org/
[2]: https://itsfoss.com/fedora-third-party-repos/
[3]: tmp.TvkJtlRJ6T#gui-method
[4]: tmp.TvkJtlRJ6T#use-dnf
[5]: tmp.TvkJtlRJ6T#use-yum
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/installing-rpm-file-fedora.png?resize=800%2C449&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/install-rpm-fedora-software-center.jpg?resize=799%2C193&ssl=1
[8]: https://itsfoss.com/package-manager/
[9]: https://itsfoss.com/install-google-chrome-fedora/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/install-rpm-using-dnf-install.jpg?resize=800%2C474&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/remove-rpm-package-fedora.jpg?resize=790%2C190&ssl=1
