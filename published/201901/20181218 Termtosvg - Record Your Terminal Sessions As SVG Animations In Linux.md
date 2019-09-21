[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10441-1.html)
[#]: subject: (Termtosvg – Record Your Terminal Sessions As SVG Animations In Linux)
[#]: via: (https://www.2daygeek.com/termtosvg-record-your-terminal-sessions-as-svg-animations-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Termtosvg：将你在 Linux 终端中操作录制成 SVG 动画
======

一般人喜欢使用历史命令功能来查看/再次调用之前在终端中输入的命令。不幸的是，那样做只会显示先前输入的命令，而不是之前输出的内容。

在 Linux 中，有许多可以用来记录终端活动的实用工具。这种工具将会帮助我们记录用户在终端中的活动，并帮助我们识别输出中有用的信息。

在这之前，我们已经介绍了一些这类实用工具了。今天，让我们接着讨论这类工具。

如果你希望尝试其它一些记录你终端活动的工具，我推荐你试试 [script][1] 命令和 [Terminalizer][2] 工具。`script` 是在无头服务器中记录终端活动的最佳方式之一。`script` 是一个记录在终端中输入过的 Unix 命令的实用工具（在某些终端中，它会记录显示在你终端中的所有东西）。它会在当前工作目录下以文本文件方式储存所有终端输出。

不过，如果你在寻找 [GIF 录制器][3] ，你可以尝试 [Gifine][4]、[Kgif][5] 和 [Peek][6]。

### 什么是 Termtosvg

Termtosvg 是一个用 Python 编写的 Unix 终端录制器，它可以将你的命令行会话保存为 SVG 动画。

### Termtosvg 的特点

  * 可以制作嵌入于项目主页的简洁美观的动画。
  * 可以在 SVG 模板中自定义配色、终端 UI 和动画。
  * 兼容 asciinema 录制格式。
  * 要求 Python 版本为 3.5 或更高。
  
### 如何在 Linux 中安装 Termtosvg

它是用 Python 编写的，所以我推荐使用 `pip` 来安装它。

请确保你已经安装了 python-pip 包。如果你还没安装，请输入下面的命令。
对于 Debian 或 Ubuntu 用户，请使用 [apt][7] 或 [apt-get][8] 来安装 `pip`。

```shell
sudo apt install python-pip
```

对于 Archlinux 用户，请使用 [pacman][9] 来安装 `pip`。

```shell
sudo pacman -S python-pip
```

对于 Fedora 用户，请使用 [dnf][10] 来安装 `pip`。

```shell
sudo dnf install python-pip
```

对于 CentOS 或 RHEL 用户，请使用 [yum][11] 来安装 `pip`。

```shell
sudo yum install python-pip
```

对于 openSUSE 用户，请使用 [zypper][12] 来安装 `pip`。

```shell
sudo zypper install python-pip
```

最后，请执行 [pip][13] 来安装 Termtosvg。

```shell
sudo pip3 install termtosvg pyte python-xlib svgwrite
```

### 如何使用 Termtosvg

成功安装 Termtosvg 后，请使用以下命令来开始录制。

```shell
$ termtosvg
Recording started, enter "exit" command or Control-D to end
```

如果只是想测试它是否正常工作，随意输入几行命令即可。

```shell
$ uname -a
Linux daygeek-Y700 4.19.8-2-MANJARO #1 SMP PREEMPT Sat Dec 8 14:45:36 UTC 2018 x86_64 GNU/Linux
$ hostname
daygeek-Y700
$ cat /etc/*-release
Manjaro Linux
DISTRIB_ID=ManjaroLinux
DISTRIB_RELEASE=18.0
DISTRIB_CODENAME=Illyria
DISTRIB_DESCRIPTION="Manjaro Linux"
Manjaro Linux
NAME="Manjaro Linux"
ID=manjaro
ID_LIKE=arch
PRETTY_NAME="Manjaro Linux"
ANSI_COLOR="1;32"
HOME_URL="https://www.manjaro.org/"
SUPPORT_URL="https://www.manjaro.org/"
BUG_REPORT_URL="https://bugs.manjaro.org/"
$ free -g
free: Multiple unit options doesn't make sense.
$ free -m
free: Multiple unit options doesn't make sense.
$ pip3 --version
pip 18.1 from /usr/lib/python3.7/site-packages/pip (python 3.7)
```

完成后，你可以按下 `CTRL+D` 或输入 `exit` 来停止录制。录制完后，输出文件会以一个独一无二的名字被保存在 `/tmp` 文件夹中。

```shell
$ exit
exit
Recording ended, SVG animation is /tmp/termtosvg_5waorper.svg
```

我们可以在任意浏览器中打开 SVG 文件。

```shell
firefox /tmp/termtosvg_5waorper.svg
```

![最终效果][15]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/termtosvg-record-your-terminal-sessions-as-svg-animations-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[zhs852](https://github.com/zhs852)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/script-command-record-save-your-terminal-session-activity-linux/
[2]: https://www.2daygeek.com/terminalizer-a-tool-to-record-your-terminal-and-generate-animated-gif-images/
[3]: https://www.2daygeek.com/category/gif-recorder/
[4]: https://www.2daygeek.com/gifine-create-animated-gif-vedio-recorder-linux-mint-debian-ubuntu/
[5]: https://www.2daygeek.com/kgif-create-animated-gif-file-active-window-screen-recorder-capture-arch-linux-mint-fedora-ubuntu-debian-opensuse-centos/
[6]: https://www.2daygeek.com/peek-create-animated-gif-screen-recorder-capture-arch-linux-mint-fedora-ubuntu/
[7]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[11]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[12]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[13]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[14]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[15]: https://www.2daygeek.com/wp-content/uploads/2018/12/Termtosvg-Record-Your-Terminal-Sessions-As-SVG-Animations-In-Linux-1.gif
