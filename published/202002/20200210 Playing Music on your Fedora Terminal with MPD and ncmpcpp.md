[#]: collector: (lujun9972)
[#]: translator: (chai-yuan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11909-1.html)
[#]: subject: (Playing Music on your Fedora Terminal with MPD and ncmpcpp)
[#]: via: (https://fedoramagazine.org/playing-music-on-your-fedora-terminal-with-mpd-and-ncmpcpp/)
[#]: author: (Carmine Zaccagnino https://fedoramagazine.org/author/carzacc/)

在你的 Fedora 终端上播放音乐 
======

![][1]

MPD（Music Playing Daemon），顾名思义，是一个音乐（Music）播放（Playing）守护进程（Daemon）。它可以播放音乐，并且作为一个守护进程，任何软件都可以与之交互并播放声音，包括一些 CLI 客户端。 

其中一个被称为 `ncmpcpp`，它是对之前 `ncmpc` 工具的改进。名字的变化与编写它们的语言没有太大关系：都是 C++，而之所以被称为 `ncmpcpp`，因为它是 “NCurses Music Playing Client Plus Plus”。 缘故 

### 安装 MPD 和 ncmpcpp

`ncmpmpcc` 的客户端可以从官方 Fedora 库中通过 `dnf` 命令直接安装。

```
$ sudo dnf install ncmpcpp
```

另一方面，MPD 必须从 RPMFusion free 库安装，你可以通过运行：

```
$ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

然后你可以运行下面的命令安装它：

```
$ sudo dnf install mpd
```

### 配置并启用 MPD

设置 MPD 最简单的方法是以普通用户的身份运行它。默认情况是以专用 `mpd` 用户的身份运行它，但这会导致各种权限问题。
 
在运行它之前，我们需要创建一个本地配置文件，允许我们作为普通用户运行。

首先在 `~/.config` 里创建一个名叫 `mpd` 的目录:

```
$ mkdir ~/.config/mpd
```

将配置文件拷贝到此目录下:

```
$ cp /etc/mpd.conf ~/.config/mpd
```

然后用 `vim`、`nano` 或 `gedit` 之类的软件编辑它:

```
$ nano ~/.config/mpd/mpd.conf
```

我建议你通读所有内容，检查是否有任何需要做的事情，但对于大多数设置你都可以删除，只需保留以下内容：
 
```
db_file "~/.config/mpd/mpd.db"
log_file "syslog"
```

现在你可以运行它了：

```
$ mpd
```

没有报错，这将在后台启动 MPD 守护进程。 

### 使用 ncmpcpp

只需运行：

```
$ ncmpcpp
```

你将在终端中看到一个由 ncurses 所支持的图形用户界面。 

按下 `4` 键，然后就可以看到本地的音乐目录，用方向键进行选择并按下回车进行播放。

多播放几个歌曲就会创建一个*播放列表*，让你可以使用 `>` 键（不是右箭头, 是右尖括号）移动到下一首，并使用 `<` 返回上一首。`+` 和 `–` 键可以调节音量。`Q` 键可以让你退出 `ncmpcpp` 但不停止播放音乐。你可以按下 `P` 来控制暂停和播放。

你可以按下 `1` 键来查看当前播放列表（这是默认的视图）。从这个视图中，你可以按 `i` 查看有关当前歌曲的信息（标签）。按 `6` 可更改当前歌曲的标签。

按 `\` 按钮将在视图顶部添加（或删除）信息面板。在左上角，你可以看到如下的内容： 

```
[------]
```

按下 `r`、`z`、`y`、`R`、`x` 将会分别切换到 `repeat`、`random`、`single`、`consume` 和 `crossfade` 等播放模式，并将这个小指示器中的 `–` 字符替换为选定模式。

按下 `F1` 键将会显示一些帮助文档，包含一系列的键绑定列表，因此无需在此处列出完整列表。所以继续吧！做一个极客，在你的终端上播放音乐！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/playing-music-on-your-fedora-terminal-with-mpd-and-ncmpcpp/

作者：[Carmine Zaccagnino][a]
选题：[lujun9972][b]
译者：[chai-yuan](https://github.com/chai-yuan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/carzacc/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/play_music_mpd-816x346.png
[2]: https://rpmfusion.org/Configuration
