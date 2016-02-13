与 Linux 一起学习：学习打字
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-featured.png)

[与 Linux 一起学习][1]的所有文章：

- [与 Linux 一起学习：学习打字][2]
- [与 Linux 一起学习：物理模拟][3]
- [与 Linux 一起学习：玩音乐][4]
- [与 Linux 一起学习：两款地理软件][5]
- [与 Linux 一起学习: 使用这些 Linux 应用来征服你的数学学习][6]

Linux 提供大量的教学软件和工具，面向各个年级以及不同年龄段，提供大量学科的练习实践，其中大多数是可以与用户进行交互的。本“与 Linux 一起学习”系列就来介绍一些教学软件。

很多人都要打字，操作键盘已经成为他们的第二天性。但是这些人中有多少是依然使用两个手指头来快速地按键盘的？即使学校有教我们使用键盘的方法，我们也会慢慢地抛弃正确的打字姿势，养成只用两个大拇指玩键盘的习惯。（LCTT 译注：呃，你确认是拇指而不是食指？）

下面要介绍的两款软件可以帮你掌控你的键盘，然后你就可以让你的手指跟上你的思维，这样你的思维就不会被打断了。当然，还有很多更炫更酷的软件可供选择，但本文所选的这两款是最简单、最容易上手的。

### TuxType （或者叫 TuxTyping） ###

TuxType 是给小孩子玩的。在一些有趣的游戏中，小学生们可以通过完成一些简单的练习来 Get “双手打字以示清白”的新技能。

Debian 及其衍生版本（包含所有 Ubuntu 衍生版本）的标准软件仓库都有 TuxType，使用下面的命令安装：

    sudo apt-get install tuxtype

软件开始时有一个简单的 Tux 界面和一段难听的 midi 音乐，幸运的是你可以通过右下角的喇叭按钮把声音调低了。(LCTT 译注：Tux 就是那只 Linux 吉祥物，Linus 说它的表情被设计成刚喝完啤酒后的满足感，见《Just For Fun》。)

![learntotype-tuxtyping-main](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-tuxtyping-main.jpg)

最开始处的两个选项“Fish Cascade”和“Comet Zap”是打字游戏，当你开始游戏时，你就投入到了这个课程。

第3个选项为“Lessions”,提供40多个简单的课程，每个课程会增加一个字母让你来练习，练习过程中会给出一些提示，比如应该用哪个手指按键盘上的字母。

![learntotype-tuxtyping-exd1](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-tuxtyping-exd1.jpg)

![learntotype-tuxtyping-exd2](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-tuxtyping-exd2.jpg)

更高级点的，你可以练习输入句子。不知道为什么，句子练习被放在“Options”选项里。（LCTT 译注：句子练习第一句是“The quick brown fox jumps over the lazy dog”，包含了26个英文字母，可用于检测键盘是否坏键，也是练习英文打字的必备良药啊。）

![learntotype-tuxtyping-phrase](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-tuxtyping-phrase.jpg)

这个游戏让玩家打出单词来帮助 Tux 吃到小鱼或者干掉掉下来的流星，训练速度和精确度。

![learntotype-tuxtyping-fish](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-tuxtyping-fish.jpg)

![learntotype-tuxtyping-zap](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-tuxtyping-zap.jpg)

除了练习有趣外，这些游戏还可以训练玩家的拼写、速度、手眼配合能力，因为你如果认真在玩的话，必须盯着屏幕，不看键盘打字。

### GNU typist (gtype) ###

对于成年人或有打字经验的人来说，GNU Typist 可能更合适，它是一个 GNU 项目，基于控制台操作。

GNU Typist 也在大多数 Debian 衍生版本的软件库中，运行下面的命令来安装：

    sudo apt-get install gtype

你估计不能在应用菜单里找到它，只能在终端界面上执行下面的命令来启动：

    gtype

界面简单，没有废话，直接提供课程内容，玩家选择就是了。

![learntotype-gtype-main](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-main.png)

课程直截了当，内容详细。

![learntotype-gtype-lesson](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-lesson.png)

在交互练习的过程中，如果你输入错误，会将错误位置高亮显示。不会像其他漂亮界面分散你的注意力，你可以专注于练习。每个课程的右下角都有一组统计数据来展示你的表现，如果你犯了很多错误，就可能无法通过关卡了。

![learntotype-gtype-mistake](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-mistake.png)

简单练习只需要你重复输入一些字符，而高阶练习需要你输入整个句子。

![learntotype-gtype-warmup](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-warmup.png)

下图的错误已经超过 3%，错误率太高了，你得降低些。

![learntotype-gtype-warmupfail](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-warmupfail.png)

一些训练用于完成特殊目标，比如“平衡键盘训练（LCTT 译注：感觉是用来练习手感的）”。

![learntotype-gtype-balanceddrill](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-balanceddrill.png)

下图是速度练习。

![learntotype-gtype-speed-simple](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-speed-simple.png)

下图是要你输入一段经典文章。

![learntotype-gtype-speed-advanced](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-speed-advanced.png)

如果你想练习其他语种，操作一下命令行参数就行。

![learntotype-gtype-more-lessons](https://www.maketecheasier.com/assets/uploads/2015/07/learntotype-gtype-more-lessons.png)

### 总结 ###

如果你想练练自己的打字水平，Linux 上有很多软件给你用。本文介绍的两款软件界面简单但内容丰富，能满足绝大多数打字爱好者的需求。如果你正在使用、或者听说过其他的优秀打字练习软件，请在评论栏贴出来，让我们长长姿势。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/learn-to-type-in-linux/

作者：[Attila Orosz][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/
[1]:https://www.maketecheasier.com/series/learn-with-linux/
[2]:https://www.maketecheasier.com/learn-to-type-in-linux/
[3]:https://www.maketecheasier.com/linux-physics-simulation/
[4]:https://www.maketecheasier.com/linux-learning-music/
[5]:https://www.maketecheasier.com/linux-geography-apps/
[6]:https://linux.cn/article-6546-1.html