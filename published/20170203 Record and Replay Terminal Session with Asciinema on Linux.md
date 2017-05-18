如何在 Linux 中使用 Asciinema 进行录制和回放终端会话
===========

![](https://linuxconfig.org/images/asciimena-video-example.jpg?58942057)


### 简介

Asciinema 是一个轻量并且非常高效的终端会话录制器。使用它可以录制、回放和分享 JSON 格式的终端会话记录。与一些桌面录制器，比如 Recordmydesktop、Simplescreenrecorder、Vokoscreen 或 Kazam 相比，Asciinema 最主要的优点是，它能够以通过 ASCII 文本以及 ANSI 转义码编码来录制所有的标准终端输入、输出和错误信息。

事实上，即使是很长的终端会话，录制出的 JSON 格式文件也非常小。另外，JSON 格式使得用户可以利用简单的文件转化器，将输出的 JSON 格式文件嵌入到 HTML 代码中，然后分享到公共网站或者使用 asciinema 账户分享到 Asciinema.org 。最后，如果你的终端会话中有一些错误，并且你还懂一些 ASCI 转义码语法，那么你可以使用任何编辑器来修改你的已录制终端会话。

**难易程度：**

很简单！

**标准终端：**

*   **#** - 给定命令需要以 root 用户权限运行或者使用 `sudo` 命令
*   **$** - 给定命令以常规权限用户运行

### 从软件库安装

通常， asciinema 可以使用你的发行版的软件库进行安装。但是，如果不可以使用系统的软件库进行安装或者你想安装最新的版本，那么，你可以像下面的“从源代码安装”部分所描述的那样，使用 Linuxbrew 包管理器来执行 Asciinema 安装。

**在 Arch Linux 上安装：**

```
# pacman -S asciinema
```

**在 Debian 上安装：**

```
# apt install asciinema
```

**在 Ubuntu 上安装：**

```
$ sudo apt install asciinema
```

**在 Fedora 上安装：**

```
$ sudo dnf install asciinema
```

### 从源代码安装

最简单并且值得推荐的方式是使用 Linuxbrew 包管理器，从源代码安装最新版本的 Asciinema 。

#### 前提条件

下面列出的前提条件是安装 Linuxbrew 和 Asciinema 需要满足的依赖关系：

*   git
*   gcc
*   make
*   ruby

在安装 Linuxbrew 之前，请确保上面的这些包都已经安装在了你的 Linux 系统中。

**在 Arch Linux 上安装 ruby：**

```
# pacman -S git gcc make ruby
```

**在 Debian 上安装 ruby：**

```
# apt install git gcc make ruby
```

**在 Ubuntu 上安装 ruby：**

```
$ sudo apt install git gcc make ruby
```

**在 Fedora 上安装 ruby：**

```
$ sudo dnf install git gcc make ruby
```

**在 CentOS 上安装 ruby：**

```
# yum install git gcc make ruby
```

#### 安装 Linuxbrew

Linuxbrew 包管理器是苹果的 MacOS 操作系统很受欢迎的 Homebrew 包管理器的一个复刻版本。还没发布多久，Homebrew 就以容易使用而著称。如果你想使用 Linuxbrew 来安装 Asciinema，那么，请运行下面命令在你的 Linux 版本上安装 Linuxbrew：

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
```

现在，Linuxbrew 已经安装到了目录 `$HOME/.linuxbrew/` 下。剩下需要做的就是使它成为可执行 `PATH` 环境变量的一部分。

```
$ echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile
$ . ~/.bash_profile
```

为了确认 Linuxbrew 是否已经安装好，你可以使用 `brew` 命令来查看它的版本：

```
$ brew --version
Homebrew 1.1.7
Homebrew/homebrew-core (git revision 5229; last commit 2017-02-02)
```

#### 安装 Asciinema

安装好 Linuxbrew 以后，安装 Asciinema 就变得无比容易了：

```
$ brew install asciinema
```

检查 Asciinema 是否安装正确：

```
$ asciinema --version
asciinema 1.3.0
```

### 录制终端会话

经过一番辛苦的安装工作以后，是时候来干一些有趣的事情了。Asciinema 是一个非常容易使用的软件。事实上，目前的 1.3 版本只有很少的几个可用命令行选项，其中一个是 `--help` 。

我们首先使用 `rec` 选项来录制终端会话。下面的命令将会开始录制终端会话，之后，你将会有一个选项来丢弃已录制记录或者把它上传到 asciinema.org 网站以便将来参考。

```
$ asciinema rec
```

运行上面的命令以后，你会注意到， Asciinema 已经开始录制终端会话了，你可以按下 `CTRL+D` 快捷键或执行 `exit` 命令来停止录制。如果你使用的是 Debian/Ubuntu/Mint Linux 系统，你可以像下面这样尝试进行第一次 asciinema 录制：

```
$ su
Password:
# apt install sl
# exit
$ sl
```

一旦输入最后一个 `exit` 命令以后，将会询问你：

```
$ exit
~ Asciicast recording finished.
~ Press <Enter> to upload, <Ctrl-C> to cancel.

https://asciinema.org/a/7lw94ys68gsgr1yzdtzwijxm4
```

如果你不想上传你的私密命令行技巧到 asciinema.org 网站，那么有一个选项可以把 Asciinema 记录以 JSON 格式保存为本地文件。比如，下面的 asciinema 记录将被存为 `/tmp/my_rec.json`：

```
$ asciinema rec /tmp/my_rec.json
```

另一个非常有用的 asciinema 特性是时间微调。如果你的键盘输入速度很慢，或者你在进行多任务，输入命令和执行命令之间的时间会比较长。Asciinema 会记录你的实时按键时间，这意味着每一个停顿都将反映在最终视频的长度上。可以使用 `-w` 选项来缩短按键的时间间隔。比如，下面的命令将按键的时间间隔缩短为 0.2 秒：

```
$ asciinema rec -w 0.2
```

### 回放已录制终端会话

有两种方式可以来回放已录制会话。第一种方式是直接从 asciinema.org 网站上播放终端会话。这意味着，你之前已经把录制会话上传到了 asciinema.org 网站，并且需要提供有效链接：

```
$ asciinema play https://asciinema.org/a/7lw94ys68gsgr1yzdtzwijxm4
```

另外，你也可以使用本地存储的 JSON 文件：

```
$ asciinema play /tmp/my_rec.json
```

如果要使用 `wget` 命令来下载之前的上传记录，只需在链接的后面加上 `.json`：

```
$ wget -q -O steam_locomotive.json https://asciinema.org/a/7lw94ys68gsgr1yzdtzwijxm4.json
$ asciinema play steam_locomotive.json
```

### 将视频嵌入 HTML

最后，asciinema 还带有一个独立的 JavaScript 播放器。这意味者你可以很容易的在你的网站上分享终端会话记录。下面，使用一段简单的 `index.html` 代码来说明这个方法。首先，下载所有必要的东西：

```
$ cd /tmp/
$ mkdir steam_locomotive
$ cd steam_locomotive/
$ wget -q -O steam_locomotive.json https://asciinema.org/a/7lw94ys68gsgr1yzdtzwijxm4.json
$ wget -q https://github.com/asciinema/asciinema-player/releases/download/v2.4.0/asciinema-player.css
$ wget -q https://github.com/asciinema/asciinema-player/releases/download/v2.4.0/asciinema-player.js
```
之后，创建一个新的包含下面这些内容的 `/tmp/steam_locomotive/index.html` 文件：

```
<html>
<head>
  <link rel="stylesheet" type="text/css" href="./asciinema-player.css" />
</head>
<body>
  <asciinema-player src="./steam_locomotive.json" cols="80" rows="24"></asciinema-player>
  <script src="./asciinema-player.js"></script>
</body>
</html>
```

完成以后，打开你的网页浏览器，按下 `CTRL+O` 来打开新创建的 `/tmp/steam_locomotive/index.html` 文件。

### 结论

正如前面所说的，使用 asciinema 录制器来录制终端会话最主要的优点是它的输出文件非常小，这使得你的视频很容易分享出去。上面的例子产生了一个包含 58472 个字符的文件，它是一个只有 58 KB 大 小的 22 秒终端会话视频。如果我们查看输出的 JSON 文件，会发现甚至这个数字已经非常大了，这主要是因为一个 “蒸汽机车” 已经跑过了终端。这个长度的正常终端会话一般会产生一个更小的输出文件。

下次，当你想要在一个论坛上询问关于 Linux 配置的问题，并且很难描述你的问题的时候，只需运行下面的命令：

```
$ asciinema rec
```

然后把最后的链接贴到论坛的帖子里。

### 故障排除

#### 在 UTF-8 环境下运行 asciinema

错误信息：

```
asciinema needs a UTF-8 native locale to run. Check the output of `locale` command.
```

解决方法：
生成并导出 UTF-8 语言环境。例如：

```
$ localedef -c -f UTF-8 -i en_US en_US.UTF-8
$ export LC_ALL=en_US.UTF-8
```

--------------------------------------------------------------------------------

via: https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux

作者：[Lubos Rendek][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux
[1]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-1-arch-linux
[2]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-2-debian
[3]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-3-ubuntu
[4]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-4-fedora
[5]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-1-arch-linux
[6]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-2-debian
[7]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-3-ubuntu
[8]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-4-fedora
[9]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-5-centos
[10]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h13-1-asciinema-needs-a-utf-8
[11]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h1-introduction
[12]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h2-difficulty
[13]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h3-conventions
[14]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h4-standard-repository-installation
[15]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h5-installation-from-source
[16]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h6-prerequisites
[17]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h7-linuxbrew-installation
[18]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h8-asciinema-installation
[19]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h9-recording-terminal-session
[20]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h10-replay-recorded-terminal-session
[21]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h11-embedding-video-as-html
[22]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h12-conclusion
[23]:https://linuxconfig.org/record-and-replay-terminal-session-with-asciinema-on-linux#h13-troubleshooting
