命令行中的世界杯
======

![](https://i2.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-wc2018.jpg?resize=700%2C450&ssl=1)

足球始终在我们身边。甚至国内联赛已经完成，我们也想知道球赛比分。目前，俄罗斯主办的2018国际足联世界杯是世界上最大的足球锦标赛。每届世界杯都有一些足球强国未能取得参赛资格。意大利和荷兰就无缘本次世界杯。但是甚至是在未参与的国家，追踪关注最新比分成为一种阶段性仪式。我也喜欢跟上世界主要联盟最新比分的发展，而不用去搜索不同的网站。

![命令行接口][2]如果你很喜欢命令行，那么有什么更好的方法用一个小型命令行程序追踪最新的世界杯比分和排名呢？让我们看一看最热门的可用的球赛趋势分析程序之一，它叫作 football-cli.

football-cli 不是一个开创性的应用程序。数年间，一直有大量的命令行工具可以让你了解到最新的球赛比分和联赛排名。例如，我是 soccer-cli 和 App-football 的资深用户，soccer-cli 是基于 Python, 而 App-football 是用 Perl 编写的。但我总是在寻找新的热门应用。在某些方面，football-cli 也正在脱颖而出。

football-cli 是 JavaScript 开发的，由 Manraj Singh 编写，它是开源的软件。基于 MIT 许可证发布，用 npm（ JavaScript 包管理器)安装十分简单。那么，让我们直接行动吧！

该应用程序提供获取过去及现在赛事得分、查看联盟和球队过去和即将到来的赛事的指令。它也会显示某一特定联盟的排名。有一条指令可以列出程序所支持的不同赛事。我们不妨从最后一个条指令开始。

在 shell 提示符下：

`luke@ganges:~$ football lists`

![球赛列表][3]

世界杯被列在最下方，我错过了昨天的比赛，所以为了了解比分，我在 shell 提示下输入:

`luke@ganges:~$ football scores`

![football-wc-22][4]

现在，我想看看目前的世界杯小组排名。很简单：

`luke@ganges:~$ football standings -l WC`

下面是输出的一个片段:

![football-wc-biaoge][5]

你们当中眼尖的可能会注意到这里有一个错误。比如比利时看上去是 G 组的领导者，但这是不正确的，比利时和英格兰（截稿前）在得分上打平。在这种情况下，纪律好的队伍排名更高。英格兰收到两张黄牌，而比利时收到三张，因此，英格兰应当名列榜首。

假设我想知道利物浦 90 天后英超联赛的结果，那么:

`luke@ganges:~$ football fixtures -l PL -d 90 -t "Liverpool"`

![football-利物浦][6]

我发现这个程序非常方便。它用一种清晰整洁而有吸引力的方式显示分数和排名。当欧洲联赛再次开始时，它将被大量应用。（事实上 2018-19 冠军联赛已经在进行中）！

这几个示例让大家对 football-cli 的实用性有了更深的体会。想要了解更多，请转至开发者的  **[GitHub page][7]**. 足球 ＋ 命令行＝ football-cli.

如同许多类似的工具一样，该软件从 football-data.org 获取相关数据。这项服务以机器可读的方式为所有欧洲主要联赛提供数据，包括比赛、球队、球员、结果等等。所有这些信息都是通过 JOSN 代理中一个易于使用的 RESTful API 提供的。


--------------------------------------------------------------------------------

via: https://www.linuxlinks.com/football-cli-world-cup-football-on-the-command-line/

作者：[Luke Baker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ZenMoore](https://github.com/ZenMoore)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxlinks.com/author/luke-baker/
[1]:https://www.linuxlinks.com/wp-content/plugins/jetpack/modules/lazy-images/images/1x1.trans.gif
[2]:https://i0.wp.com/www.linuxlinks.com/wp-content/uploads/2017/12/CLI.png?resize=195%2C171&ssl=1
[3]:https://i2.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-lists.png?resize=595%2C696&ssl=1
[4]:https://i2.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-wc-22.png?resize=634%2C75&ssl=1
[5]:https://i0.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-wc-table.png?resize=750%2C581&ssl=1
[6]:https://i1.wp.com/www.linuxlinks.com/wp-content/uploads/2018/06/football-Liverpool.png?resize=749%2C131&ssl=1
[7]:https://github.com/ManrajGrover/football-cli
[8]:https://www.linuxlinks.com/links/Software/
[9]:https://discord.gg/uN8Rqex
