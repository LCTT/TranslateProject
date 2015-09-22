在 Ubuntu 和 Elementary OS 上使用 NaSC 进行简单数学运算
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Make-Math-Simpler-with-NaSC.jpg)

[NaSC][1]，Not a Soulver Clone 的缩写，是为 elementary 操作系统开发的第三方应用程序。正如名字暗示的那样，NaSC 的灵感来源于 [Soulver][2]，后者是像普通人一样进行数学计算的 OS X 应用。

Elementary OS 它自己本身借鉴了 OS X，也就不奇怪它的很多第三方应用灵感都来自于 OS X 应用。

回到 NaSC，“像普通人一样进行数学计算”到底是什么意思呢？事实上，它意味着正如你想的那样去书写。按照该应用程序的介绍：

> “它能使你像平常那样进行计算。它允许你输入任何你想输入的，智能识别其中的数学部分并在右边面板打印出结果。然后你可以在后面的等式中使用这些结果，如果结果发生了改变，等式中使用的也会同样变化。”

还不相信？让我们来看一个截图。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/NaSC.png)

现在，你明白什么是 “像普通人一样做数学” 了吗？坦白地说，我并不是这类应用程序的粉丝，但对你们中的某些人可能会有用。让我们来看看怎么在 Elementary OS、Ubuntu 和 Linux Mint 上安装 NaSC。

### 在 Ubuntu、Elementary OS 和 Mint 上安装 NaSC ###

安装 NaSC 有一个可用的 PPA。PPA 是 ‘每日’，意味着每日构建（意即，不稳定），但作为我的快速测试，并没什么影响。

打开一个终端并运行下面的命令：

    sudo apt-add-repository ppa:nasc-team/daily
    sudo apt-get update
    sudo apt-get install nasc

这是 Ubuntu 15.04 中使用 NaSC 的一个截图：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/NaSC-Ubuntu.png)

如果你想卸载它，可以使用下面的命令：

    sudo apt-get remove nasc
    sudo apt-add-repository --remove ppa:nasc-team/daily

如果你试用了这个软件，要分享你的经验哦。除此之外，你也可以在第三方 Elementary OS 应用中体验 [Vocal podcast app for Linux][3]。

--------------------------------------------------------------------------------

via: http://itsfoss.com/math-ubuntu-nasc/

作者：[Abhishek][a]
译者：[ictlyh](http://www.mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://parnold-x.github.io/nasc/
[2]:http://www.acqualia.com/soulver/
[3]:http://itsfoss.com/podcast-app-vocal-linux/