如何在 Linux 上录制你的终端操作
=================================================

录制一个终端操作可能是一个帮助他人学习 Linux 、展示一系列正确命令行操作的和分享知识的通俗易懂方法。不管是出于什么目的，从终端复制粘贴文本需要重复很多次，而录制视频的过程也是相当麻烦，有时候还不能录制。在这次的文章中，我们将简单的了解一下以 gif 格式记录和分享终端会话的方法。

### 预先要求

如果你只是希望能记录你的终端会话，并且能在终端进行回放或者和他人分享，那么你只需要一个叫做：ttyrec 的软件。Ubuntu 用户可以通过运行这行代码进行安装：

```
sudo apt-get install ttyrec
```

如果你想将生成的视频转换成一个 gif 文件，这样能够和那些不使用终端的人分享，就可以发布到网站上去，或者你只是想做一个 gif 方便使用而不想写命令。那么你需要安装额外的两个软件包。第一个就是 imagemagick , 你可以通过以下的命令安装：

```
sudo apt-get install imagemagick
```

第二个软件包就是：tty2gif.py，访问其[项目网站][1]下载。这个软件包需要安装如下依赖:

```
sudo apt-get install python-opster
```

### 录制

开始录制终端操作，你需要的仅仅是键入 `ttyprec` ，然后回车。这个命令将会在后台运行一个实时的记录工具。我们可以通过键入`exit`或者`ctrl+d`来停止。ttyrec 默认会在主目录下创建一个`ttyrecord`的文件。

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_1.jpg)

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_2.jpg)

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_3.jpg)

### 回放

回放这个文件非常简单。你只需要打开终端并且使用 `ttyplay` 命令打开 `ttyrecord` 文件即可。(在这个例子里，我们使用 ttyrecord 作为文件名，当然，你也可以改成你用的文件名)

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_4.jpg)

然后就可以开始播放这个文件。这个视频记录了所有的操作，包括你的删除，修改。这看起来像一个拥有自我意识的终端，但是这个命令执行的过程并不是只是为了给系统看，而是为了更好的展现给人。

注意一点，播放这个记录是完全可控的，你可以通过点击 `+` 或者 `-` 进行加速减速，或者 `0`和 `1` 暂停和恢复播放。

### 导出成 GIF

为了方便，我们通常会将视频记录转换为 gif 格式，并且，这个非常容易做到。以下是方法：

将之前下载的 tty2gif.py 这个文件拷贝到 ttyprecord 文件（或者你命名的那个视频文件）相同的目录，然后在这个目录下打开终端，输入命令：

```
python tty2gif.py typing ttyrecord
```

如果出现了错误，检查一下你是否有安装 python-opster 包。如果还是有错误，使用如下命令进行排除。

```
sudo apt-get install xdotool
export WINDOWID=$(xdotool getwindowfocus)
```

然后重复这个命令 `python tty2gif.py` 并且你将会看到在 ttyrecord 目录下多了一些 gif 文件。

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_5.jpg)

接下来的一步就是整合所有的 gif 文件，将他打包成一个 gif 文件。我们通过使用 imagemagick 工具。输入下列命令:

```
convert -delay 25 -loop 0 *.gif example.gif
```

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_6.jpg)

你可以使用任意的文件名，我用的是 example.gif。 并且，你可以改变这个延时和循环时间。 Enjoy。

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/example.gif)

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-record-your-terminal-session-on-linux/

作者：[Bill Toulas][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/howtoforgecom
[1]: https://bitbucket.org/antocuni/tty2gif/raw/61d5596c916512ce5f60fcc34f02c686981e6ac6/tty2gif.py








