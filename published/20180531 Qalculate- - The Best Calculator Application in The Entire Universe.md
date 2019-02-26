Qalculate! ：全宇宙最好的计算器软件
======

十多年来，我一直都是 GNU-Linux 以及 [Debian][1] 的用户。随着我越来越频繁的使用桌面环境，我发现对我来说除了少数基于 web 的服务以外我的大多数需求都可以通过 Debian 软件库里自带的[桌面应用][2]解决。

我的需求之一就是进行单位换算。尽管有很多很多在线服务可以做这件事，但是我还是需要一个可以在桌面环境使用的应用。这主要是因为隐私问题以及我不想一而再再而三的寻找在线服务做事。为此我搜寻良久，直到找到 Qalculate!。

### Qalculate! 最强多功能计算器应用

![最佳计算器应用 Qalculator][3]

这是 aptitude 上关于 [Qalculate!][4] 的介绍，我没法总结的比他们更好了：

> 强大易用的桌面计算器 - GTK+ 版
>
> Qalculate! 是一款外表简单易用，内核强大且功能丰富的应用。其功能包含自定义函数、单位、高计算精度、作图以及可以输入一行表达式（有容错措施）的图形界面（也可以选择使用传统按钮）。

这款应用也发行过 KDE 的界面，但是至少在 Debian Testing 软件库里，只出现了 GTK+ 版的界面，你也可以在 GitHub 上的这个[仓库][5]里面看到。

不必多说，Qalculate! 在 Debian 的软件源内处于可用状态，因此可以使用 [apt][6] 命令或者是基于 Debian 的发行版比如 Ubuntu 提供的软件中心轻松安装。在 Windows 或者 macOS 上也可以使用这款软件。

#### Qalculate! 特性一览

列出全部的功能清单会有点长，请允许我只列出一部分功能并使用截图来展示极少数 Qalculate! 提供的功能。这么做是为了让你熟悉 Qalculate! 的基本功能，并在之后可以自由探索 Qalculate! 到底还能干什么。

* 代数
* 微积分
* 组合数学
* 复数
* 数据集
* 日期与时间
* 经济学
* 对数和指数
* 几何
* 逻辑学
* 向量和矩阵
* 杂项
* 数论
* 统计学
* 三角学

#### 使用 Qalculate!

Qalculate! 的使用不是很难。你甚至可以在里面写简单的英文。但是我还是推荐先[阅读手册][7]以便充分发挥 Qalculate! 的潜能。

![使用 Qalculate 进行字节到 GB 的换算][8]

![摄氏度到华氏度的换算][9]

#### qalc 是 Qalculate! 的命令行版

你也可以使用 Qalculate! 的命令行版 `qalc`：

```
$ qalc 62499836 byte to gibibyte
62499836 * byte = approx. 0.058207508 gibibyte

$ qalc 40 degree celsius to fahrenheit
(40 * degree) * celsius = 104 deg*oF
```

Qalculate! 的命令行界面可以让不喜欢 GUI 而是喜欢命令行界面（CLI）或者是使用无头结点（没有 GUI）的人可以使用 Qalculate!。这些人大多是在服务器环境下工作。

如果你想要在脚本里使用这一软件的话，我想 libqalculate 是最好的解决方案。看一看 `qalc` 以及 qalculate-gtk 是如何依赖于它工作的就足以知晓如何使用了。

再提一嘴，你还可以了解下如何根据一系列数据绘图，其他应用方式就留给你自己发掘了。不要忘记查看 `/usr/share/doc/qalculate/index.html` 以获取 Qalculate! 的全部功能。

注释：注意 Debian 更喜欢 [gnuplot][10]，因为其输出的图片很精美。

#### 附加技巧：你可以通过在 Debian 下通过命令行感谢开发者

如果你使用 Debian 而且喜欢哪个包的话，你可以使用如下命令感谢 Debian 下这个软件包的开发者或者是维护者：

```
reportbug --kudos $PACKAGENAME
```

因为我喜欢 Qalculate!，我想要对 Debian 的开发者以及维护者 Vincent Legout 的卓越工作表示感谢：

```
reportbug --kudos qalculate
```

建议各位阅读我写的关于如何使用报错工具[在 Debian 中上报 BUG][11]的详细指南。

#### 一位高分子化学家对 Qalculate! 的评价

经由作者 [Philip Prado][12]，我们联系上了 Timothy Meyers 先生，他目前是在高分子实验室工作的高分子化学家。

他对 Qaclulate! 的专业评价是：

> 看起来几乎任何科学家都可以使用这个软件，因为如果你知道指令以及如何使其生效的话，几乎任何数据计算都可以使用这个软件计算。

> 我觉得这个软件少了些物理常数，但我想不起来缺了哪些。我觉得它没有太多有关[流体动力学][13]的东西，再就是少了点部分化合物的[光吸收][14]系数，但这些东西只对我这个化学家来说比较重要，我不知道这些是不是对别人来说也是特别必要的。[自由能][15]可能也是。

最后，我分享的关于 Qalculate! 的介绍十分简陋，其实际功能与你的需要以及你的想象力有关系。希望你能喜欢 Qalculate!

--------------------------------------------------------------------------------

via: https://itsfoss.com/qalculate/

作者：[Shirish][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[name1e5s](https://github.com/name1e5s)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/shirish/
[1]:https://www.debian.org/
[2]:https://itsfoss.com/essential-linux-applications/
[3]:https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/05/qalculate-app-featured-1.jpeg?w=800&ssl=1
[4]:https://qalculate.github.io/
[5]:https://github.com/Qalculate
[6]:https://itsfoss.com/apt-command-guide/
[7]:https://qalculate.github.io/manual/index.html
[8]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/04/qalculate-byte-conversion.png?zoom=2&ssl=1
[9]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/04/qalculate-gtk-weather-conversion.png?zoom=2&ssl=1
[10]:http://www.gnuplot.info/
[11]:https://itsfoss.com/bug-report-debian/
[12]:https://itsfoss.com/author/phillip/
[13]:https://en.wikipedia.org/wiki/Fluid_dynamics
[14]:https://en.wikipedia.org/wiki/Absorption_(electromagnetic_radiation)
[15]:https://en.wikipedia.org/wiki/Gibbs_free_energy
