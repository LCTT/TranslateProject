输错密码？这个 sudo 会“嘲讽”你
===========================================================

你在 Linux 终端中会有很多的乐趣。我今天要讲的不是在[终端中跑火车](http://itsfoss.com/ubuntu-terminal-train/)。

我今天要讲的技巧可以放松你的心情。前面一篇文章中，你学习了[如何在命令行中增加 sudo 命令的超时](http://itsfoss.com/change-sudo-password-timeout-ubuntu/)。今天的文章中，我会向你展示如何让 sudo 在输错密码的时候“嘲讽”你（或者其他人）。

对我讲的感到疑惑？这里，让我们看下这张 gif 来了解下 sudo 是如何在你输错密码之后“嘲讽”你的。

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux.gif)

那么，为什么要这么做？毕竟，“嘲讽”不会让你的一天开心，不是么？

对我来说，一点小技巧都是有趣的，并且要比以前的“密码错误”的错误提示更有趣。另外，我可以向我的朋友展示来逗弄他们（这个例子中是通过自由开源软件）。我很肯定你有你自己的理由来使用这个技巧的。

## 在 sudo 中启用“嘲讽”

你可以在`sudo`配置中增加下面的行来启用“嘲讽”功能：

```
Defaults 	insults
```

让我们看看该如何做。打开终端并使用下面的命令：

```
sudo visudo
```

这会在 [nano](http://www.nano-editor.org/)中打开配置文件。

> 是的，我知道传统的 ‘visudo’ 应该在 vi 中打开 `/etc/sudoers` 文件，但是 Ubuntu 及基于它的发行版会使用 nano 打开。由于我们在讨论vi，这里有一份 [vi 速查表](http://itsfoss.com/download-vi-cheat-sheet)可以在你决定使用 vi 的时候使用。

回到编辑 sudeors 文件界面，你需要找出 Defaults 所在的行。简单的很，只需要在文件的开头加上`Defaults insults`，就像这样：

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux-Mint.png)

如果你正在使用 nano，使用`Ctrl+X`来退出编辑器。在退出的时候，它会询问你是否保存更改。要保存更改，按下“Y”。

一旦你保存了 sudoers 文件之后，打开终端并使用 sudo 运行各种命令。故意输错密码并享受嘲讽吧：）

sudo 可能会生气的。看见没，他甚至在我再次输错之后威胁我。哈哈。

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux-Mint-1.jpeg)

如果你喜欢这个终端技巧，你也可以查看[其他终端技巧的文章](http://itsfoss.com/category/terminal-tricks/)。如果你有其他有趣的技巧，在评论中分享。 

------------------------------------------------------------------------------

via: http://itsfoss.com/sudo-insult-linux/

作者：[ABHISHEK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
