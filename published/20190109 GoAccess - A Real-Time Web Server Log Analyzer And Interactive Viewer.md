[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10969-1.html)
[#]: subject: (GoAccess – A Real-Time Web Server Log Analyzer And Interactive Viewer)
[#]: via: (https://www.2daygeek.com/goaccess-a-real-time-web-server-log-analyzer-and-interactive-viewer/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

GoAccess：一个实时的 Web 日志分析器及交互式查看器
======

![](https://img.linux.net.cn/data/attachment/album/201906/12/222616h80pl0k0tt811071.jpg)

分析日志文件对于 Linux 管理员来说是一件非常令人头疼的事情，因为它记录了很多东西。大多数新手和初级管理员都不知道如何分析。如果你在分析日志方面拥有很多知识，那么你就成了 *NIX 系统高手。

Linux 中有许多工具可以轻松分析日志。GoAccess 是允许用户轻松分析 Web 服务器日志的工具之一。我们将在本文中详细讨论 GoAccess 工具。

### GoAccess

GoAccess 是一个实时 Web 日志分析器和交互式查看器，可以在 *nix 系统中的终端运行或通过浏览器访问。

GoAccess 需要的依赖极少，它是用 C 语言编写的，只需要 ncurses。

它支持 Apache、Nginx 和 Lighttpd 日志。它为需要动态可视化服务器报告的系统管理员即时提供了快速且有价值的 HTTP 统计信息。

GoAccess 可以解析指定的 Web 日志文件并将数据输出到 X 终端和浏览器。

GoAccess 被设计成一个基于终端的快速日志分析器。其核心思想是实时快速分析和查看 Web 服务器统计信息，而无需使用浏览器。

默认输出是在终端输出，它也能够生成完整的、自包含的实时 HTML 报告，以及 JSON 和 CSV 报告。

GoAccess 支持任何自定义日志格式，并包含以下预定义日志格式选项：Apache/Nginx 中的组合日志格式 XLF/ELF，Apache 中的通用日志格式 CLF，但不限于此。

### GoAccess 功能

* 完全实时：所有指标在终端上每 200 毫秒更新一次，在 HTML 输出上每秒更新一次。
* 跟踪应用程序响应时间：跟踪服务请求所需的时间。如果你想跟踪减慢了网站速度的网页，则非常有用。
* 访问者：按小时或日期确定最慢运行的请求的点击量、访问者数、带宽数和指标。
* 按虚拟主机的度量标准：如果有多个虚拟主机（`Server`），它提供了一个面板，可显示哪些虚拟主机正在消耗大部分 Web 服务器资源。

### 如何安装 GoAccess？

我建议用户在包管理器的帮助下从发行版官方的存储库安装 GoAccess。它在大多数发行版官方存储库中都可用。

我们知道，我们在标准发行方式的发行版中得到的是过时的软件包，而滚动发行方式的发行版总是包含最新的软件包。

如果你使用标准发行方式的发行版运行操作系统，我建议你检查替代选项，如 PPA 或 GoAccess 官方维护者存储库等，以获取最新的软件包。

对于 Debian / Ubuntu 系统，使用 [APT-GET 命令][1]或 [APT 命令][2]在你的系统上安装 GoAccess。

```
# apt install goaccess
```

要获取最新的 GoAccess 包，请使用以下 GoAccess 官方存储库。

```
$ echo "deb https://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list
$ wget -O - https://deb.goaccess.io/gnugpg.key | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install goaccess
```

对于 RHEL / CentOS 系统，使用 [YUM 包管理器][3]在你的系统上安装 GoAccess。

```
# yum install goaccess
```

对于 Fedora 系统，使用 [DNF 包管理器][4]在你的系统上安装 GoAccess。

```
# dnf install goaccess
```

对于基于 ArchLinux / Manjaro 的系统，使用 [Pacman 包管理器][5]在你的系统上安装 GoAccess。

```
# pacman -S goaccess
```

对于 openSUSE Leap 系统，使用[Zypper 包管理器][6]在你的系统上安装 GoAccess。

```
# zypper install goaccess
# zypper ar -f obs://server:http
# zypper ref && zypper in goaccess
```

### 如何使用 GoAccess？

成功安装 GoAccess 后。只需输入 `goaccess` 命令，然后输入 Web 服务器日志位置即可查看。

```
# goaccess [options] /path/to/Web Server/access.log
# goaccess /var/log/apache/2daygeek_access.log
```

执行上述命令时，它会要求您选择日志格式配置。

![][8]

我用 Apache 访问日志对此进行了测试。Apache 日志被分为十五个部分。详情如下。主要部分显示了这十五个部分的摘要。

以下屏幕截图包括四个部分，例如唯一身份访问者、请求的文件、静态请求、未找到的网址。

![][10]

以下屏幕截图包括四个部分，例如访客主机名和 IP、操作系统、浏览器、时间分布。

![][10]

以下屏幕截图包括四个部分，例如来源网址、来源网站，Google 的搜索引擎结果、HTTP状态代码。

![][11]

如果要生成 html 报告，请使用以下命令。最初我在尝试生成 html 报告时遇到错误。

```
# goaccess 2daygeek_access.log -a > report.html

GoAccess - version 1.3 - Nov 23 2018 11:28:19
Config file: No config file used

Fatal error has occurred
Error occurred at: src/parser.c - parse_log - 2764
No time format was found on your conf file.Parsing... [0] [0/s]
```

它说“你的 conf 文件没有找到时间格式”。要解决此问题，请为其添加 “COMBINED” 日志格式选项。

```
# goaccess -f 2daygeek_access.log --log-format=COMBINED -o 2daygeek.html
Parsing...[0,165] [50,165/s]
```

![][12]

GoAccess 也允许你访问和分析实时日志并进行过滤和解析。

```
# tail -f /var/log/apache/2daygeek_access.log | goaccess -
```

更多细节请参考其 man 手册页或帮助。

```
# man goaccess
或
# goaccess --help
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/goaccess-a-real-time-web-server-log-analyzer-and-interactive-viewer/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[4]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[7]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]: https://www.2daygeek.com/wp-content/uploads/2019/01/goaccess-a-real-time-web-server-log-analyzer-and-interactive-viewer-1.png
[9]: https://www.2daygeek.com/wp-content/uploads/2019/01/goaccess-a-real-time-web-server-log-analyzer-and-interactive-viewer-2.png
[10]: https://www.2daygeek.com/wp-content/uploads/2019/01/goaccess-a-real-time-web-server-log-analyzer-and-interactive-viewer-3.png
[11]: https://www.2daygeek.com/wp-content/uploads/2019/01/goaccess-a-real-time-web-server-log-analyzer-and-interactive-viewer-4.png
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/goaccess-a-real-time-web-server-log-analyzer-and-interactive-viewer-5.png
