[#]: subject: "10 Tools to Generate and Have Fun With ASCII Art in Linux Terminal"
[#]: via: "https://itsfoss.com/ascii-art-linux-terminal/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "CoWave-Fall"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16205-1.html"

10 个在 Linux 终端中生成有趣的 ASCII 字符画的工具
======

> 以为 Linux 终端都是严肃的工作？想多了。以下是你可以在终端中使用 ASCII 字符画做的几件趣事。

Linux 终端其实没有想象中的那样 [可怕][1A]。

当然啦，一开始它可能会令人望而却步，但是当我们更 [了解][1] 它的时候，我们就会喜欢上它的。

你可能会使用终端来做一些严肃的工作。不过，你也可以在终端中做很多有趣的事情。

其中的一项就是试一试<ruby>ASCII 字符画<rt>ASCII art</rt></ruby>。你可以在 Linux 终端中用各种命令行工具以 ASCII 的形式显示一些预定义的或是随机的消息、玩游戏，抑或是播放动画。

我的同事 Sreenath 喜欢探索此类不寻常的命令行工具并将他的发现分享给我。现在，我也将他的发现与你分享。

![ascii art tools linux][2]

你的 Linux 发行版的仓库中应该已经有这些程序中的大多数了。你可以用系统的包管理器安装它们。为了使文章简洁，下文的安装指南均以 Ubuntu 为例。

### 1、lolcat：向终端加入缤纷色彩

虽然 `lolcat` 与 ASCII 字符画没有任何关系，至少，没有直接关系。

但是，我还是在文章开头就列出了它，因为它可以与其他的 ASCII 工具组合使用。

所以，它能做什么呢？它与 `cat` 指令很相似，但是它向输出内容加入随机的渐变色彩。

![lolcat][3]

目前它看起来可能没什么用，但当其他 ASCII 工具通过 `lolcat` 输出时，你会看到它的效果。

用 `apt` 安装 `lolcat`：

```
sudo apt install lolcat
```

### 2、Aewan：漂亮地显示 ASCII 字符

Aewan 是一个多层 ASCII 图形、动画编辑器。它可以生成独立的，可被 `cat` 命令查看的 ASCII 字符画文件和便于命令行工具集成与解析的格式。

它包括两个工具：ASCII 编辑器 `aewan`，和文件查看器 `aecat`。

这里不讨论编辑器部分。

![aewan 的初始状态布局][4]

用 `aecat` 命令以 ASCII 格式漂亮地显示任何文本。注意下面的截屏中字母的使用方式。

![aewan output][5]

用下面的命令安装 `aewan`：

```
sudo apt install aewan
```

然后这样使用：

```
aecat hello
```

### 3、Cowsay：让 ASCII 牛复述你想说的话

这头牛在说什么？你想什么就让它说什么。

`cowsay` 是经验丰富的 Linux 用户中流行的工具。它显示了一个 ASCII 格式的牛，会重复你提供的文本。

![cowsay][6]

但不仅限于牛。你也可以将其更改为其他的角色。比如，一条龙（火龙君临）：

![cowsay][7]

你注意到截图中的色彩了吗？这正是上文提到过的 `lolcat` 命令的魔力所在。

用下列命令安装 `cowsay`：

```
sudo apt install cowsay
```

装好之后，这样使用：

```
cowsay hello
```

你可以参考它的 [手册][8]，浏览其他配置和选项。

### 4、jp2a：图片转 ASCII 字符画

`jp2a` 是一个在 Linux 终端中将图像转换为 ASCII 字符画的命令行工具。它适用于 JPEG 和 PNG 文件，允许彩色输出和用你选定的字符显示 ASCII 字符画。

![jp2a][10]

用下列命令安装它：

```
sudo apt install jp2a
```

你可以像这样得到彩色的输出，并且保存到文件。

```
jp2a --output=ascii.txt --colors input.png
```

它并不是这类工具中的唯一一种，比如，`ascii-image-converter` 和几个其他的工具也可以达成相同的效果。在这里不再一一讨论了。

### 5、linuxlogo：用 ASCII 格式显示 Linux 发行版的徽标

正如起名，它 [用 ASCII 格式显示 Linux 发行版的标志][11]。

不，不是我们 [喜爱的 Linux 标志 Tux][12]，而是你的 Linux 发行版的徽标。它还显示一些其他信息，比如 Linux 内核版本、CPU、RAM、主机名等等。

![linux logo][14]

用 `apt` 安装：

```
sudo apt install linuxlogo
```

输入 `linuxlogo` 就可以用啦。

### 6、Neoftech：显示 Linux 标志和系统信息

上面的 Linux 标志有点太简化了。你可以用 Neofetch 放大它。

它以更漂亮的方式显示发行版以及一些系统信息，如内核、运行时间、桌面环境、主题和图标等等。

![neofetch][15]

你还可以通过 `lolcat` 解析它，获得彩虹色的输出。

用这行命令安装 Neofetch：

```
sudo apt install neofetch
```

然后，输入 `neofetch` 就可以运行啦。

还有一个与 Neofetch 很像的工具，`screenfetch`。用哪个都行。

### 7、fortune：看看命运如何

开玩笑啦。这样的事情根本就不存在。

不过，幸运饼干仍然很流行，所以显然，人们喜欢阅读随机的预测或说法。

你可以在 Linux 终端中用 Fortune 命令达到类似效果：

![fortune cookie linux][16]

你可以用下面的命令安装它。

```
sudo apt install fortune
```

装好之后，在终端中输入 `fortune` 来得到一条随机消息。

### 8、pv：让一切动起来

这是非预期使用 Linux 命令的典型例子。`pv` 命令本来用于通过管道监控数据的进度。

但你可以使用它来对显示任何命令的输出加入动画效果。将其与上述的命令结合起来，你就可以看到 ASCII 字符画逐渐显现在屏幕上，就像正在输入一样。

不太明白？看看这个：

![A Video from YouTube][17]

用下面的命令安装：

```
sudo apt install pv
```

然后按这样使用：

```
neofetch | pv -qL 200 | lolcat
```

数字越大，速度越快。

### 9、cmatrix：类似黑客帝国的 ASCII 动画

还记得 “黑客帝国” 吗？下落的绿色代码是黑客帝国和黑客的象征。

你可以使用 `cmatrix` 命令在 Linux 终端用 ASCII 模拟运行下落代码。

我在这里用一张图片代替视频。

![cmatrix][18]

你可以用 `apt` 安装它：

```
sudo apt install cmatrix
```

安装好之后，用它运行：

```
cmatrix
```

它会立即启动，并不断生成随机的绿色文本，带着从屏幕上落下后消失的动画效果。该命令会持续运行。使用 `Ctrl+C` 停止运行程序。

### 10、cbonsai：在你的终端种植盆景

有没有园艺的天赋？在终端中种植一棵 ASCII 盆景树怎么样？

`cbonsai` 是一个可让你以 ASCII 格式运行盆景树生长动画的有趣 Linux 命令。

几天前我发了一条关于 `cbonsai` 命令的 YouTube 短视频。

![Have fun with the Linux terminal 😍 🐧][21]

你可以用下面的命令安装 `cbonsai`：

```
sudo apt install cbonsai
```

用这行命令运行：

```
cbonsai -l
```

### 试试更多

还有很多这样的有趣的命令行工具，甚至还有 [ASCII 游戏][23]。有时，看着它们给周围的人带来欢乐真的很有趣。

这些命令能派上用场吗？我不确定是否可用，但你可以在 `.bashrc` 文件中添加其中一些，这样一旦打开终端会话，命令就会立即运行。

许多系统管理员在共享的 Linux 系统上都会这样做。像 `cowsay` 或 `figlet` 这样的程序可以用来以漂亮的方式显示消息或系统概况。

你也可以在你的 Bash 脚本中使用其中的一些程序，尤其是当你需要突出显示某些内容时。

ASCII 字符画在 Linux 中可能还会有其他用途。你可以与我们分享。


--------------------------------------------------------------------------------

via: https://itsfoss.com/ascii-art-linux-terminal/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[泠知落汐](https://github.com/CoWave-Fall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1A]: https://itsfoss.com/basic-terminal-tips-ubuntu/
[1]: https://itsfoss.com/love-thy-terminal/
[2]: https://itsfoss.com/content/images/wordpress/2022/07/ascii-art-tools-linux.png
[3]: https://itsfoss.com/content/images/wordpress/2022/07/lolcat.png
[4]: https://itsfoss.com/content/images/wordpress/2022/07/Aewan-initial-layout.png
[5]: https://itsfoss.com/content/images/wordpress/2022/07/aewan-output.png
[6]: https://itsfoss.com/content/images/wordpress/2022/07/cowsay-1.png
[7]: https://itsfoss.com/content/images/wordpress/2022/07/cowsay.png
[8]: https://itsfoss.com/linux-man-page-guide/
[9]: https://itsfoss.com/ascii-image-converter/
[10]: https://itsfoss.com/content/images/wordpress/2022/07/jp2a.png
[11]: https://itsfoss.com/display-linux-logo-in-ascii/
[12]: https://itsfoss.com/tux-trivia/
[13]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[14]: https://itsfoss.com/content/images/wordpress/2022/07/linux-logo.png
[15]: https://itsfoss.com/content/images/wordpress/2022/07/neofetch.png
[16]: https://itsfoss.com/content/images/wordpress/2022/07/fortune-cookie-Linux.png
[17]: https://player.vimeo.com/video/727286686
[18]: https://itsfoss.com/content/images/wordpress/2022/07/cmatrix.png
[19]: https://itsfoss.com/stop-program-linux-terminal/
[20]: https://itsfoss.com/funny-linux-commands/
[21]: https://youtu.be/KqhqgdezPp8
[22]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[23]: https://itsfoss.com/best-ascii-games/
