[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (How to bring good fortune to your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-fortune)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: (https://linux.cn/article-10486-1.html)

如何为你的 Linux 终端带来好运
======
> 使用 fortune 实用程序将名言和俏皮话带到命令行。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-fortune.png?itok=5PVVZVer)

这是 12 月，如果你还没有找到一款能激发你灵感的[科技降临节日历][1]，那么，也许这个系列可以。从现在到 24 日，每天我们都会为你带来一个不同的 Linux 命令行玩具。你可能会问，什么是命令行玩具？它可能是一个游戏或任何简单的娱乐程序，为你的终端带来一点点快乐。

你可能之前已经看过其中的一些，我们希望你也能发现一些新的东西。不管怎样，我们都希望你在关注时保有乐趣。

今天的玩具是 `fortune`，它很古老。它的版本可以追溯到 1980 年，当时它包含在 Unix 中。我在 Fedora 中安装的版本是在 BSD 许可下提供的，我可以使用以下命令获取它。（LCTT 译注：fortune 这个命令得名于 fortune cookies，是流行于西方的中餐馆的一种脆饼干，里面包含格言、幸运数字等。）

```
$ sudo dnf install fortune-mod -y
```

你的发行版可能会有所不同。在某些情况下，你可能需要在 `fortune` 命令之外单独安装那些“幸运饼干”（尝试在你的包管理器中搜索 “fortunes”）。你还可以在 [GitHub][2] 上查看它的源代码，然后，只需运行 `fortune` 即可获得好运。

```
$ fortune
"Time is an illusion.  Lunchtime doubly so."
-- Ford Prefect, _Hitchhiker's Guide to the Galaxy_
```

那么，你为什么会在终端上需要 `fortune` 呢？当然是为了好玩啦。也许你想将它们添加到系统上的每天消息（motd）中？

就我个人而言，当我使用终端来解析文本时，我喜欢使用 `fortune` 命令作为一段内置的虚拟数据，特别是使用[正则表达式][3]时，我想要一些简单的东西来尝试一下。

例如，假设我使用 `tr` 命令来测试转换，用数字 3 替换字母 e。

```
$ fortune | tr 'eE' '3'
Unix 3xpr3ss:
All pass3ng3r bring a pi3c3 of th3 a3roplan3 and a box of tools with th3m to
th3 airport. Th3y gath3r on th3 tarmac, arguing constantly about what kind
of plan3 th3y want to build and how to put it tog3th3r. 3v3ntually, th3
pass3ng3rs split into groups and build s3v3ral diff3r3nt aircraft, but giv3
th3m all th3 sam3 nam3. Som3 pass3ng3rs actually r3ach th3ir d3stinations.
All pass3ng3rs b3li3v3 th3y got th3r3.
```

那么你的发行版带来了什么幸运饼干呢？看看你的 `/usr/share/games/fortune` 目录，找到它们。以下我最喜欢的几个。

```
Never laugh at live dragons.
                -- Bilbo Baggins [J.R.R. Tolkien, "The Hobbit"]

I dunno, I dream in Perl sometimes...
                -- Larry Wall in  <8538@jpl-devvax.JPL.NASA.GOV>

I have an existential map.  It has "You are here" written all over it.
                -- Steven Wright
```

关于 `fortune` 想要了解更多？当然，你可以经常查看 man 页来了解更多选项，或者在[维基百科][4]上阅读更多关于此命令的历史信息。

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。请在评论区留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

看看昨天的玩具：[驾驶火车头通过你的 Linux 终端][5]。记得明天再来！


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-fortune

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/16/11/7-tech-advent-calendars-holiday-season
[2]: https://github.com/shlomif/fortune-mod
[3]: https://opensource.com/article/18/5/getting-started-regular-expressions
[4]: https://en.wikipedia.org/wiki/Fortune_%28Unix%29
[5]: https://opensource.com/article/18/12/linux-toy-sl
