[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12170-1.html)
[#]: subject: (Difference Between YUM and RPM Package Manager)
[#]: via: (https://www.2daygeek.com/comparison-difference-between-yum-vs-rpm/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

YUM 和 RPM 包管理器的不同之处
======

![](https://img.linux.net.cn/data/attachment/album/202004/30/215525o4e88nen85d8dzd7.jpg)

软件包管理器在 Linux 系统中扮演着重要的角色。它允许你安装、更新、查看、搜索和删除软件包，以满足你的需求。

每个发行版都有自己的一套包管理器，依据你的 Linux 发行版来分别使用它们。

RPM 是最古老的传统软件包管理器之一，它是为基于 Red Hat 的系统设计的，如 Red Hat Enterprise Linux（RHEL）、CentOS、Fedora 和 openSUSE（它基于 suse Enterprise Linux）等系统。但在依赖解析和包更新（全系统更新/升级）方面，RPM 包管理器有一个突出的限制。

> 如果你想知道 [YUM 和 DNF 包管理器的区别][1]请参考该文章。

这意味着 `yum` 可以自动下载并安装所有需要的依赖项，但 `rpm` 会告诉你安装一个依赖项列表，然后你必须手动安装。

当你想用 [rpm 命令][2] 安装一组包时，这实际上是不可能的，而且很费时间。

这时，[YUM 包管理器][3] 就派上了用场，解决了这两个问题。

### 什么是 RPM？

RPM 指的是 RPM Package Manager（原名 Red Hat Package Manager），是一个功能强大的命令行包管理工具，是为 Red Hat 操作系统开发的。

它现在被用作许多 Linux 发行版的核心组件，如 Centos、Fedora、Oracle Linux、openSUSE 和 Mageia 等。

RPM 软件包管理器允许你在基于 RPM 的 Linux 系统上安装、升级、删除、查询和验证软件包。

RPM 文件的扩展名为 `.rpm`。RPM 包由一个存档文件组成，其中包含了一个特定包的库和依赖关系，这些库和依赖关系与系统上安装的其他包不冲突。

在 Linux 上有很多前端工具可以用来安装 RPM 包，与 RPM 工具相比，这些工具可以使安装过程更加高效，尤其是在处理依赖关系方面。

如果你想了解更多关于 Linux 发行版的前端包管理器的信息，请到下面的链接。

* [Linux 命令行包管理器列表][4]

如果你想了解 Linux 的 GUI 包管理器，请到下面的链接。

* [Linux GUI 包管理器列表][5]

### 什么是 YUM？

Yum 是一个 Linux 操作系统上的自由开源的命令行包管理程序，它使用 RPM 包管理器。Yum 是一个 RPM 的前端工具，可以自动解决软件包的依赖关系。它可以从发行版官方仓库和其他第三方仓库中安装 RPM 软件包。

Yum 允许你在系统中安装、更新、搜索和删除软件包。如果你想让你的系统保持更新，你可以通过 yum-cron 启用自动更新。

此外，如果你需要的话，它还允许你在 `yum update` 中排除一个或多个软件包。

Yum 是默认安装的，你不需要安装它。

编号 | RPM | YUM
--- | --- | ---
1 | 红帽在 1997 年引入了 RPM | Yellowdog UPdater（YUP）开发于 1999-2001 年，YUM 于 2003 年取代了原来的 YUP 工具
2 | RPM 代表 RPM Package manager（原名 Red Hat package manager） | YUM 代表 Yellowdog Updater Modified
3 | RPM 文件的命名规则如下，`httpd-2.4.6-92.el7.x86_64.rpm`：`httpd` - 实际的包名；`2.4.6` - 包发布版本号；`92` - 包发布子版本号；`el7` - Red Hat 版本；`x86_64` - 硬件架构；`rpm` - 文件扩展名 | 后台使用 rpm 数据库
4 | 不解析依赖关系，你必须手动安装依赖 | 可以自动解析依赖关系并同时安装它们（任何包都会和它的依赖关系一起安装）
5 | 允许你同时安装多个版本的软件包 | 不允许，并显示该软件包已经安装
6 | 当使用 RPM 命令安装一个软件包时，你必须提供 `.rpm` 软件包的确切位置 | 你可以安装仓库中的任何软件包，而你只需要知道软件包的名称就可以了
7 | RPM 不依赖于 YUM | 它是一个前端工具，在后台使用 RPM 包管理器来管理包
8 | RPM 在安装包的管理方面比较难 | YUM 是最简单的管理 RPM 包的方法
9 | RPM 不能让你将整个系统升级到最新的版本 | YUM 可以让你将系统升级到最新的版本（例如 7.0 到 7.x 的小版本升级）
10 | RPM 不能让你自动更新/升级安装在系统上的软件包 | YUM 可以让你自动更新/升级系统上的更新
11 | 不使用在线仓库来执行任何操作 | 完全依赖在线仓库来完成所有的工作
12 | RPM 是一种包格式，它也是一个底层的包管理器，只做基本的事情 | 这是一个上层的包管理器前端，它可以完成你所需要的一切工作

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/comparison-difference-between-yum-vs-rpm/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-12161-1.html
[2]: https://www.2daygeek.com/linux-rpm-command-examples-manage-packages-fedora-centos-rhel-systems/
[3]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[4]: https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[5]: https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
