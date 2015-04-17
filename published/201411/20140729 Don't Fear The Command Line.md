不要害怕命令行——Mac OS 篇
================================================================================
![](http://a4.files.readwrite.com/image/upload/c_fill,h_900,q_70,w_1600/MTE5NTU2MzIyNTM0NTg5OTYz.jpg)

> 接纳你电脑上最有用的工具。

你应该在电影中见到过，尽管从没在自己电脑上调出来：一个空白屏幕，带有一些简单文字提示和一个光标，等着你去输入几个神秘的命令，就会听你的吩咐。

这就是命令行。它是基于字符的接口，它比现在人们都熟悉的主流操作系统（包括Windows到Mac OS X和Linux）上的窗口，图标和`瓦片 tiles`都要早。

命令行是一个使用你电脑基本功能的超级强大的工具。对于大多数人来说，它也是一个让人困惑的，难以理解的，看上去无关紧要的东西。但是其实不是这样的。

### 在你的命令控制下的电脑 ###

输入字符指令再敲下回车来让电脑做点事情，和在移动设备的触摸界面上滑动点击比较，听起来像是退了一大步。即使是刚学走路的小孩都可以用iPad，对吧？不过，如果你知道怎么用的话，命令可以节省你的时间，减少烦恼。

如果你很认真想学习编程-或者想理解计算机技术-你完全有必要掌握命令行。

深入到命令行里，将教会你很多关于电脑如何工作以及管理信息的。你也许会发现有些平常使用鼠标操作的功能，当改为敲一两个命令后，实际上会更快。

更重要的是，你会更容易理解[像Python那样的编程语言][1]和[像Git那样的软件][2]，需要有一点命令行基础。在熟悉了命令行以后，你就可以打破过去阻止你学习编程的障碍了。

所以在这里介绍一点关于命令行的快速的、基础的指导。它**主要专注于Mac OS X的类Unix环境**，只是因为这是我比较熟悉的。Linux用户应该已经很熟悉命令行了，不过新手也许还是会觉得这些小窍门有点用。如果你用的是Chromebook，Google对如何打开它自带的[命令行工具][3]已经给出了有用的指导，它和Mac或Linux系统有点类似。对于Windows用户，很不幸，受限于从MS-DOS衍生出的命令语言，它和Unix只有一点点交集，所以这篇指导对你没什么用；不过可以去看下[dosprompt.info网站里的资料][4]。

### 如何开始 ###

你需要做的第一件事是搞清楚如何进入命令行，通常这是通过一个叫“shell”的软件来做的。在任意一台运行OS X的Mac上，需要启动终端应用。你可以通过Finder来打开（它是在应用程序下的实用工具目录里），或者点击屏幕右上角的放大镜然后输入“terminal”，然后在下拉列表里选择。

![](http://a4.files.readwrite.com/image/upload/c_fit,w_630/MTE4MDAzNDE2ODYxMjc5NzU4.png)

你进来了，但是所有你看到的只是一个有输入空间的空白盒子。这就是命令行！让我们来更好地了解一下这个窗口。

输入`pwd`，它的意思是打印当前工作目录。在计算机语言里，“打印”什么和纸没一点关系。它实际上只是意味着吐点东西到屏幕上。这个命令运行的结果是让计算机返回你当前正处在的目录路径。（LCTT 译注，“打印”源于早期计算机的输出设备不是显示器，而是行式打印机，所以输出就是“打印”；在后期，有了显示器之后，在哑终端上操作远程主机时，输出才是“回显 echo”）

![](http://a4.files.readwrite.com/image/upload/c_fit,w_630/MTIyMzk5Mjg5MDMzMjYyNjA0.png)

实际上，`/Users/laurenorsini`是我的主目录。高级提示：你可以使用波浪符(~)作为自己主目录的简写 - 它和`/Users/你的用户名`是一样的。比如，你可以像`~/Downloads`这样引用你的下载目录。（如果你仔细看前面的命令提示，你会发现那里有一个波浪符。这说明我当前正在自己的主目录下。）

我们肯定不希望我们的命令行试验把自己的主目录弄的一团糟，所以让我通过`mkdir`命令来创建一个新目录。这和在桌面操作系统里创建一个新目录是一样的。让我们把它叫做“experiments”：

![](http://a4.files.readwrite.com/image/upload/c_fit,w_630/MTE5NDg0MDYxMTMwODUxODU1.png)

现在我们有一个新目录了。如果使用图形界面的话，我们可以用自己的眼睛判断我们已经创建了一个新目录。当然，如果我打开Finder然后进入我的主目录（用一个小房子图标标记的）就会看到一个叫“experiments”的目录。我通过命令行实现的！（反过来：你可以在桌面系统里建立一个文件夹，然后在命令行下去查看。这只是同一套系统的两种不同表现方式。）

![](http://a5.files.readwrite.com/image/upload/c_fit,w_630/MTE5NTU2MzIyNTM0MzI3ODE5.png)

现在我需要通过**cd**（改变路径）命令改变路径进入到`~/experiments`目录中

![](http://a5.files.readwrite.com/image/upload/c_fit,w_630/MTE5NDg0MDYxMTMxMTEzOTk5.png)

我的命令提示是系统默认设定，所以它自动显示我当前的工作目录。但是如果你的看起来不一样的话，这样可以让你确定“experiments”是当前工作目录：再一次输入**pwd**。它应该会告诉你当前工作目录是“experiments”。

### 建立存档 ###

在写代码的每一天里我都通过命令行创建和编辑文件。它比使用图形用户界面更快是因为我可以在编辑完后马上就在命令行里测试我的程序。如果我正好同时需要推送到[GitHub][5]的话，好吧，那就更方便了。

现在你有一个新目录（也可以叫做仓库或文件夹）在你电脑上用来折腾。让我们从创建一个包含“你好世界”这句话的文件开始吧。有[很多种方式][6]，在这里我用了**echo**命令。

![](http://a2.files.readwrite.com/image/upload/c_fit,w_630/MTE5NDg0MDYxMjQxMjgwMDE1.png)

哦不！我拼错“newfile”了。这经常会碰到。让我们用两个步骤来改正它。首先，我将创建一个拼写正确的文件...（LCTT 译注：完全不必创建新文件，直接 mv 即可，相当于改名。）

![](http://a3.files.readwrite.com/image/upload/c_fit,w_630/MTIxNDI3Mjk0MjA5ODAzNzg5.png)

然后，我讲使用**mv**（移动）命令把拼写错误的就文件替换成我的新文件。通常都是这样，“**mv 旧文件 新文件**”。

![](http://a1.files.readwrite.com/image/upload/c_fit,w_630/MTIxNDI3Mjk0MjA5NzM4MjUz.png)

关于**mv**要注意的：跟大多数命令一样，它是一个容易误导的强大命令。当我们“移动”`newfil.txt`到`newfile.txt`的时候，实际上会把第一个文件完全覆盖到第二个文件上。这样我写到newfile.txt里的内容将彻底消失，替换成我写到newfil.txt里的内容。

为了证明我的目录下只有一个文件，可以使用**ls**，清单命令，来获得目录下的所有文件清单。

![](http://a1.files.readwrite.com/image/upload/c_fit,w_630/MTIxNDI3Mjk0MTA3NTAyMDkz.png)

看到了没？只有一个。然后如果我在图形界面下看下这个目录的话，也可以看到这个文件。

![](http://a3.files.readwrite.com/image/upload/c_fit,w_630/MTIyMzk5Mjg5MDM4OTY0MjM2.png)

但是，它只是个空白文本文件（LCTT 译注，不是空白的，其内容是“Hello World”）。让我们用文本编辑器来输入点内容进去。在命令行下，我喜欢用`nano`编辑器，因为它很简单而且几乎在所有类型电脑上都可以使用。（LCTT 译注，作为 Linux 党，那肯定是要用 vi 的，不过 vi 对于初学者来说有一点点难。）

这会在你的命令行窗口中马上打开编辑屏幕。一些基本的命令都为你列出来了。

![](http://a3.files.readwrite.com/image/upload/c_fit,w_630/MTIyMzk5Mjg5MDM5NjE5NTk2.png)

写下你想说的话，然后通过CTRL + X退出。在它问你是否保存的时候，当然键入"Y"。

![](http://a4.files.readwrite.com/image/upload/c_fit,w_630/MTIxNDI3Mjk0MTA4MDkxOTE3.png)

你也许已经猜到了，也可以在操作系统中用鼠标找到newfile.txt文件看到这些改动。这里你可以用任意喜欢的文本编辑器打开编辑这个你创建的文件。

如果你想永远删除这个文件，可以用**rm**（移除）命令：

![](http://a2.files.readwrite.com/image/upload/c_fit,w_630/MTE5NTU2MzIyNTQxMzQwMTcx.png)

注意一下，**rm**命令非常强大！在黑客论坛里有个[常用伎俩][7]就是说服一个命令行新手输入**rm -rf /**，然后他就把自己整个电脑上的所有文件都删掉了。命令里的“/”意思是电脑的最高级根目录-所有一切都在它之下。千万不要输入那行命令！（LCTT 译注：希望你在看完这句话之前没有真的输入了 rm -rf / !!!）

### 延伸阅读 ###

这只是无限可能的命令行的一个开始。你可以使用这个工具控制电脑的每一个方面，这也使得它强大的同时也很危险。保证在使用它们之前先看一下命令行提示，然后永远不要盲目输入任何陌生人推荐给你的语句。

我已经大概介绍了平时敲代码时常用的几个命令，但是有比这更多的理由去掌握命令行。如果你想更彻底地了解，也许可以试试：

[命令行速成教程][8]。一套免费的扩展课程，涵盖了命令行应用的基础。

[命令行初学者启蒙][9]。Lifehacker收藏的一些适合初学者的很有用的命令。

[Mac OS X 命令行入门][10]。在线教育网站Treehouse极尽详细地介绍了命令行的基础。

现在文章看完了，你就更容易理解我之前写的那些代码教程了，因为如果不敲几个命令根本没法完成。如果你准备好了，我建议你去看看ReadWrite的[Git教程][11]，它使用命令行来向你介绍协同编程。计算与你同在！

*题图来自[Jason Scott][12]；其他屏幕截图由Lauren Orsini提供给ReadWrite*

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/07/18/command-line-tutorial-intro

作者：[Lauren Orsini][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://readwrite.com/author/lauren-orsini
[1]:http://readwrite.com/2014/07/08/what-makes-python-easy-to-learn
[2]:http://readwrite.com/2013/09/30/understanding-github-a-journey-for-beginners-part-1
[3]:http://www.chromium.org/chromium-os/poking-around-your-chrome-os-device
[4]:http://dosprompt.info/
[5]:http://www.github.com/
[6]:http://www.cyberciti.biz/faq/unix-create-file-from-terminal-window-shell-prompt/
[7]:http://www.urbandictionary.com/define.php?term=rm+-rf+%2F
[8]:http://cli.learncodethehardway.org/book/
[9]:http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything
[10]:http://blog.teamtreehouse.com/introduction-to-the-mac-os-x-command-line
[11]:http://readwrite.com/2013/09/30/understanding-github-a-journey-for-beginners-part-1
[12]:http://en.wikipedia.org/wiki/Computer_terminal#mediaviewer/File:DEC_VT100_terminal.jpg
