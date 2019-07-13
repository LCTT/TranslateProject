2018 年 7 月 COPR 中 4 个值得尝试很酷的新项目
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR 是个人软件仓库[集合][1]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准。或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不被 Fedora 基础设施不支持或没有被该项目所签名。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

这是 COPR 中一组新的有趣项目。

### Hledger

[Hledger][2] 是用于跟踪货币或其他商品的命令行程序。它使用简单的纯文本格式日志来存储数据和复式记帐。除了命令行界面，hledger 还提供终端界面和 Web 客户端，可以显示帐户余额图。

![][3]

#### 安装说明

该仓库目前为 Fedora 27、28 和 Rawhide 提供了 hledger。要安装 hledger，请使用以下命令：

```
sudo dnf copr enable kefah/HLedger
sudo dnf install hledger
```

### Neofetch

[Neofetch][4] 是一个命令行工具，可显示有关操作系统、软件和硬件的信息。其主要目的是以紧凑的方式显示数据来截图。你可以使用命令行标志和配置文件将 Neofetch 配置为完全按照你希望的方式显示。

![][5]

#### 安装说明

仓库目前为 Fedora 28 提供 Neofetch。要安装 Neofetch，请使用以下命令：

```
sudo dnf copr enable sysek/neofetch
sudo dnf install neofetch

```

### Remarkable

[Remarkable][6]是 Markdown 文本编辑器，它使用类似 GitHub 的 Markdown 风格。它提供了文档的预览，以及导出为 PDF 和 HTML 的选项。Markdown 有几种可用的样式，包括使用 CSS 创建自己的样式的选项。此外，Remarkable 支持用于编写方程的 LaTeX 语法和源代码的语法高亮。

![][7]

#### 安装说明

该仓库目前为 Fedora 28 和 Rawhide 提供 Remarkable。要安装 Remarkable，请使用以下命令：

```
sudo dnf copr enable neteler/remarkable
sudo dnf install remarkable
```

### Aha

[Aha][8]（即 ANSI HTML Adapter）是一个命令行工具，可将终端转义成 HTML 代码。这允许你将 git diff 或 htop 的输出共享为静态 HTML 页面。

![][9]

#### 安装说明

[仓库][10] 目前为 Fedora 26、27、28 和 Rawhide、EPEL 6 和 7 以及其他发行版提供 aha。要安装 aha，请使用以下命令：

```
sudo dnf copr enable scx/aha
sudo dnf install aha
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-try-copr-july-2018/

作者：[Dominik Turecek][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://copr.fedorainfracloud.org/
[2]:http://hledger.org/
[3]:https://fedoramagazine.org/wp-content/uploads/2018/07/hledger.png
[4]:https://github.com/dylanaraps/neofetch
[5]:https://fedoramagazine.org/wp-content/uploads/2018/07/neofetch.png
[6]:https://remarkableapp.github.io/linux.html
[7]:https://fedoramagazine.org/wp-content/uploads/2018/07/remarkable.png
[8]:https://github.com/theZiz/aha
[9]:https://fedoramagazine.org/wp-content/uploads/2018/07/aha.png
[10]:https://copr.fedorainfracloud.org/coprs/scx/aha/
