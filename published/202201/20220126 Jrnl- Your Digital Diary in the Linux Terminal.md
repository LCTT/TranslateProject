[#]: subject: "Jrnl: Your Digital Diary in the Linux Terminal"
[#]: via: "https://itsfoss.com/jrnl/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14229-1.html"

Jrnl：你的 Linux 终端数字日记
======

![](https://img.linux.net.cn/data/attachment/album/202201/30/234157xxoo76bdxb7xxbgl.jpg)

想象一下：有人伤了你的心，而你想要的是心无旁骛地在日记中写下你的感受。你明白这种感受吗？没有吗？我也不知道。我没有心碎过（或者也许我心碎了，但我不想告诉你）。

但我还是想向你展示一个奇妙的极简的开源的记事应用来保存日记。

这个方便的小程序是 [Jrnl][1]，它可以让你在终端中直接创建、搜索和查看日记条目。

用 Jrnl 创建新的笔记就像下面一样简单：

```
jrnl yesterday: I read an amazing article on It’s FOSS. I learn about a minimalist app called Jrnl, I should try it.
```

看起来很简单，不是吗？关键字 “yesterday” 在这里是一个触发器，它把你的笔记保存到昨天的日期。记住，它被称为 Jrnl（日记）是有原因的。它的主要目的是保存日记。

如果你喜欢把你的想法写成日记，或者只是想尝试一下，让我分享一下安装和使用的一些细节。

### 在你的 Linux 系统上安装和使用 Jnrl

Jrnl 可以用 pipx 或 Homebrew 包管理器安装。

我在测试中使用了 Homebrew，所以我将列出这些步骤。首先获取 Homebrew：

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

![Installing Homebrew on your system][2]

这就好了！如果你需要更多的信息，我们有一个关于 [在 Linux 上安装 Homebrew][3] 的详细教程。

当你安装了 Homebrew 包管理器后，用它来安装 Jrnl：

```
brew install jrnl
```

![Installing Jrnl with Homebrew][4]

安装后，只要初始化 jrnl 并开始写你的随机想法。

你还记得本文开头的第一个例子吗？让我们再来看看它吧！

```
jrnl yesterday: I read an amazing article in It’s FOSS. I learn about a minimalist app called Jrnl, I should try it.
```

![Writing an entry][5]

在这一行中，我用命令 `jrnl` 在一个时间戳旁启动程序，在这个例子中是 `yesterday`。我写了一个冒号 `:`，表示我将开始写一些东西，在第一个句子标记 `.?!:`（在这里是句号 `.`）之前包含的所有内容将是标题。最后，这个句号旁边的所有内容将被视为文件的主体。

目前，Jnrl 有两种模式：撰写和查看；前面的步骤用于撰写条目，但如果你想查看，例如，之前写过的条目，语法也很简单，你只需输入下一行。

```
jrnl -on yesterday
```

![Viewing an entry][6]

认为有人可能会阅读你的日记和想法？你也可以对你的条目进行加密。

这就好了！ 当然，Jrnl 还有很多功能，你可以通过下面这行轻松找到：

```
jrnl --help
```

你也可以参考 [其官方网站][7] 上的文档。记住，在这样的一个开源项目中，文档是你最好的朋友。享受它吧！

### 总结

当然，Jrnl 并不适合所有人。大多数命令行工具都不适合。但如果你在终端中生活和呼吸，并喜欢记录你的想法，它就适合你。

请不要忘记在评论中与我们分享你的个人经验，或者更好的是，如果你想让更多的人了解这个项目，你可以在各个社区和论坛上分享这个帖子。

--------------------------------------------------------------------------------

via: https://itsfoss.com/jrnl/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://jrnl.sh/en/stable/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Installing_brew.png?resize=800%2C131&ssl=1
[3]: https://itsfoss.com/homebrew-linux/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/installing_jrnl.png?resize=800%2C490&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Writing_an_entry.png?resize=800%2C211&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Viewing_an_entry.png?resize=800%2C159&ssl=1
[7]: https://jrnl.sh/en/stable/overview/