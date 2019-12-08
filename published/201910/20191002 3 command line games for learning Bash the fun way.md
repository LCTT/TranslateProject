[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11448-1.html)
[#]: subject: (3 command line games for learning Bash the fun way)
[#]: via: (https://opensource.com/article/19/10/learn-bash-command-line-games)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Bash 学习的快乐之旅：3 个命令行游戏
======

> 通过这些命令行游戏，学习有用的 Bash 技能也是一件乐事。

![](https://attackofthefanboy.com/wp-content/uploads/2018/11/fallout-terminal-computer-hacking-guide.jpg)

学习是件艰苦的工作，然而没有人喜欢工作。这意味着无论学习 Bash 多么容易，它仍然对你来说就像工作一样。当然，除非你通过游戏来学习。

你不会觉得会有很多游戏可以教你如何使用 Bash 终端吧，这是对的。严肃的 PC 游戏玩家知道，《<ruby>辐射<rt>Fallout</rt></ruby>》系列在金库中配备了基于终端的计算机，这可以帮你理解通过文本与计算机进行交互是什么样子，但是尽管其功能或多或少地类似于 [Alpine][2] 或 [Emacs][3]，可是玩《辐射》并不会教给你可以在现实生活中使用的命令或应用程序。《辐射》系列从未直接移植到Linux（尽管可以通过 Steam 的开源的 [Proton][4] 来玩。）曾是《辐射》的前身的《<ruby>[废土][5]<rt>Wasteland</rt></ruby>》系列的最新作品倒是面向 Linux 的，因此，如果你想体验游戏中的终端，可以在你的 Linux 游戏计算机上玩《[废土 2][6]》和《[废土 3][7]》。《<ruby>[暗影狂奔][8]<rt>Shadowrun</rt></ruby>》系列也有面向 Linux 的版本，它有许多基于终端的交互，尽管公认 [hot sim][9] 序列常常使它黯然失色。

虽然这些游戏中采用了有趣的操作计算机终端的方式，并且可以在开源的系统上运行，但它们本身都不是开源的。不过，至少有两个游戏采用了严肃且非常有趣的方法来教人们如何通过文本命令与系统进行交互。最重要的是，它们是开源的。

### Bashcrawl

你可能听说过《<ruby>[巨洞探险][10]<rt>Colossal Cave Adventure</rt></ruby>》游戏，这是一款古老的基于文本的交互式游戏，其风格为“自由冒险”类。早期的计算机爱好者们在 DOS 或 ProDOS 命令行上痴迷地玩这些游戏，他们努力寻找有效语法和（如一个讽刺黑客所解释的）滑稽幻想逻辑的正确组合来击败游戏。想象一下，如果除了探索虚拟的中世纪地下城之外，挑战还在于回忆起有效的 Bash 命令，那么这样的挑战会多么有成效。这就是 [Bashcrawl][11] 的基调，这是一个基于 Bash 的地下城探险游戏，你可以通过学习和使用 Bash 命令来玩这个游戏。

在 Bashcrawl 中，“地下城”是以目录和文件的形式创建在你的计算机上的。你可以通过使用 `cd` 命令更改目录进入地下城的每个房间来探索它。当你[穿行目录][12]时，你可以用 [ls -F][13] 来查看文件，用 [cat][14] 读取文件，[设置变量][15]来收集宝藏，并运行脚本来与怪物战斗。你在游戏中所做的一切操作都是有效的 Bash 命令，你可以稍后在现实生活中使用它，玩这个游戏提供了 Bash 体验，因为这个“游戏”是由计算机上的实际目录和文件组成的。

```
$ cd entrance/
$ ls
cellar  scroll
$ cat scroll

It is pitch black in these catacombs.
You have a magical spell that lists all items in a room.

To see in the dark, type:     ls
To move around, type:         cd &lt;directory&gt;

Try looking around this room.
Then move into one of the next rooms.

EXAMPLE:

$ ls
$ cd cellar

Remember to cast ``ls`` when you get into the next room!
$
```

#### 安装 Bashcrawl

在玩 Bashcrawl 之前，你的系统上必须有 Bash 或 [Zsh][16]。Linux、BSD 和 MacOS 都附带了 Bash。Windows 用户可以下载并安装 [Cygwin][17] 或 [WSL][18] 或[试试 Linux][19]。

要安装 Bashcrawl，请在 Firefox 或你选择的 Web 浏览器中导航到这个 [GitLab 存储库][11]。在页面的右侧，单击“下载”图标（位于“Find file”按钮右侧）。在“下载”弹出菜单中，单击“zip”按钮以下载最新版本的游戏。

![Download a zip from Gitlab][20]

下载完成后，解压缩该存档文件。

另外，如果你想从终端中开始安装，则可以使用 [Git][21] 命令：

```
$ git clone https://gitlab.com/slackermedia/bashcrawl.git bashcrawl
```

#### 游戏入门

与你下载的几乎所有新的软件包一样，你必须做的第一件事是阅读 README 文件。你可以通过双击`bashcrawl` 目录中的 `README.md` 文件来阅读。在 Mac 上，你的计算机可能不知道要使用哪个应用程序打开该文件；你也可以使用任何文本编辑器或 LibreOffice 打开它。`README.md` 这个文件会具体告诉你如何开始玩游戏，包括如何在终端上进入游戏以及要开始游戏必须发出的第一条命令。如果你无法阅读 README 文件，那游戏就不战自胜了（尽管由于你没有玩而无法告诉你）。

Bashcrawl 并不意味着是给比较聪明或高级用户玩的。相反，为了对新用户透明，它尽可能地简单。理想情况下，新的 Bash 用户可以从游戏中学习 Bash 的一些基础知识，然后会偶然发现一些游戏机制，包括使游戏运行起来的简单脚本，并学习到更多的 Bash 知识。此外，新的 Bash 用户可以按照 Bashcrawl 现有内容的示例设计自己的地下城，没有比编写游戏更好的学习编码的方法了。

### 命令行英雄：BASH

Bashcrawl 适用于绝对初学者。如果你经常使用 Bash，则很有可能会尝试通过以初学者尚不了解的方式查看 Bashcrawl 的文件，从而找到胜过它的秘径。如果你是中高级的 Bash 用户，则应尝试一下 [命令行英雄：BASH][22]。

这个游戏很简单：在给定的时间内输入尽可能多的有效命令（LCTT 译注：BASH 也有“猛击”的意思）。听起来很简单。作为 Bash 用户，你每天都会使用许多命令。对于 Linux 用户来说，你知道在哪里可以找到命令列表。仅 util-linux 软件包就包含一百多个命令！问题是，在倒计时的压力下，你的指尖是否忙的过来输入这些命令？

![Command Line Heroes: BASH][23]

这个游戏听起来很简单，它确实也很简单！原则上，它与<ruby>闪卡<rt>flashcard</rt></ruby>相似，只是反过来而已。在实践中，这是测试你的知识和回忆的一种有趣方式。当然，它是开源的，是由 [Open Jam][24] 的开发者开发的。

#### 安装

你可以[在线][25]玩“命令行英雄：BASH”，或者你也可以从 [GitHub][26] 下载它的源代码。

这个游戏是用 Node.js 编写的，因此除非你想帮助开发该游戏，否则在线进行游戏就够了。

### 在 Bash 中扫雷

如果你是高级 Bash 用户，并且已经编写了多个 Bash 脚本，那么你可能不仅仅想学习 Bash。你可以尝试编写游戏而不是玩游戏，这才是真的挑战。稍加思考，用上一个下午或几个小时，便可以在 Bash 中实现流行的游戏《扫雷》。你可以先尝试自己编写这个游戏，然后参阅 Abhishek Tamrakar 的[文章][27]，以了解他如何完成该游戏的。

![][28]

有时编程没有什么目的而是为了教育。在 Bash 中编写的游戏可能不是可以让你在网上赢得声誉的项目，但是该过程可能会很有趣且很有启发性。面对一个你从未想到的问题，这是学习新技巧的好方法。

### 学习 Bash，玩得开心

不管你如何学习它，Bash 都是一个功能强大的界面，因为它使你能够指示计算机执行所需的操作，而无需通过图形界面的应用程序的“中间人”界面。有时，图形界面很有帮助，但有时你想离开那些已经非常了解的东西，然后转向可以快速或通过自动化来完成的事情。由于 Bash 基于文本，因此易于编写脚本，使其成为自动化作业的理想起点。

了解 Bash 以开始走向高级用户之路，但是请确保你乐在其中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/learn-bash-command-line-games

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_maze.png?itok=mZ5LP4-X (connecting yellow dots in a maze)
[2]: https://opensource.com/article/17/10/alpine-email-client
[3]: http://www.gnu.org/software/emacs
[4]: https://github.com/ValveSoftware/Proton/
[5]: https://www.gog.com/game/wasteland_the_classic_original
[6]: https://www.inxile-entertainment.com/wasteland2
[7]: https://www.inxile-entertainment.com/wasteland3
[8]: http://harebrained-schemes.com/games/
[9]: https://forums.shadowruntabletop.com/index.php?topic=21804.0
[10]: https://opensource.com/article/18/12/linux-toy-adventure
[11]: https://gitlab.com/slackermedia/bashcrawl
[12]: https://opensource.com/article/19/8/understanding-file-paths-linux
[13]: https://opensource.com/article/19/7/master-ls-command
[14]: https://opensource.com/article/19/2/getting-started-cat-command
[15]: https://opensource.com/article/19/8/using-variables-bash
[16]: https://opensource.com/article/19/9/getting-started-zsh
[17]: https://www.cygwin.com/
[18]: https://docs.microsoft.com/en-us/windows/wsl/wsl2-about
[19]: https://opensource.com/article/19/7/ways-get-started-linux
[20]: https://opensource.com/sites/default/files/images/education/screenshot_from_2019-09-28_10-49-49.png (Download a zip from Gitlab)
[21]: https://opensource.com/life/16/7/stumbling-git
[22]: https://www.redhat.com/en/command-line-heroes/bash/index.html?extIdCarryOver=true&sc_cid=701f2000001OH79AAG
[23]: https://opensource.com/sites/default/files/uploads/commandlineheroes-bash.jpg (Command Line Heroes: BASH)
[24]: http://openjam.io/
[25]: https://www.redhat.com/en/command-line-heroes/bash/index.html
[26]: https://github.com/CommandLineHeroes/clh-bash/
[27]: https://linux.cn/article-11430-1.html
[28]: https://opensource.com/sites/default/files/uploads/extractmines.png
