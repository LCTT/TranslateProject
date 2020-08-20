[#]: collector: (lujun9972)
[#]: translator: (Zioyi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12149-1.html)
[#]: subject: (12 Linux Commands to Have Some Fun in the Terminal)
[#]: via: (https://itsfoss.com/funny-linux-commands/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

12 个有趣的 Linux 终端命令
======

> 你觉得 Linux 终端里只有无趣的工作吗？那你一定不知道下面这些有趣的 Linux 命令吧。

Linux 终端是用来完成复杂的工作的，我们有很多有用的 [linux 命令奇技淫巧][1]来帮助你。

但是，你知道你还可以用终端来做很多有趣的事吗？如果你不知道，没关系，大多数 Linux 用户也都只把终端视为一个用来管理系统和开发工作的交互界面。

然而，如果你知道这里有些你可以在终端玩的[基于终端的游戏][2]和 [ASCII 码游戏][3]，你一定会大吃一惊。

在这篇文章中，我将会探索一些有趣的、可笑的、荒谬的命令来让你可以在终端中找点乐子！

### 用这些命令在 Linux 终端中找点乐子

![][4]

你可能会觉得这些命令荒谬或没用，但是有一些还是可以被好好利用的。

我已经放上了 Ubuntu/Debian 的安装指令，如果你使用基于 Ubuntu 的发行版，请确保[启用 universe 仓库][5]，因为大多数命令不在主仓库中。

如果你使用 Arch、Fedora、SUSE、Solus 或者其他非 Ubuntu 的发行版，请使用你的发行版包管理工具去安装这些有趣的 Linux 命令。

#### 1、在终端开一辆火车

让我们坐上火车，来一场说走就走的旅行的，没错，就是字面意思！

`sl` 命令可以让你在终端运行一辆火车。

![][6]

安装方法：

```
sudo apt install sl
```

完成后，你只要在终端输入下面的命令就可以开始：

```
sl
```

很精彩，对吧？但等等，我们还没结束！你还可以让你的火车飞起来，只要加上参数 `-F`，波特先生，请飞吧：

```
sl -F
```

这样会让火车长出翅膀飞出终端窗口！

#### 2、给你的 Linux 终端加上黑客帝国效果

还记得科幻电影[黑客帝国][7]吗？终端里掉落的绿色字符成为了黑客帝国的标志形象。

你也可以在你的 Linux 电脑里有这样的黑客帝国数字雨！你只需要安装 `cmatric` 然后在终端输入它就行。

![][8]

在 Debian/Ubuntu Linux 上安装 cmatrix:

```
sudo apt install cmatrix
```

现在，你要做的就是输入下面的命令，在终端就会有黑客帝国屏幕了：

```
cmatrix
```

按下 `Ctrl+C` 来停止它，黑客先生。

#### 3、燃起来

拿好灭火器，因为接下来你要在你的终端里点火了！

![][11]

想安装它，你要输入：

```
sudo apt install libaa-bin
```

完成后，你输入下面的命令，你的终端就会燃起一团火焰：

```
aafire
```

按下 `Ctrl+C` 来停止它。

#### 4、幸运饼干命令

想知道你的运气怎样但身边没有幸运饼干？

别担心，你只需在终端打出 `fortune` 然后按下回车。终端将会随机显示出一个幸运语，就像你从幸运饼干里得到的一样。

![][12]

安装它：

```
sudo apt install fortune
```

完成后，只要在命令行打出下面的内容，你就会知道你的运气怎样：

```
fortune
```

这是一个你可以实际使用的命令。你可以用它作为每日消息，这样在多用户环境下，每个用户登录后都会得到一个“幸运饼干”。

你也可以把它添加到 `bashrc` 文件，这样当你登进终端你就会看到了。

#### 5、宠物爱好者？这是给你准备的

`oneko` 是一个有趣的命令，可以把你的光标变成一只老鼠，然后创造一只好奇的猫，一旦你移动光标，就会来追你。这不仅局限于终端。当猫追逐光标时，你可以继续工作。

如果你家里有孩子这一定很有趣。

![][13]

用下面的命令安装 `oneko`：

```
sudo apt install oneko
```

用下面的命令运行它：

```
oneko
```

如果你不喜欢猫，喜欢狗，输入：

```
oneko -dog
```

它有很多种小宠物，你可以用 `oneko -help` 获取信息。按下 `Ctrl+C` 终止它。

#### 6、有个小兄弟在看着你

`xeyes` 是一个很小的 GUI 程序，它可以绘制出一双眼睛一直盯着你！它会不断跟随你的鼠标光标，运行命令自己看看！

![][14]

你可以用下面命令安装：

```
sudo apt install xeyes
```

然后这样用它：

```
xeyes
```

按下 `Ctrl+C` 终止它。

#### 7、让终端帮你讲话

打开你的扬声器，你来试试这个命令，[eSpeak][15] 是一个有趣的命令，它可以让你的终端说话。是的，你没听错。

先安装这个包：

```
sudo apt install espeak
```

接下来，你只需要输入在命令行中输入你想听到的话：

```
espeak "Type what your computer says"
```

无论你在双引号里面填什么，你的电脑都会复述出来！它就像[在 Linux 中的 echo 命令][16]，但不是打印出来，而是说出来。

#### 8、Toilet（但与洗手间无关）

这听起来有点奇怪，是的。但是，这只是一个命令，用来将文本转换成大的 ASCII 字符。

![][17]

用这个命令安装 `toilet`：

```
sudo apt install toilet
```

完成后，你只需输入：

```
toilet sample text you want
```

我也不知道为啥这个小程序叫 Toilet。

#### 9、那个牛说什么？

`cowsay` 是一个在终端中用 ASCII 字符展示出一头牛的命令。通过这个命令，你可以控制牛说出你想说的话。

别纠结声音，它只展示文本（就是你看漫画书一样）。

![Cowsay Cowthink][18]

安装 `cowsay`：

```
sudo apt install cowsay
```

安装完成后，你只要输入：

```
cowsay "your text"
```

无论你在双引号里填什么，你的牛都会说！我看到一些系统管理员用它来展示每天的消息。你也可以这样，你甚至可以把它和 `fortune` 命令结合。

#### 10、旗帜

`banner` 命令与 `toilet` 命令相似，但它限制最多只能打印 10 个字符。

![][19]

你可以这样安装 `banner` 命令：

```
sudo apt install sysvbanner
```

然后这样运行：

```
banner "Welcome"
```

替换双引号里的内容，你将会得到你想要的展示内容。

#### 11、Yes

![][20]

`yes` 命令帮助你在循环中自动响应直到终止命令。这个命令将会一直打印相同的内容。如果你想快速生成大量垃圾文本，那么此命令将像超级按钮一样工作。

你也可以使用它为命令提供 `yes` 应答（如果提示应答时）。例如，`apt upgrade` 命令会要求你确认，你可以像这样使用它：

```
yes | sudo apt upgrade
```

你不需要安装任何包，`yes` 命令已经存在了。

想要终止 `yes` 命令循环，只需按下 `CTRL+C`。

#### 12、得到一个新的身份

要生成一个随机的假身份吗？我推荐你用 `rig` 命令。你在终端运行它，就会生成一个假的身份。

![][21]

用这个命令安装 `rig`：

```
sudo apt install rig
```

只需像这样输入：

```
rig
```

它可能被用在脚本或者 web 应用中展示随机信息，但我自己还没做过什么。

### 结尾

我希望你会喜欢这个有趣的 Linux 命令列表。你最喜欢哪个命令呢？你还知道其他有趣的命令吗？请在评论部分与我们分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/funny-linux-commands/

作者：[Srimanta Koley][a]
选题：[lujun9972][b]
译者：[Zioyi](https://github.com/Zioyi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-command-tricks/
[2]: https://itsfoss.com/best-command-line-games-linux/
[3]: https://itsfoss.com/best-ascii-games/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/fun-linux-commands.png?ssl=1
[5]: https://itsfoss.com/ubuntu-repositories/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/sl-command.jpg?ssl=1
[7]: https://en.wikipedia.org/wiki/The_Matrix
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/matrix-screen-command.png?ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2015/12/Star-Wars-Linux-Terminal-2.png?fit=732%2C462&ssl=1
[10]: https://itsfoss.com/star-wars-linux/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/fire-command.png?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/fortune-command.jpg?ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/oneko-command.jpg?ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/xeyes-command.jpg?ssl=1
[15]: https://itsfoss.com/espeak-text-speech-linux/
[16]: https://linuxhandbook.com/echo-command/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/toilet-command.jpg?ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/cowsay-cowthink.jpg?ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/banner-command.jpg?ssl=1
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/yes-yourtext.jpg?ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/rig-command.jpg?ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/srimanta.jpg?ssl=1
