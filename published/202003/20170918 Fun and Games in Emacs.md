[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11949-1.html)
[#]: subject: (Fun and Games in Emacs)
[#]: via: (https://www.masteringemacs.org/article/fun-games-in-emacs)
[#]: author: (Mickey Petersen https://www.masteringemacs.org/about)

“Emacs 游戏机”完全指南
======

又是周一，你正在为你的老板 Lumbergh （LCTT 译注：《上班一条虫》中的副总裁）努力倒腾那些 [无聊之极的文档][1]。为什么不玩玩 Emacs 中类似 zork 的文字冒险游戏来让你的大脑从单调的工作中解脱出来呢？

但说真的，Emacs 中既有游戏，也有古怪的玩物。有些你可能有所耳闻。这些玩意唯一的共同点就是，它们大多是很久以前就添加到 Emacs 中的：有些东西真的是相当古怪（如你将在下面看到的），而另一些则显然是由无聊的员工或学生们编写的。它们全有一个共同点，都带着一种奇思妙想和随意性，这在今天的 Emacs 中很少见。Emacs 现在变得十分严肃，在某种程度上，它已经与 20 世纪 80 年代那些游戏被编写出来的时候大不一样。

### 汉诺塔

[汉诺塔][2] 是一款古老的数学解密游戏，有些人可能对它很熟悉，因为它的递归和迭代解决方案经常被用于计算机科学教学辅助。

![Tower of Hanoi Screenshot](https://www.masteringemacs.org/static/uploads/hanoi.png)

Emacs 中有三个命令可以运行汉诺塔：`M-x hanoi` 默认为 3 个碟子; `M-x hanoi-unix` 和 `M-x hanoi-unix-64` 使用 unix 时间戳的位数（32 位或 64 位）作为默认盘子的个数，并且每秒钟自动移动一次，两者不同之处在于后者假装使用 64 位时钟（因此有 64 个碟子）。

Emacs 中汉诺塔的实现可以追溯到 20 世纪 80 年代中期——确实是久得可怕。它有一些自定义选项（`M-x customize-group RET hanoi RET`），如启用彩色碟子等。当你离开汉诺塔缓冲区或输入一个字符，你会收到一个讽刺的告别信息（见上图）。

### 5x5

![5x5 game grid](https://www.masteringemacs.org/static/uploads/5x5.png)

5x5 的游戏是一个逻辑解密游戏：你有一个 5x5 的网格，中间的十字被填满；你的目标是通过按正确的顺序切换它们的空满状态来填充所有的单元格，从而获得胜利。这并不像听起来那么容易！

输入 `M-x 5x5` 就可以开始玩了，使用可选的数字参数可以改变网格的大小。这款游戏的有趣之处在于它能向你建议下一步行动并尝试找到该游戏网格的解法。它用到了 Emacs 自己的一款非常酷的符号 RPN 计算器 `M-x calc`（在《[Emacs 快乐计算][3]》这篇文章中，我使用它来解决了一个简单的问题）。

所以我喜欢这个游戏的原因是它提供了一个非常复杂的解题器——真的，你应该通过 `M-x find-library RET 5x5` 来阅读其源代码——这是一个试图通过暴力破解游戏解法的“破解器”。

创建一个更大的游戏网格，例如输入 `M-10 M-x 5x5`，然后运行下面某个 `crack` 命令。破解器将尝试通过迭代获得最佳解决方案。它会实时运行该游戏，观看起来非常有趣：

-   `M-x 5x5-crack-mutating-best`： 试图通过变异最佳解决方案来破解 5x5。
-   `M-x 5x5-crack-mutating-current`： 试图通过变异当前解决方案来破解 5x5。
-   `M-x 5x5-crack-random`： 尝试使用随机方案解破解 5x5。
-   `M-x 5x5-crack-xor-mutate`： 尝试通过将当前方案和最佳方案进行异或运算来破解 5x5。

### 文本动画

你可以通过运行 `M-x animation-birthday-present` 并给出你的名字来显示一个奇特的生日礼物动画。它看起来很酷！

![xkcd](https://imgs.xkcd.com/comics/real_programmers.png)

这里用的 `animate` 包也用在了 `M-x butterfly` 命令中，这是一个向上面的 [XKCD][4] 漫画致敬而添加到 Emacs 中的命令。当然，漫画中的 Emacs 命令在技术上是无效的，但它的幽默足以弥补这一点。

### 黑箱

我将逐字引用这款游戏的目标：

> 游戏的目标是通过向黑盒子发射光线来找到四个隐藏的球。有四种可能：
> 1) 射线将通过盒子不受干扰；
> 2) 它将击中一个球并被吸收；
> 3) 它将偏转并退出盒子，或
> 4) 立即偏转，甚至不能进入盒子。

所以，这有点像我们小时候玩的[战舰游戏][5]，但是……是专为物理专业高学历的人准备的吧？

这是另一款添加于 20 世纪 80 年代的游戏。我建议你输入 `C-h f blackbox` 来阅读玩法说明（文档巨大）。


### 泡泡

![Bubbles game](https://www.masteringemacs.org/static/uploads/bubbles.png)

`M-x bubble` 游戏相当简单：你必须用尽可能少移动清除尽可能多的“泡泡”。当你移除气泡时，其他气泡会掉落并粘在一起。这是一款有趣的游戏，此外如果你使用 Emacs 的图形用户界面，它还支持图像显示。而且它还支持鼠标。

你可以通过调用 `M-x bubbles-set-game-<difficulty>` 来设置难度，其中 `<difficulty>` 可以是这些之一：`easy`、`medium`、`difficult`、`hard` 或 `userdefined`。此外，你可以使用：`M-x custom-group bubbles` 来更改图形、网格大小和颜色。

由于它即简单又有趣，这是 Emacs 中我最喜欢的游戏之一。

### 幸运饼干

我喜欢 `fortune` 命令。每当我启动一个新 shell 时，这些与文学片段、谜语相结合的刻薄、无益、常常带有讽刺意味的“建议”就会点亮我的一天。

令人困惑的是，Emacs 中有两个包或多或少地做着类似的事情：`fortune` 和 `cookie`。前者主要用于在电子邮件签名中添加幸运饼干消息，而后者只是一个简单的 fortune 格式阅读器。

不管怎样，使用 Emacs 的 `cookie` 包前，你首先需要通过 `customize-option RET cookie RET` 来自定义变量 `cookie-file` 告诉它从哪找到 fortune 文件。

如果你的操作系统是 Ubuntu，那么你先安装 `fortune` 软件包，然后就能在 `/usr/share/games/fortune/` 目录中找到这些文件了。

之后你就可以调用 `M-x cookie` 随机显示 fortune 内容，或者，如果你想的话，也可以调用 `M-x cookie-apropos` 查找所有匹配的饼干。

### 破译器

这个包完美地抓住了 Emacs 的功利本质：这个包为你破解简单的替换密码（如“密码谜题”）提供了一个很有用的界面。你知道，二十多年前，有些人确实迫切需要破解很多基本的密码。正是像这个模块这样的小玩意让我非常高兴地用起 Emacs 来：一个只对少数人有用的模块，但是，如果你突然需要它了，那么它就在那里等着你。

那么如何使用它呢？让我们假设使用 “rot13” 密码：在 26 个字符的字母表中，将字符旋转 13 个位置。
通过 `M-x ielm` （Emacs 用于 [运行 Elisp][6] 的 REPL 环境）可以很容易在 Emacs 中进行尝试：

```
*** Welcome to IELM ***  Type (describe-mode) for help.
ELISP> (rot13 "Hello, World")
"Uryyb, Jbeyq"
ELISP> (rot13 "Uryyb, Jbeyq")
"Hello, World"
ELISP>
```

简而言之，你将明文旋转了 13 个位置，就得到了密文。你又旋转了一次 13 个位置，就返回了最初的明文。 这就是这个包可以帮助你解决的问题。

那么，decipher 模块又是如何帮助我们的呢？让我们创建一个新的缓冲区 `test-cipher` 并输入你的密文（在我的例子中是 `Uryyb，Jbeyq`）。

![cipher](https://www.masteringemacs.org/static/uploads/cipher.png)

你现在面对的是一个相当复杂的界面。现在把光标放在紫色行的密文的任意字符上，并猜测这个字符可能是什么：Emacs 将根据你的选择更新其他明文的猜测结果，并告诉你目前为止字母表中的字符是如何分配的。

你现在可以用下面各种助手命令来关闭选项，以帮助推断密码字符可能对应的明文字符：

- `D`： 列出示意图（该加密算法中双字符对）及其频率
- `F`： 表示每个密文字母的频率
- `N`： 显示字符的邻近信息。我不确定这是干啥的。
- `M` 和 `R`： 保存和恢复一个检查点，允许你对工作进行分支以探索破解密码的不同方法。

总而言之，对于这样一个深奥的任务，这个包是相当令人印象深刻的！如果你经常破解密码，也许这个程序包能帮上忙？

### 医生

![doctor](https://www.masteringemacs.org/static/uploads/doctor.png)

啊，Emacs 医生。其基于最初的 [ELIZA][7]，“医生”试图对你说的话进行心理分析，并试图把问题复述给你。体验几分钟，相当有趣，它也是 Emacs 中最著名的古怪玩意之一。你可以使用 `M-x doctor` 来运行它。

### Dunnet

Emacs 自己特有的类 Zork 文字冒险游戏。输入 `M-x dunnet` 就能玩了。这是一款相当不错的游戏，简单的说，它是另一款非常著名的 Emacs 游戏，很少有人真正玩到通关。

如果你发现自己能在无聊的文档工作之间空出时间来，那么这是一个超级棒的游戏，内置“老板屏幕”，因为它是纯文本的。

哦，还有，不要想着吃掉那块 CPU 卡 :)

### 五子棋

![gomoku](https://www.masteringemacs.org/static/uploads/gomoku.png)

另一款写于 20 世纪 80 年代的游戏。你必须将 5 个方块连成一条线，井字棋风格。你可以运行 `M-x gomoku` 来与 Emacs 对抗。游戏还支持鼠标，非常方便。你也可以自定义 `gomoku` 组来调整网格的大小。

### 生命游戏

[康威的生命游戏][8] 是细胞自动机的一个著名例子。Emacs 版本提供了一些启动模式，你可以（通过 elisp 编程）调整 `life-patterns` 变量来更改这些模式。

你可以用 `M-x life` 触发生命游戏。事实上，所有的东西，包括显示代码、注释等等一切，总共不到 300 行，这也让人印象深刻。

### 乒乓，贪吃蛇和俄罗斯方块

![tetris](https://www.masteringemacs.org/static/uploads/tetris.png)

这些经典游戏都是使用 Emacs 包 `gamegrid` 实现的，这是一个用于构建网格游戏（如俄罗斯方块和贪吃蛇）的通用框架。gamegrid 包的伟大之处在于它同时兼容图形化和终端 Emacs：如果你在 GUI 中运行 Emacs，你会得到精美的图形；如果你没有，你看到简单的 ASCII 艺术。

你可以通过输入 `M-x pong`、`M-x snake`、`M-x tetris` 来运行这些游戏。

特别是俄罗斯方块游戏实现的非常到位，会逐渐增加速度并且能够滑块。而且既然你已经有了源代码，你完全可以移除那个讨厌的 Z 形块，没人喜欢它！

### Solitaire

![solitaire image](https://www.masteringemacs.org/static/uploads/solitaire.png)

可惜，这不是纸牌游戏，而是一个基于“钉子”的游戏，你可以选择一块石头（`o`）并“跳过”相邻的石头进入洞中（`.`），并在这个过程中去掉你跳过的石头，最终只能在棋盘上留下一块石头，重复该过程直到棋盘被请空（只保留一个石头）。

如果你卡住了，有一个内置的解题器名为 `M-x solitire-solve`。

### Zone

我的另一个最爱。这是一个屏幕保护程序——或者更确切地说，是一系列的屏幕保护程序。

输入 `M-x zone`，然后看看屏幕上发生了什么！

你可以通过运行 `M-x zone-when-idle`（或从 elisp 调用它）来配置屏幕保护程序的空闲时间，时间以秒为单位。你也可以通过 `M-x zone-leave-me-alone` 来关闭它。

如果在你的同事看着的时候启动它，你的同事肯定会抓狂的。

### 乘法解谜

![mpuz](https://www.masteringemacs.org/static/uploads/mpuz.png)

这是另一个脑筋急转弯的益智游戏。当你运行 `M-x mpuz` 时，将看到一个乘法解谜题，你必须将字母替换为对应的数字，并确保数字相加（相乘？）符合结果。

如果遇到难题，可以运行 `M-x mpuz-show-solution` 来解决。

### 杂项

还有更多好玩的东西，但它们就不如刚才那些那么好玩好用了：

-   你可以通过 `M-x morse-region` 和 `M-x unmorse-region` 将一个区域翻译成莫尔斯电码。
-   Dissociated Press 是一个非常简单的命令，它将一个类似随机穿行的马尔可夫链生成器应用到缓冲区中的文本中，并以此生成无意义的文本。试一下 `M-x dissociated-press`。
-   `gametree` 软件包是一个通过电子邮件记录和跟踪国际象棋游戏的复杂方法。
-   `M-x spook` 命令插入随机单词（通常是到电子邮件中），目的是混淆/超载 “NSA 拖网渔船” —— 记住，这个模块可以追溯到 20 世纪 80 年代和 90 年代，那时应该有间谍们在监听各种单词。当然，即使是在十年前，这样做也会显得非常偏执和古怪，不过现在看来已经不那么奇怪了……

### 总结

我喜欢 Emacs 附带的游戏和玩具。它们大多来自于，嗯，我们姑且称之为一个不同的时代：一个允许或甚至鼓励奇思妙想的时代。有些玩意非常经典（如俄罗斯方块和汉诺塔），有些对经典游戏进行了有趣的变种（如黑盒）——但我很高兴这么多年后它们依然存在于 Emacs 中。我想知道时至今日，类似这些的玩意是否还会再纳入 Emacs 的代码库中；嗯，它们很可能不会——它们将被归入包管理仓库中，而在这个干净而无菌的世界中，它们无疑属于包管理仓库。

Emacs 要求将对 Emacs 体验不重要的内容转移到包管理仓库 ELPA 中。我的意思是，作为一个开发者，这是有道理的，但是……对于每一个被移出并流放到 ELPA 的包，我们是不是在蚕食 Emacs 的精髓？

--------------------------------------------------------------------------------


via: https://www.masteringemacs.org/article/fun-games-in-emacs

作者：[Mickey Petersen][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.masteringemacs.org/about
[b]:https://github.com/lujun9972
[1]:https://en.wikipedia.org/wiki/Office_Space
[2]:https://en.wikipedia.org/wiki/Tower_of_Hanoi
[3]:https://www.masteringemacs.org/article/fun-emacs-calc
[4]:http://www.xkcd.com
[5]:https://en.wikipedia.org/wiki/Battleship_(game)
[6]:https://www.masteringemacs.org/article/evaluating-elisp-emacs
[7]:https://en.wikipedia.org/wiki/ELIZA
[8]:https://en.wikipedia.org/wiki/Conway's_Game_of_Life
