[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10435-1.html)
[#]: subject: (Snake your way across your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-snake)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

在 Linux 终端中玩贪吃蛇
======

> 有了这个 20 世纪 70 年代的经典重制游戏，Python 将不再是你在 Linux 终端能发现的唯一的“蛇”。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-snake.png?itok=oNhqUTDu)

欢迎回到 Linux 命令行玩具日历。如果这是你第一次访问该系列，你可能会问什么是命令行玩具。这很难确切地说，但我的定义是任何可以帮助你在终端玩得开心的东西。

我们这周都在介绍游戏，这很有趣，接着让我们看下今天的游戏，贪吃蛇！

贪吃蛇是一个古老又很好的游戏，这些年一直有各种版本。我记得我第一次玩得版本是 20 世纪 90 年代与 [QBasic][2] 一起打包发布的 [Nibbles][1]，它对我理解什么是编程语言起了很重要的作用。我有游戏的源码，我可以修改并查看会发生什么，并学习到一些组成这个编程语言的有趣词汇究竟是什么意思。

今天的[贪吃蛇][3]是用 Go 写的，它很简单并且和原版的游戏一样有趣。像大多数简单的老游戏一样，它有很多版本可供选择。这今天的贪吃蛇中，甚至还有一个经典的 [bsdgames][4] 形式的包，它的发行版几乎一定有它。

但我喜欢的是用 Docker 打包的贪吃蛇，因为我可以轻松地在命令行中运行，而不用担心发行版相关的问题。这个版本使用 15 个随机的食物 emoji 图案让蛇来吃。我玩得不好。不管怎样，请试一下：

```
$ docker run -ti dyego/snake-game
```

这个贪吃蛇以 MIT 许可证开源，你可在 [Github][3] 取得源码。

![](https://opensource.com/sites/default/files/uploads/linux-toy-snake-animated.gif)

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。请在评论区留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

请查看昨天的玩具，[数字 2 的力量，Linux 的力量：在命令行中玩 2048][5]，记得明天再来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-snake

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Nibbles_(video_game)
[2]: https://en.wikipedia.org/wiki/QBasic
[3]: https://github.com/DyegoCosta/snake-game
[4]: https://github.com/vattam/BSDGames
[5]: https://opensource.com/article/18/12/linux-toy-2048
