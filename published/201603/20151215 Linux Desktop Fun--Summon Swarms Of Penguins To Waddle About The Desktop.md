Linux/Unix 桌面趣事：召唤一群企鹅在桌面上行走
================================================================================
XPenguins 是一个在窗口播放可爱动物动画的程序。默认情况下，将会从屏幕上方掉落企鹅，沿着你的窗口顶部行走，在窗口漂浮起来，踩上滑板，和做其他类似的有趣的事情。现在，你可以把这些可爱的小企鹅大军入侵别人的桌面了。

### 安装XPenguins ###

打开终端（选择程序->附件->终端），接着输入下面的命令来安装 XPenguins。首先，输入 `apt-get update` 通过请求配置的仓库刷新包的信息，接着安装需要的程序：

    $ sudo apt-get update
    $ sudo apt-get install xpenguins

### 我本地如何启动 XPenguins？ ###

输入下面的命令：

    $ xpenguins

示例输出：

![An army of cute little penguins invading the screen](http://files.cyberciti.biz/uploads/tips/2011/07/Workspace-1_002_12_07_2011.png)

*一支可爱企鹅军队正在入侵屏幕。*

![Linux: Cute little penguins walking along the tops of your windows](http://files.cyberciti.biz/uploads/tips/2011/07/Workspace-1_001_12_07_2011.png)

*可爱的小企鹅沿着窗口的顶部行走。*

![Xpenguins Screenshot](http://files.cyberciti.biz/uploads/tips/2011/07/xpenguins-screenshot.jpg)

*Xpenguins 截图*

移动窗口时小心点，小家伙们很容易被压坏。如果你发送中断程序（Ctrl-C），它们会爆炸。

### 主题 ###

要列出主题，输入：

    $ xpenguins -l

示例输出：

    Big Penguins
    Bill
    Classic Penguins
    Penguins
    Turtles

你可以用下面的命令使用其他的主题：

    $ xpenguins --theme "Big Penguins" --theme "Turtles"

你可以用下面的命令安装额外的主题：

    $ cd /tmp
    $ wget http://xpenguins.seul.org/xpenguins_themes-1.0.tar.gz
    $ tar -zxvf xpenguins_themes-1.0.tar.gz
    $ mkdir ~/.xpenguins
    $ mv -v themes ~/.xpenguins/
    $ xpenguins -l

示例输出：

    Lemmings
    Sonic the Hedgehog
    The Simpsons
    Winnie the Pooh
    Worms
    Big Penguins
    Bill
    Classic Penguins
    Penguins
    Turtles

已一个随机主题开始，输入：

    $ xpenguins --random-theme

要加载所有的主题并且同时运行，输入：

    $ xpenguins --all

更多链接何信息：

- [XPenguins][1] 主页。
- man penguins
- 更多 Linux/Unix 桌面乐趣在[蒸汽火车][2]和[终端ASCII水族馆][3]。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/tips/linux-cute-little-xpenguins-walk-along-tops-ofyour-windows.html

作者：Vivek Gite
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://xpenguins.seul.org/
[2]:http://www.cyberciti.biz/tips/displays-animations-when-accidentally-you-type-sl-instead-of-ls.html
[3]:http://www.cyberciti.biz/tips/linux-unix-apple-osx-terminal-ascii-aquarium.html


