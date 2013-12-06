ttyrec & ttyplay - Linux记录播放终端会话
================================================================================
有些时候你可能想要记录一个终端会话，也许是为了保存一个复杂的命令行操作为将来使用的参考，或者是为了知识分享。你可能也希望记录的文件尺寸尽可能的小一点，并且希望当播放记录文件时可以做一个快速回放。在这个文章中我们将讨论两个命令行工具（ **ttyrec** 和 **ttyplay** ）来让你记录、保存和播放终端会话。

### ttyrec & ttyplay ###

看名字就知道ttyrec命令是用来记录终端会话的，ttyplay是用来播放ttyrec记录的会话的。

这里是这些工具的man截图：

**> ttyrec**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ttyrec-main.png)

**> ttyplay**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ttyplay-main.png)

### 测试环境 ###

- 系统 – Ubuntu 13.04
- Shell – Bash 4.2.45
- 应用 – ttyrec 1.0.8-5 & ttyplay 1.0.8-5

### 简明教程 ###

下面告诉你怎么用这些命令来记录和播放一个终端会话。

**步骤-1**

开始记录一个终端会话，只需要运行下面的命令：

    $ ttyrec [文件名]

参数 **[文件名]** (上面显示的命令)是一个选项，可以指定你想要的任何名字。这个记录文件将会用这个名字保存下来。如果你没有指定一个文件名，ttyrec就会用 **ttyrecord** 作为缺省文件名。

**步骤-2**

当你想要记录的时候你就可以运行这个命令，就开始记录会话了。ttyrec命令甚至可以记录命令行类似vi，nano，emacs，lynx等这些命令行工具的会话。

**步骤-3**

到你想要结束终端会话的时候，只需要运行 **exit** 命令,这个会话记录就会结束。记录文件将会保存在当前文件夹下。

你可以运行下面的命令播放这个文件:

    $ ttyplay [文件名]

参数 **[文件名]** 就是记录文件名，就是上面通过 **ttyrec** 命令给定参数的那个名字。如果没有指定文件名，那么缺省文件名就是 **ttyrecord** 。

当你运行ttyplay，回放会话记录就会开始。这里给出一些当你回放会话的时候你可以用的快捷键。

- ‘+’或‘f’键可以加速到两倍正常播放速度。
- ‘-’或‘s’键可以减慢到一般正常播放速度。
- ‘0’可以暂停。
- ‘1’可以回到正常播放速度。

这有一些其它ttyrec和ttyplay命令支持的选项：

**> ttyrec**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ttyrec-1.png)

**> ttyplay**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ttyplay-1.png)

还有另一个小工具 **ttytime** 可以用来显示用ttyrec工具会话记录的时间。很容易使用并且只需要记录文件名作为命令行参数。

举一个例子：


    $ ttytime record_file 
    29    record_file

这样你就可以看到ttytime命令显示会话记录文件record_file的时间。

这有一个ttyrec和ttyplay命令的很有用的视频：

- [youtube video][1]

### 下载/安装/配置 ###

这有一些关于这些工具的重要的链接：

- [主页][2]
- [下载链接][3]

你可以使用任何命令行下载管理器比如apt-get或者yum来下载ttyrec，ttyplay和ttytime。Ubuntu用户也可以通过Ubuntu软件中心下载安装这些工具。

### 优点 ###

- 轻量级并且易用
- 可以记录多种流行的命令行工具比如vi，nano，lynx等
- 没有学习曲线。

### 缺点 ###

- 不能在IRIX6.4下工作（译注：这还算事吗？）
- 依赖终端尺寸
- 大多数Linux发行版没有预装。

### 结论 ###

如果你正在找一些Linux轻量级命令行工具用来记录播放终端会话，那么ttyrec和ttyplay是理想的工具。我真的喜欢使用它们带来的轻松。试一下这些工具，你不会失望的。

**你使用过ttyrec，ttyplay或者其它的终端记录/播放 工具？分享你的经历给我们吧。**

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/ttyrec-ttyplay-record-and-play-terminal-sessions-in-linux/

译者：[flsf](https://github.com/flsf) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.youtube.com/embed/7znzFsc0P8M?version=3&rel=1&fs=1&showsearch=0&showinfo=1&iv_load_policy=1&wmode=transparent
[2]:http://0xcc.net/ttyrec/
[3]:http://0xcc.net/ttyrec/
