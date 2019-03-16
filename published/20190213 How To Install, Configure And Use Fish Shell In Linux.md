[#]: collector: "lujun9972"
[#]: translator: "zero-MK"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10622-1.html"
[#]: subject: "How To Install, Configure And Use Fish Shell In Linux?"
[#]: via: "https://www.2daygeek.com/linux-fish-shell-friendly-interactive-shell/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"

如何在 Linux 中安装、配置和使用 Fish Shell？
======

每个 Linux 管理员都可能听到过 shell 这个词。你知道什么是 shell 吗? 你知道 shell 在 Linux 中的作用是什么吗？ Linux 中有多少个 shell 可用？

shell 是一个程序，它是提供用户和内核之间交互的接口。

内核是 Linux 操作系统的核心，它管理用户和操作系统之间的所有内容。Shell 可供所有用户在启动终端时使用。终端启动后，用户可以运行任何可用的命令。当 shell 完成命令的执行时，你将在终端窗口上获取输出。

Bash（全称是 Bourne Again Shell）是运行在今天的大多数 Linux 发行版上的默认的 shell，它非常受欢迎，并具有很多功能。但今天我们将讨论 Fish Shell 。

### 什么是 Fish Shell?

[Fish][1] 是友好的交互式 shell ，是一个功能齐全，智能且对用户友好的 Linux 命令行 shell ，它带有一些在大多数 shell 中都不具备的方便功能。

这些功能包括自动补全建议、Sane Scripting、手册页补全、基于 Web 的配置器和 Glorious VGA Color 。你对它感到好奇并想测试它吗？如果是这样，请按照以下安装步骤继续安装。

### 如何在 Linux 中安装 Fish Shell ？

它的安装非常简单，除了少数几个发行版外，它在大多数发行版中都没有。但是，可以使用以下 [fish 仓库][2] 轻松安装。

对于基于 Arch Linux 的系统, 使用 [Pacman 命令][3] 来安装 fish shell。

```
$ sudo pacman -S fish
```

对于 Ubuntu 16.04/18.04 系统来说，请使用 [APT-GET 命令][4] 或者 [APT 命令][5] 安装 fish shell。

```
$ sudo apt-add-repository ppa:fish-shell/release-3
$ sudo apt-get update
$ sudo apt-get install fish
```

对于 Fedora 系统来说，请使用 [DNF 命令][6] 安装 fish shell。

对于 Fedora 29 系统来说：

```
$ sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:/fish:/release:/3/Fedora_29/shells:fish:release:3.repo
$ sudo dnf install fish
```

对于 Fedora 28 系统来说：

```
$ sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:/fish:/release:/3/Fedora_28/shells:fish:release:3.repo
$ sudo dnf install fish
```

对于 Debian 系统来说，请使用 [APT-GET 命令][4] 或者 [APT 命令][5] 安装 fish shell。

对于 Debian 9 系统来说：

```
$ sudo wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release.key
$ sudo apt-key add - < Release.key
$ sudo echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' > /etc/apt/sources.list.d/shells:fish:release:3.list
$ sudo apt-get update
$ sudo apt-get install fish
```

对于 Debian 8 系统来说：

```
$ sudo wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_8.0/Release.key -O Release.key
$ sudo apt-key add - < Release.key
$ sudo echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_8.0/ /' > /etc/apt/sources.list.d/shells:fish:release:3.list
$ sudo apt-get update
$ sudo apt-get install fish
```

对于 RHEL/CentOS 系统来说，请使用 [YUM 命令][7] 安装 fish shell。

对于 RHEL 7 系统来说：

```
$ sudo yum-config-manager --add-repo https://download.opensuse.org/repositories/shells:/fish:/release:/3/RHEL_7/shells:fish:release:3.repo
$ sudo yum install fish
```

对于 RHEL 6 系统来说：

```
$ sudo yum-config-manager --add-repo https://download.opensuse.org/repositories/shells:/fish:/release:/3/RedHat_RHEL-6/shells:fish:release:3.repo
$ sudo yum install fish
```

对于 CentOS 7 系统来说：

```
$ sudo yum-config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
$ sudo yum install fish
```

对于 CentOS 6 系统来说：

```
$ sudo yum-config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo
$ sudo yum install fish
```

对于 openSUSE Leap 系统来说，请使用 [Zypper 命令][8] 安装 fish shell。

```
$ sudo zypper addrepo https://download.opensuse.org/repositories/shells:/fish:/release:/3/openSUSE_Leap_42.3/shells:fish:release:3.repo
$ suod zypper refresh
$ sudo zypper install fish
```

### 如何使用 Fish Shell ？

一旦你成功安装了 fish shell 。只需在你的终端上输入 `fish` ，它将自动从默认的 bash shell 切换到 fish shell 。

```
$ fish
```

![][10]

### 自动补全建议

当你在 fish shell 中键入任何命令时，它会在输入几个字母后以浅灰色自动建议一个命令。 

![][11]

一旦你得到一个建议然后按下向右光标键（LCTT 译注：原文是左，错的）就能完成它而不是输入完整的命令。

![][12]

你可以在键入几个字母后立即按下向上光标键检索该命令以前的历史记录。它类似于 bash shell 的 `CTRL+r` 选项。

### Tab 补全

如果你想查看给定命令是否还有其他可能性，那么在键入几个字母后，只需按一下 `Tab` 键即可。

![][13]

再次按 `Tab` 键可查看完整列表。

![][14]

### 语法高亮

fish 会进行语法高亮显示，你可以在终端中键入任何命令时看到。无效的命令被着色为 `RED color` 。

![][15]

同样的，有效的命令以不同的颜色显示。此外，当你键入有效的文件路径时，fish 会在其下面加下划线，如果路径无效，则不会显示下划线。

![][16]

### 基于 Web 的配置器

fish shell 中有一个很酷的功能，它允许我们通过网络浏览器设置颜色、提示符、功能、变量、历史和键绑定。

在终端上运行以下命令以启动 Web 配置界面。只需按下 `Ctrl+c` 即可退出。

```
$ fish_config
Web config started at 'file:///home/daygeek/.cache/fish/web_config-86ZF5P.html'. Hit enter to stop.
qt5ct: using qt5ct plugin
^C
Shutting down.
```

![][17]

### 手册页补全

其他 shell 支持可编程的补全，但只有 fish 可以通过解析已安装的手册页自动生成它们。

要使用该功能，请运行以下命令：

```
$ fish_update_completions
Parsing man pages and writing completions to /home/daygeek/.local/share/fish/generated_completions/
 3466 / 3466 : zramctl.8.gz
```

### 如何将 Fish 设置为默认 shell

如果你想测试 fish shell 一段时间，你可以将 fish shell 设置为默认 shell，而不用每次都切换它。

要这样做，首先使用以下命令获取 Fish Shell 的位置。

```
$ whereis fish
fish: /usr/bin/fish /etc/fish /usr/share/fish /usr/share/man/man1/fish.1.gz
```

通过运行以下命令将默认 shell 更改为 fish shell 。

```
$ chsh -s /usr/bin/fish
```

![][18]

提示：只需验证 Fish Shell 是否已添加到 `/etc/shells` 目录中。如果不是，则运行以下命令以附加它。

```
$ echo /usr/bin/fish | sudo tee -a /etc/shells
```

完成测试后，如果要返回 bash shell ，请使用以下命令。

暂时返回：

```
$ bash
```

永久返回：

```
$ chsh -s /bin/bash
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-fish-shell-friendly-interactive-shell/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[zero-MK](https://github.com/zero-MK)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://fishshell.com/
[2]: https://download.opensuse.org/repositories/shells:/fish:/release:/
[3]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[8]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-1.png
[11]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-2.png
[12]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-5.png
[13]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-3.png
[14]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-4.png
[15]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-6.png
[16]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-8.png
[17]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-9.png
[18]: https://www.2daygeek.com/wp-content/uploads/2019/02/linux-fish-shell-friendly-interactive-shell-7.png
