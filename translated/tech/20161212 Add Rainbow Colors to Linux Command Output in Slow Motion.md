缓慢输出Linux命令并用彩色显示
============================================================

本篇中，我们会展示一个很酷及简单的方法在屏幕中显示彩色的输出，并且可以为了某个原因减慢输出的速度。

[lolcat命令][2]可以满足上面的需求。它基本上通过与[cat命令][3]类似的方式将文件或标准输入定向到标准输出来运行，覆盖特定命令的默认屏幕输出颜色，并为其添加彩色。

### 如何在Linux中安装lolcat程序

lolcat可以在大多数现在Linux发型版的默认仓库中得到，但是可用的版本有点老。你可以使用下面的指导来从git仓库中安装最新的lolcat版本。

1.  [安装lolcat来在Linux中显示彩色输出][1]

lolcat安装后，基本的lolcat语法是：

```
$ lolcat [options] [files] ...
```

有几个选项可以控制它的行为，下面是一些我们在本指导中会强调的几个最重要的标志：

1. `-a` - 将每行输出都显示动态效果。
2.  `-d` – 指定动画效果间隔（显示下一行之前的帧），默认是12。
3.  `-s` – 它指定了动画效果的速度（帧速-每秒的帧），默认是20。
4.  `-f` – 强制显示彩色防止标准输出不是tty。

你可以在lolcat的man页可以找到更多的选项：

```
$ man lolcat 
```

### 如何在Linux中使用lolcat

要使用lolcat，直接将相关命令的输出通过管道给lolcat，接着见证魔法。

比如:

```
$ ls -l | lolcat -as 25
```

[
 ![colorful Linux Terminal Output](http://www.tecmint.com/wp-content/uploads/2016/12/Colorful-Linux-Terminal-Output.gif) 
][4]

除此之外你可以改变默认速度，在下面的命令中，我们会使用一个相对较慢的速度，每秒显示10帧：

```
$ ls -l | lolcat -as 10
```

你可以使用任何命令结合lolcat在Linux终端中输出彩色结果，比如ps、date和cal：

```
$ ps | lolcat
$ date | lolcat
$ cal | lolcat
```

本篇中，我们了解了如何显著减小屏幕输出的速度，并显示彩色效果。

通常上，你可以在下面的评论栏中留下任何关于本篇的问题或评论。最后，你可以留下任何你发现的有用命令。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/add-colors-to-command-output-terminal-linux/

作者：[ Aaron Kili ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/lolcat-command-to-output-rainbow-of-colors-in-linux-terminal/
[2]:http://www.tecmint.com/lolcat-command-to-output-rainbow-of-colors-in-linux-terminal/
[3]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2016/12/Colorful-Linux-Terminal-Output.gif
