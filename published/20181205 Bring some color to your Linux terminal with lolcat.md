[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Bring some color to your Linux terminal with lolcat)
[#]: via: (https://opensource.com/article/18/12/linux-toy-lolcat)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: (https://linux.cn/article-10361-1.html)

使用 lolcat 为你的 Linux 终端带来彩虹
======

> 使用这个简单的工具，你可以为所需的任何程序的输出变成七彩。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-lolcat.png?itok=Es6dYcph)

今天是 Linux 命令行玩具日历的第五天。如果这是你第一次访问该系列，你可能会问自己，什么是命令行玩具。即使我不太确定，但一般来说，它可能是一个游戏，或任何简单的可以帮助你在终端玩得开心的东西。

很可能你们中的一些人之前已经看过我们日历中的各种玩具，但我们希望每个人至少见到一件新事物。

今日的选择，`lolcat`，是我选择的第一个没有在我的 Linux 发行版中打包的程序，但它安装仍然很简单。它是一个 Ruby 程序，你应该可以使用下面的命令轻松地添加到系统中。

```
$ gem install lolcat
```

之后，只需将一些文本传送给它，就可以看到彩色的输出。例如，尝试几个之前在我们的日历中出现的程序，使用以下命令：

```
$ fortune | boxes -a c -d parchment | lolcat
```

根据你的运气，你可能会看到这样：

![](https://opensource.com/sites/default/files/uploads/linux-toy-lolcat-parchment.png)

你可以传递给 `lolcat` 一些参数。这里不再赘述，我建议你访问 `lolcat` 的 [GitHub 页面][1] 或者在终端输入 `lolcat --help` 了解。但一般来说，它们能设置彩虹的传递和频率，以及我个人最喜欢的动画。谁不喜欢终端的彩色动画输出呢？让我们再试一次，用一个不同的边框（当然是以猫为主题）和一句在我的格言列表中的适合猫的句子。

```
fortune -m "nine tails" | boxes -a c -d cat | lolcat -a
```

![](https://opensource.com/sites/default/files/uploads/linux-toy-lolcat-animated.gif)

`lolcat` 是一个 BSD 许可下的开源软件。

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。如果你有特别想了解的可以评论留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

了解一下昨天的玩具，[在 Linux 命令行中拥有一头牛][2]，还有记得明天再来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-lolcat

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://github.com/busyloop/lolcat
[2]: https://opensource.com/article/18/12/linux-toy-cowsay
