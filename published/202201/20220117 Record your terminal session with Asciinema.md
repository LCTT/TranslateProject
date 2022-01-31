[#]: subject: "Record your terminal session with Asciinema"
[#]: via: "https://opensource.com/article/22/1/record-terminal-session-asciinema"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14216-1.html"

用 Asciinema 记录你的终端会话
======

> 用这个开源的终端会话记录器 Asciinema 来展示终端会话。

![](https://img.linux.net.cn/data/attachment/album/202201/26/192641raoczh9h2w5xd2cq.jpg)

支持电话是很重要的，而且最后往往是令人满意的，但明确的沟通行为对每个参与的人来说都是艰巨的。如果你曾经参加过支持电话，你可能会花好几分钟拼出了最短的命令，并详细解释了空格和回车的位置。虽然直接拿过来用户电脑的控制权往往更容易，但这并不是真正的教育的最佳方式。你可以尝试向用户发送一个屏幕记录，而他们可以复制命令并粘贴到自己的终端。

Asciinema 是一个开源的终端会话记录器。与 `script` 和 `scriptreplay` 命令类似，Asciinema 准确记录了你的终端显示。它将你的“电影”记录保存到一个文本文件中，然后根据需要进行回放。你可以把你的电影上传到 Asciinema.org，就像你在互联网上分享任何其他视频一样，你甚至可以把你的电影嵌入到网页中。

### 安装 Asciinema

在 Linux 上，你可以使用你的包管理器安装 Asciinema。

在 Fedora、CentOS、Mageia 或类似系统上：

```
$ sudo dnf install asciinema
```

在 Debian、Linux Mint 或类似系统上：

```
$ sudo apt install asciinema
```

在 macOS 上，你可以用 Homebrew 安装：

```
$ sudo brew install asciinema
```

在 BSD 和任何其它平台上使用 [Pkgsrc][2]：

```
$ cd /usr/pkgsrc/misc/py-asciinema
$ sudo bmake install clean
```

### 从文本中制作电影

要用 Asciinema 开始录制，你可以使用 `rec` 子命令：

```
$ asciinema rec mymovie.cast
asciinema: recording asciicast to mymovie.cast
asciinema: press <ctrl-d> or type "exit" when you're done
```

一些友好的输出信息提醒你，你正在录制，并告诉你如何停止：按 `Ctrl+D` 或直接输入 `exit`。

当 Asciinema 处于活动状态时，你在终端所做的一切都会被记录下来。这包括输入、输出、错误、尴尬的停顿、错误或成功。如果在录制时，在你的终端中查看它，它就会被剪断。

当你演示完终端如何工作时，按 `Ctrl+D` 或输入 `exit` 来停止记录。

在这个例子中，产生的文件 `mymovie.cast` 是一个时间戳和动作的集合，它用作回放所使用的脚本（像电影脚本一样）。

```
{"version": 2, "width": 139, "height": 36, "timestamp": 1641457358, "env": {"SHELL": "/bin/bash", "TERM": "xterm-256color"}}
[0.05351, "o", "\u001b]0;seth:~\u0007"]
[0.05393, "o", "\u001b[1;31m$ \u001b[00m"]
[1.380059, "o", "e"]
[1.443823, "o", "c"]
[1.514674, "o", "h"]
[1.595238, "o", "o"]
[1.789562, "o", " "]
[2.09658, "o", "\""]
[2.19683, "o", "h"]
[2.403994, "o", "e"]
[2.466784, "o", "l"]
[2.711183, "o", "lo"]
[3.120852, "o", "\""]
[3.427886, "o", "\r\nhello\r\n"]
[...]
```

如果你犯了一个错误，你可以通过删除重现错误的行来去除这个错误。如果你发现自己在录制过程中做了很多命令行修改或冗长的停顿，你可以安装并使用 [asciinema-edit][3] 工具，它可以通过你定义的时间戳或消除空闲时间来剪掉这些“镜头”片段。

### 播放 Asciinema 电影

你可以使用 `play` 子命令回放你的 Asciinema：

```
$ asciinema play mymovie.cast
```

这会接管你的终端会话，并使其成为最接近银幕的形式（除了那次你通过 `telnet` 观看 ASCII 格式的星球大战）。这个基于文本的电影播放，向你的用户展示了一个复杂的任务是如何完成的。当然，播放的 _实际_ 命令并不真正执行。这不是一个正在运行的 shell 脚本，所以即使你在电影中创建了一个 `hello.txt` 文件，在播放后也不会有一个新的 `hello.txt`。这只是为了展示。

然而，它又不仅仅是一个展示。你可以暂停 Asciinema 电影，选择你在屏幕上看到的文本，并将其粘贴到一个活动终端以运行该命令。Asciinema 是有用的文档。它向用户展示了如何完成一项任务，并允许他们进行复制和粘贴以确保准确性。

### 上传你的 Asciinema 电影

目前还没有像大片一样的 Asciinema 电影，但你可以把你的电影上传到 Asciinema.org，与全世界分享：

```
$ asciinema upload mymovie.cast
```

如果你习惯了 YouTube 上传所花费的时间，你会对 Asciinema 电影的传输速度感到惊喜。一个 `.cast` 文件通常只有几千字节，最多几兆字节，所以上传几乎是瞬间完成的。你不需要注册账户来分享你的电影，但所有无人认领的电影将在七天后会被删除。为了保存你的杰作，你可以在 Asciinema 上开设一个账户，然后坐等电影学院的电话。

### Asciinema 作为文档

Asciinema 是演示最基本概念的好方法。因为它保留了从录制中复制和粘贴代码的能力，提供了按需暂停和播放的能力，并且完全准确地描绘了它的内容，它不仅仅是屏幕录像，它要好得多。无论你是用它来向你的朋友炫耀你的终端技能，还是用它来教育同事和学生，Asciinema 都是一个无价的、社交的、便于访问的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/record-terminal-session-asciinema

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[3]: https://github.com/cirocosta/asciinema-edit
