[#]: subject: "Change your Linux Desktop Wallpaper Every Hour [Here’s How]"
[#]: via: "https://www.debugpoint.com/2021/08/change-wallpaper-every-hour/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13701-1.html"

如何每小时改变你的 Linux 桌面壁纸
======

![](https://img.linux.net.cn/data/attachment/album/202108/19/223054ga6b8a8paa61u31u.jpg)

这个 shell 脚本 `styli.sh` 可以帮助你每小时自动改变你的 Linux 桌面壁纸，并且有几个选项。

用一张漂亮的壁纸来开始你的一天，你的桌面让人耳目一新。但寻找壁纸，然后保存，最终设置为壁纸，是非常麻烦的。所有这些步骤都可以通过这个叫做 [styli.sh][1] 的脚本完成。

### styli.sh - 每小时改变你的 Linux 桌面壁纸

这是一个 shell 脚本，你可以从 GitHub 上下载。当运行时，它从 Reddit 的热门版块中获取壁纸并将其设置为你的壁纸。

该脚本适用于所有流行的桌面环境，如 GNOME、KDE Plasma、Xfce 和 Sway 窗口管理器。

它有很多功能，你可以通过 crontab 来运行这个脚本，并在特定的时间间隔内得到一张新的壁纸。

### 下载并安装、运行

打开一个终端，并克隆 GitHub 仓库。如果没有安装的话，你需要安装 [feh][2] 和 git。

```
git clone https://github.com/thevinter/styli.sh
cd styli.sh
```

要设置随机壁纸，根据你的桌面环境运行以下内容。

![Change your Linux Desktop Wallpaper Every Hour using styli.sh][3]

GNOME：

```
./styli.sh -g
```

Xfce：

```
./styli.sh -x
```

KDE Plasma：

```
./styli.sh -k
```

Sway：

```
./styli.sh -y
```

### 每小时改变一次

要每小时改变背景，请运行以下命令：

```
crontab -e
```

并在打开的文件中加入以下内容。不要忘记改变脚本路径。

```
@hourly script/path/styli.sh
```

### 改变版块

在源目录中，有一个名为 `subreddits` 的文件。它填满了一些标准的版块。如果你想要更多一些，只需在文件末尾添加版块名称。

### 更多配置选项

壁纸的类型、大小，也可以设置。以下是这个脚本的一些独特的配置选项。

设置一个随机的 1920×1080 背景：

```
./styli.sh
```

指定一个所需的宽度或高度：

```
./styli.sh -w 1080 -h 720
./styli.sh -w 2560
./styli.sh -h 1440
```

根据搜索词设置壁纸：

```
./styli.sh -s island
./styli.sh -s “sea sunset”
./styli.sh -s sea -w 1080
```

从设定的一个版块中获得一个随机壁纸：

注意：宽度/高度/搜索参数对 reddit 不起作用。

```
./styli.sh -l reddit
```

从一个自定义的版块获得随机壁纸：

```
./styli.sh -r
./styli.sh -r wallpaperdump
```

使用内置的 `feh -bg` 选项：

```
./styli.sh -b
./styli.sh -b bg-scale -r widescreen-wallpaper
```

添加自定义的 feh 标志：

```
./styli.sh -c
./styli.sh -c –no-xinerama -r widescreen-wallpaper
```

自动设置终端的颜色：

```
./styli.sh -p
```

使用 nitrogen 而不是 feh：

```
./styli.sh -n
```

使用 nitrogen 更新多个屏幕：

```
./styli.sh -n -m
```

从一个目录中选择一个随机的背景：

```
./styli.sh -d /path/to/dir
```

### 最后说明

这是一个独特且方便的脚本，内存占用小，可以直接在一个时间间隔内比如一个小时获取图片。让你的桌面看起来 [新鲜且高效][4]。如果你不喜欢这些壁纸，你可以简单地从终端再次运行脚本来循环使用。

你喜欢这个脚本吗？或者你知道有什么像这样的壁纸切换器吗？请在下面的评论栏里告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/change-wallpaper-every-hour/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://github.com/thevinter/styli.sh
[2]: https://feh.finalrewind.org/
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/Change-your-Linux-Desktop-Wallpaper-Every-Hour-using-styli.sh_.jpg
[4]: https://www.debugpoint.com/category/themes