[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12230-1.html)
[#]: subject: (4 cool new projects to try in COPR for May 2020)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-april-2020/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

COPR 仓库中 4 个很酷的新项目（2020.05）
======

![][1]

COPR 是个人软件仓库[集合][2]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准；或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

本文介绍了 COPR 中一些有趣的新项目。如果你第一次使用 COPR，请参阅 [COPR 用户文档][3]。

### Ytop

[ytop][4] 是类似于 `htop` 的命令行系统监视器。它们之间的主要区别是，`ytop` 在显示进程及其 CPU 和内存使用率的顶部显示了系统的 CPU、内存和网络使用率随时间变化的图表。此外，`ytop` 还显示磁盘使用情况和计算机温度。最后，`ytop` 支持多种配色方案以及创建新配色的选项。

![][5]

#### 安装说明

[该仓库][6]当前为 Fedora 30、31、32 和 Rawhide 以及 EPEL 7 提供了 `ytop`。要安装 `ytop`，请[带上 sudo][7] 使用以下命令：

```
sudo dnf copr enable atim/ytop
sudo dnf install ytop
```

### Ctop

[ctop][8] 是另一个命令行系统监视器。但是，与 `htop` 和 `ytop` 不同，`ctop` 专注于显示容器的资源使用情况。`ctop` 同时显示计算机上运行的所有容器的 CPU、内存、网络和磁盘使用情况的概要，以及单个容器的更全面的信息，包括一段时间内资源使用情况的图表。当前，`ctop` 支持 Docker 和 runc 容器。

![][9]

#### 安装说明

[该仓库][10]当前为 Fedora 31、32 和 Rawhide 以及 EPEL 7 还有其他发行版提供了安装包。要安装 `ctop`，请使用以下命令：

```
sudo dnf copr enable fuhrmann/ctop
sudo dnf install ctop
```

### Shortwave

[shortwave][11] 是用于收听广播电台的程序。`shortwave` 使用广播电台的社区数据库 [www.radio-browser.info][12]。在此数据库中，你可以发现或搜索广播电台，将它们添加到库中，然后收听。此外，`shortwave` 还提供有关当前播放歌曲的信息，并且还可以记录这些歌曲。

![][13]

#### 安装说明

[该仓库][14] 当前为 Fedora 31、32 和 Rawhide 提供了 shortwave。要安装 `shortwave`，请使用以下命令：

```
sudo dnf copr enable atim/shortwave
sudo dnf install shortwave
```

### Setzer

[setzer][15] 是 LaTeX 编辑器，它可以构建 pdf 文档并查看它们。它提供了各种类型文档（例如文章或幻灯片）的模板。此外，`setzer` 还有许多特殊符号、数学符号和希腊字母的按钮。

![][16]

#### 安装说明

[该仓库][17] 当前为 Fedora 30、31、32 和 Rawhide 提供了 `setzer`。要安装 `setzer`，请使用以下命令：

```
sudo dnf copr enable lyessaadi/setzer
sudo dnf install setzer
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-april-2020/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html#
[4]: https://github.com/cjbassi/ytop
[5]: https://fedoramagazine.org/wp-content/uploads/2020/04/ytop.png
[6]: https://copr.fedorainfracloud.org/coprs/atim/ytop/
[7]: https://fedoramagazine.org/howto-use-sudo/
[8]: https://github.com/bcicen/ctop
[9]: https://fedoramagazine.org/wp-content/uploads/2020/04/ctop.png
[10]: https://copr.fedorainfracloud.org/coprs/fuhrmann/ctop/
[11]: https://github.com/ranfdev/shortwave
[12]: http://www.radio-browser.info/gui/#!/
[13]: https://fedoramagazine.org/wp-content/uploads/2020/04/shortwave.png
[14]: https://copr.fedorainfracloud.org/coprs/atim/shortwave/
[15]: https://www.cvfosammmm.org/setzer/
[16]: https://fedoramagazine.org/wp-content/uploads/2020/04/setzer.png
[17]: https://copr.fedorainfracloud.org/coprs/lyessaadi/setzer/
