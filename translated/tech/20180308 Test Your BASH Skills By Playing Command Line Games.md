通过玩命令行游戏来测试你的 BASH 技能
=====


![](https://www.ostechnix.com/wp-content/uploads/2018/03/Test-your-bash-skills-1-720x340.png)

如果我们经常在实际场景中使用 Linux 命令，我们倾向于更有效的学习和记忆它们。除非你经常使用 Linux 命令，否则你可能会在一段时间内忘记它们。无论你是新手还是中级用户，总会有一些令人兴奋的方法来测试你的 BASH 技能。在本教程中，我将解释如何通过玩命令行游戏来测试你的 BASH 技能。其实从技术上讲，这些并不是真正的游戏，如 Super TuxKart，NFS 或 Counterstrike 等等。这些只是 Linux 命令培训课程的游戏化版本。你将根据游戏本身的某些指示来完成一个任务。

现在，我们将看到几款能帮助你实时学习和练习 Linux 命令的游戏。这些游戏不是消磨时间或者令人惊诧的，这些游戏将帮助你获得终端命令的真实体验。请继续阅读：

### 使用 “Wargames” 来测试 BASH 技能

这是一个在线游戏，所以你必须和互联网保持连接。这些游戏可以帮助你以充满乐趣的游戏形式学习和练习 Linux 命令。Wargames 是 shell 游戏的集合，每款游戏有很多关卡。只有通过解决先前的关卡才能访问下一个关卡。不要担心！每个游戏都提供了有关如何进入下一关的清晰简洁说明。

要玩 Wargames，请点击以下链接：

![][2]

如你所见，左边列出了许多 shell 游戏。每个 shell 游戏都有自己的 SSH 端口。所以，你必须通过本地系统配置 SSH 连接到游戏，你可以在 Wargames 网站的左上角找到关于如何使用 SSH 连接到每个游戏的信息。

例如，让我们来玩  **Bandit** 游戏吧。为此，单击 Wargames 主页上的 Bandit 链接。在左上角，你会看到 Bandit 游戏的 SSH 信息。

![][3]

正如你在上面的屏幕截图中看到的，有很多关卡。要进入每个关卡，请单机左侧列中的相应链接。此外，右侧还有适合初学者的说明。如果你对如何玩此游戏有任何疑问，请阅读它们。

现在，让我们点击它进入关卡 0。在下一个屏幕中，你将获得该关卡的 SSH 信息。

![][4]

正如你在上面的屏幕截图中看到的，你需要配置 SSH 端口 2220 连接 **bandit.labs.overthewire.org**，用户名是 **bandit0**，密码是 **bandit0**。

让我们连接到 Bandit 游戏关卡 0。

输入密码 **bandit0**

示例输出将是：

![][5]

登录后，输入 **ls** 命令查看内容或者进入 **关卡 1 页面**，了解如何通过关卡 1 等等。建议的命令列表已在每个关卡提供。所以，你可以选择和使用任何合适的命令来解决每个关卡。

我必须承认，Wargames 是令人上瘾的，并且解决每个关卡是非常有趣的。 尽管有些关卡确实很具挑战性，你可能需要谷歌才能知道如何解决问题。 试一试，你会很喜欢它。

### 使用 “Terminus” 来测试 BASH 技能

这是另一个基于浏览器的在线 CLI 游戏（译注：CLI 命令行界面），可用于改进或测试你的 Linux 命令技能。要玩这个游戏，请打开你的 web 浏览器并导航到以下 URL。

一旦你进入游戏，你会看到有关如何玩游戏的说明。与 Wargames 不同，你不需要连接到它们的游戏服务器来玩游戏。Terminus 有一个内置的 CLI，你可以在其中找到有关如何使用它的说明。

你可以使用命令 **“ls”** 查看周围的环境，使用命令 **“cd LOCATION”** 移动到新的位置，返回使用命令 **“cd ..”**，与这个世界进行交互使用命令 **“less ITEM”** 等等。要知道你当前的位置，只需输入 **“pwd”**。

![][6]

### 使用 “clmystery” 来测试 BASH 技能

与上述游戏不同，你可以在本地玩这款游戏。你不需要连接任何远程系统，这是完全离线的游戏。

相信我，这是一个有趣的游戏人。按照给定的说明，你将扮演一个侦探角色来解决一个神秘案件。

首先，克隆仓库：
```
$ git clone https://github.com/veltman/clmystery.git

```

或者，从 [这里][7] 将其作为 zip 文件下载。解压缩并切换到下载文件的地方。左后，通过阅读 “instructions” 文件来解决神秘案例。
```
[sk@sk]: clmystery-master>$ ls
cheatsheet.md cheatsheet.pdf encoded hint1 hint2 hint3 hint4 hint5 hint6 hint7 hint8 instructions LICENSE.md mystery README.md solution

```

这里是玩这个游戏的说明：

终端城发生了一起谋杀案，TCPD 需要你的帮助。你需要帮助它们弄清楚是谁犯罪了。

为了查明是谁干的，你需要到 **‘mystery’** 子目录并从那里开始工作。你可能需要查看犯罪现场的所有线索（ **‘crimescene’** 文件）。现场的警官相当谨慎，所以他们在警官报告中写下了一切。幸运的是，警官在所有的帽子里都用了 “CLUE” 一词，并把真正的线索标记了出来。

如果里遇到任何问题，请打开其中一个提示文件，例如 hint1，hint2 等。你可以使用下面的 cat 命令打开提示文件。
```
$ cat hint1

$ cat hint2

```

要检查你的答案或找出解决方案，请在 clmystery 目录中打开文件 “solution”。
```
$ cat solution

```

要开始如何使用命令行，请参阅 **cheatsheet.md** 或 **cheatsheet.pdf** （在命令行中，你可以输入 ‘nano cheatsheet.md’）。请勿使用文本编辑器查看除说明，备忘录和提示以外的任何文件。

有关更多详细信息，请参阅  [**clmystery GitHub**][8] 页面。

**推荐阅读：**

而这就是我现在所能记得的。如果将来遇到任何问题，我会继续添加更多游戏。将此链接加入书签并不时访问。如果你知道其他类似的游戏，请在下面的评论部分告诉我，我将测试和更新本指南。

还有更多好东西，敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/test-your-bash-skills-by-playing-command-line-games/

作者：[SK][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/03/Wargames-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/Bandit-game.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/Bandit-level-0.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/Bandit-level-0-ssh-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/Terminus.png
[7]:https://github.com/veltman/clmystery/archive/master.zip
[8]:https://github.com/veltman/clmystery
