如何在 Linux 上录制你的终端操作
=================================================

录制一次终端操作可能是一个帮助他人学习 Linux 、展示一系列正确命令行操作的和分享知识的通俗易懂方法。不管是什么目的，大多数情况下从终端复制粘贴文本从终端不会是很有帮助而且录制视频的过程也是相当困难。在这次的文章中，我们将简单的了解一下在终端会话中用 GIF 格式录制视频的方法。

### 预先要求

如果你只是希望能记录你的终端会话，并且能在终端进行播放或者和他人分享，那么你只需要一个叫做：'ttyrec' 的软件。Ubuntu 使用者可以通过运行这行代码进行安装:

```
sudo apt-get install ttyrec
```

如果你想将生成的视频转换成一个 GIF 文件，并且能够和那些希望发布在网站上或者不使用终端或者只是简单的想保留一个 GIF 的用户分享。那么你需要安装额外的两个软件包。第一个就是'imagemagick', 你可以通过以下的命令安装：

```
sudo apt-get install imagemagick
```

第二个软件包就是:'tty2gif'，你可以从这里下载。这个软件包需要安装如下依赖:

```
sudo apt-get install python-opster
```

### 录制

开始录制中毒啦操作，你需要的仅仅是键入'ttyprec' + 回车。这个命令将会在后台运行一个实时的记录工具。我们可以通过键入'exit'或者'ctrl+d'来停止。ttyrec 默认会在'Home'目录下创建一个'ttyrecord'的文件。

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_1.jpg)

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_2.jpg)

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_3.jpg)

### 播放

播放这个文件非常简单。你只需要打开终端并且使用 'ttyplay' 命令打开 'ttyrecord' 文件即可。(在这个例子里，我们使用 ttyrecord 作为文件名，当然，你也可以对这个文件进行重命名)

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_4.jpg)

然后就可以开始播放这个文件。这个视频记录了所有的操作，包括你的删除，修改。这看起来想一个拥有自我意识的终端，但是这个命令执行的过程并不是只是为了给系统看，而是为了更好的展现给人。

注意的一点，播放这个记录是完全可控的，你可以通过点击 '+' 或者 '-' 或者 '0', 或者 '1' 按钮加速、减速、暂停、和恢复播放。

### 导出成 GIF

为了方便，我们通常会将视频记录转换为 GIF 格式，并且，这个也非常方便可以实现。以下是方法:

首先，解压这个文件 'tty2gif.tar.bz2'：

```
tar xvfj tty2gif.tar.bz2
```

然后，将 'tty2gif.py' 这个文件拷贝到 'ttyprecord' 文件同目录(或者你命名的那个视频文件), 然后在这个目录下打开终端，输入命令：

```
python tty2gif.py typing ttyrecord
```

如果你出现了错误，检查一下你是否有安装 'python-opster' 包。如果还是有错误，使用如下命令进行排除。

```
sudo apt-get install xdotool
export WINDOWID=$(xdotool getwindowfocus)
```

然后重复这个命令 'python tty2gif.py' 并且你将会看到在 ttyrecord 目录下多了一大串的 gif 文件。

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_5.jpg)

接下来的一步就是整合所有的 gif 文件，将他打包成一个 GIF 文件。我们通过使用 imagemagick 工具。输入下列命令:

```
convert -delay 25 -loop 0 *.gif example.gif
```

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/pic_6.jpg)

你可以任意的文件名，我喜欢用 'example.gif'。 并且，你可以改变这个延时和循环时间。 Enjoy.

![](https://www.howtoforge.com/images/how-to-record-your-terminal-session-on-linux/example.gif)

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-record-your-terminal-session-on-linux/

作者：[Bill Toulas][a]
译者：[译者ID](https://github.com/MikeCoder)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/howtoforgecom









