[#]: subject: "Using Asciiquarium for Aquarium Like Animation Effects in Linux Terminal"
[#]: via: "https://itsfoss.com/asciiquarium/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16354-1.html"

在 Linux 终端利用 Asciiquarium 打造海底世界
======

![][0]

> 这是一个小小的 CLI 工具，可在 Linux 终端中添加水族箱。

[Linux 的众多命令工具][1] 里，有一部分偏向于休闲娱乐而非工作。Asciiquarium 就是一个很好的例子。

Asciiquarium 为 Linux 终端提供了以 ASCII 格式构建的简单的水族馆动画效果。

![][2]

看起来有趣吗？我们一起进一步了解。

### 如何在 Linux 中安装 Asciiquarium

如果你是 Arch Linux 或 Fedora 用户，你可以直接从官方仓库中安装。

Fedora 的用户请运行：

```
sudo dnf install asciiquarium
```

而 Arch Linux 用户请运行：

```
sudo pacman -S asciiquarium
```

对于 Ubuntu，Asciiquarium 没有包含在默认仓库里。因此，你需要选择使用预编译的二进制文件，或者一些外部的 PPA。

#### 使用 PPA 安装 Asciiquarium

首先，添加 Asciiquarium 的 PPA：

```
sudo add-apt-repository ppa:ytvwld/asciiquarium
sudo apt update
```

然后，安装相关的软件包和依赖：

```
sudo apt install asciiquarium
```

##### 删除 PPA

在你删除 Asciiquarium 的 PPA 之前，首先要移除相关软件包。

```
sudo apt purge asciiquarium
sudo apt autoremove
```

然后，从系统中移除 PPA：

```
sudo add-apt-repository --remove ppa:openshot.developers/ppa
sudo apt update
```

#### 使用二进制文件安装 Asciiquarium

> 🚧 你需要为你的系统单独安装一些 Perl 模块。同时，它将在你的系统中安装几个与 Perl 相关的包，所以请注意。

![安装 Perl 依赖包][3]

要运行二进制文件，你需要从 CPAN 中安装 Animation 和 Curses 模块。

在 Ubuntu 中安装 CPAN：

```
sudo apt install cpanminus libcurses-perl
```

接着，运行：

```
cpan Term::Animation
```

![Animation 模块安装][4]

该操作会要求你做一些配置，只需选取默认值即可。全部设置好后，来下载 Asciiquarium 的发布版。

> **[下载 Asciiquarium][5]**

解压文件，你会得到一个名为 Asciiquarium 的文件，接下来，让它具有执行权限。

![赋予 Asciiquarium 执行权限][6]

如果你需要通过命令行来完成，只需打开终端，并用 [chmod 命令][7]赋予执行权限。

```
chmod +x asciiquarium
```

此时，你可以直接在当前目录下运行这个文件以获取动画效果：

```
./asciiquarium
```

或者，你也可以把这个文件放在一个 [包含在你的 PATH 中][8]的位置上。

### 如何使用 Asciiquarium

Asciiquarium 使用起来非常简单，它不设任何命令行选项。只需运行 `asciiquarium`，你就能在终端中看到水族馆的动画效果。

![Asciiquarium 动画效果][2]

程序还提供了几个热键支持。

  * `r`：重绘动画
  * `p`：暂停/播放动画
  * `q`：退出程序

> 📋

此外，也可以使用箭头键提升动画的速度。

#### 用 lolcat 加强 Asciiquarium 的体验

如果你想让 Asciiquarium 的颜色更丰富，可以综合使用 `lolcat`。首先安装 `lolcat` ：

```
sudo apt install lolcat
```

然后，运行：

```
asciiquarium | lolcat
```

![Asciiquarium Lolcat 效果][9]

如果你还需要更多的动画效果，可以适当调节 `lolcat` 的参数，例如：

```
asciiquarium | lolcat -p 200

```

![Asciiquarium 和 lolcat 的效果调整][10]

这样操作会产生各种不同的颜色效果。

你还可以使用 `lolcat` 的 `-i` 选项，来反转颜色：

```

asciiquarium | lolcat -i -p 200

```

![颜色反转效果][11]

### 赠品：XFishTank（让你的桌面诠释海底世界）

还有一个类似的有趣命令叫做 `xfishtank`。它在你的根窗口，即桌面，创建一片海洋世界。你可以从 Ubuntu 的官方仓库直接安装 `xfishtank`。

```
sudo apt install xfishtank
```

安装完成后，直接运行：

```
xfishtank
```

XFishTank 提供了很多选项供你调节，例如鱼儿的数量、气泡等等。你可以参考 [该命令的 man 页面][12] 学习更多相关内容。

```
xfishtank -b 100 -f 15
```

![Xfishtank 效果展示][13]

### 结语

就像你所看到的，Linux 终端里的小鱼或许不能提供实质性的帮助，但它确实能带给我们愉快的心情。

如果你不是那么喜欢鱼，那么试试看牛吧。

> **[哞~ 我的 Linux 终端里有头牛][14]**

希望你在这些有趣的小工具的陪伴下，能够更加享受 Linux 的世界。:)

*（题图：MJ/83766cba-02e1-4d20-8797-a38e5c17a0c0）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/asciiquarium/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/funny-linux-commands/
[2]: https://itsfoss.com/content/images/2023/10/asciiquarium.png
[3]: https://itsfoss.com/content/images/2023/10/Installing-perl-dependencies.png
[4]: https://itsfoss.com/content/images/2023/10/animation-module-setup.png
[5]: https://robobunny.com/projects/asciiquarium/html/
[6]: https://itsfoss.com/content/images/2023/10/execution-permission-for-asciiquarium.png
[7]: https://linuxhandbook.com/chmod-command/
[8]: https://itsfoss.com/add-directory-to-path-linux/
[9]: https://itsfoss.com/content/images/2023/10/ascciiquarium-lolcat.png
[10]: https://itsfoss.com/content/images/2023/10/lolcat-200.gif
[11]: https://itsfoss.com/content/images/2023/10/inverted.png
[12]: https://itsfoss.com/linux-man-page-guide/
[13]: https://itsfoss.com/content/images/2023/10/xfishtank.png
[14]: https://linux.cn/article-15952-1.html
[0]: https://img.linux.net.cn/data/attachment/album/202311/06/104101r2sfkrf27ozfqffq.png