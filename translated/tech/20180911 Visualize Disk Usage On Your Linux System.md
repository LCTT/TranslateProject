Filelight：可视化查看 Linux 系统上的磁盘使用情况
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/filelight-720x340.png)

查看硬盘使用情况对于类 Unix 操作系统来说不是什么大问题。我们有一个名为 [du][1] 的内置命令，可以在几分钟之内计算和汇总磁盘空间的使用情况。此外，我们还有一些第三方工具，比如 [Ncdu][2] 和 [Agedu][3]，它们也可以用来追踪磁盘使用情况。如您所见，这些都是命令行中的实用程序，磁盘使用情况将以纯文本的形式显示。但是，有些人希望以可视化、图表的形式查看结果。别担心！我知道一个 GUI 工具可以显示磁盘使用细节。它就是 “**Filelight**”，这是一个图形化实用程序，用于可视化显示 Linux 系统上的磁盘使用情况，并以彩色径向图显示结果。Filelight 是历史最悠久的项目之一，它已经存在了很长时间，它完全免费使用并开源。

### 安装 Filelight

Filelight 是 KDE 应用程序的一部分，并预装在基于 KDE 的 Linux 发行版上。

如果您使用的是非 KDE 发行版，官方存储库中包含了 Filelight，因此您可以使用默认的包管理器进行安装。

在 Arch Linux 及其衍生版，如 Antergos、Manjaro Linux 中，Filelight 可以按照如下方法安装。

```
$ sudo pacman -S filelight
```

在 Debian、Ubuntu、Linux Mint 中，

```
$ sudo apt install filelight
```

在 Fedora 中，

```
$ sudo dnf install filelight
```

在 openSUSE 中，

```
$ sudo zypper install filelight
```

### 可视化查看 Linux 系统上的磁盘使用情况

安装后，从菜单或应用程序启动器启动 Filelight。

Filelight 以图形方式将您的文件系统表示为一组同心圆环段。

![](https://www.ostechnix.com/wp-content/uploads/2018/09/filelight-1-1.png)

如您所见，Filelight 默认显示磁盘中 `/` 和 `/boot` 文件系统的使用情况。

您还可以选择扫描的各个文件夹，以查看该特定文件夹的磁盘使用情况。为此，请到 “Filelight -> Scan -> Scan Folder” 并选择要扫描的文件夹。

Filelight 在扫描时排除以下目录：

  * `/dev`
  * `/proc`
  * `/sys`
  * `/root`

此选项有助于跳过您可能没有权限读取的目录，或者属于虚拟文件系统的文件夹，例如 `/proc`。

如果您想要在此列表中增加文件夹，请到 “Filelight -> Settings -> Scanning” 并点击 “Add” 按钮然后选择您想要增加的文件夹。

![](http://www.ostechnix.com/wp-content/uploads/2018/09/filelight-settings.png)

类似的，要想从此列表中移除某个文件夹，选择文件夹并点击 “Remove”。

如果您想要改变 Filelight 的外观，请到 “Settings - > Appearance” 栏，按照您的喜好改变配色方案。

径向图中的每个段用不同的颜色表示。下图显示了 `/` 文件系统的整个径向布局。要查看文件和文件夹的完整信息，只需将鼠标指针悬停在它们上边。

![](https://www.ostechnix.com/wp-content/uploads/2018/09/filelight-2.png)

只需点击相应的段即可浏览文件系统。要查看某个文件或文件夹的磁盘使用情况，只需单击它们即可获得该特定文件夹、文件的完整磁盘使用情况。

不仅仅是本地文件系统，Filelight 还能够扫描远程磁盘和可移动磁盘。 如果您使用任何基于 KDE 的 Linux 发行版，它可以集成到 Konqueror、Dolphin 和 Krusader 等文件管理器中。

与 CLI 实用程序不同，您不必使用任何额外的参数或选项来以易读的（而非乱码的）格式查看结果。 默认情况下，Filelight 将自动以易读的格式显示磁盘使用情况。

### 总结

使用 Filelight，您可以快速找到文件系统中占用磁盘空间的位置，并通过删除不需要的文件或文件夹释放空间。 如果您正在寻找一些简单且易上手的图形界面磁盘使用情况查看器，那么 Filelight 值得一试。

就是这样。希望这篇文章对您有用。更多的好文章，敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/filelight-visualize-disk-usage-on-your-linux-system/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[XiatianSummer](https://github.com/XiatianSummer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/find-size-directory-linux/
[2]: https://www.ostechnix.com/check-disk-space-usage-linux-using-ncdu/
[3]: https://www.ostechnix.com/agedu-find-out-wasted-disk-space-in-linux/
