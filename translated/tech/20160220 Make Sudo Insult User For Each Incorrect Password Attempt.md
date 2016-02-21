让sudo在用户输错密码时侮辱用户
===========================================================

你在Linux终端中会有很多的乐趣。我今天要讲的不是在[终端中跑火车](http://itsfoss.com/ubuntu-terminal-train/)。

我今天要讲的技巧可以放松你的心情。前面一篇文章中，你学习了[如何在命令行中增加sudo命令的超时](http://itsfoss.com/change-sudo-password-timeout-ubuntu/)。今天的文章中，我会向你展示如让sudo在输错密码的时候侮辱你（或者其他人）。


对我讲的感到疑惑？这里，让我们看下这张gif来了解sudo如何在你输错密码之后侮辱你的。

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux.gif)

现在，你为什要这么做？毕竟，侮辱不会让你的一天开心，不是么？

对我来说，一点小技巧都是有趣的，并且要比以前的“密码错误”的错误提示更有趣。另外，我可以向我的朋友展示娱乐（这个例子中是通过自由开源软件）。我很肯定你有你自己的里有来使用这个技巧的。

## 在sudo中启用侮辱

你可以在`sudo`配置中增加下面的行来启用侮辱功能：

```
Defaults 	insults
```

让我们看看该如何做。打开终端并使用下面的命令：

```
sudo visudo
```

这会在[nano](http://www.nano-editor.org/)中打开配置文件。使得，我知道传统的‘visudo’应该在vi中打开`/etc/sudoers` 文件，但是Ubuntu及基于它的发行版会使用nano打开。由于我们再讨论vi，这里有一份[vi速查表](http://itsfoss.com/download-vi-cheat-sheet)可以在你决定使用vi的时候使用。

回到编辑sudeors文件界面，你需要找出Defaults所在的行。幸运的是，只需要在文件的开头加上“Defaults insults”，就像这样：

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux-Mint.png)

如果你正在使用nano，使用`Ctrl+X`来退出编辑器。在退出的时候，它会询问你是否保存更改。要保存更改，按下“Y”。

一旦你保存了sudoers文件之后，打开终端并在任何命令中使用sudo。故意输错密码病享受辱骂：）

sudo可能会讨厌的。看见没，他甚至在我再次输错之后威胁我。哈哈

![](http://itsfoss.com/wp-content/uploads/2016/02/sudo-insults-Linux-Mint-1.jpeg)

如果你喜欢这个终端技巧，你也可以查看[其他终端技巧的文章](http://itsfoss.com/category/terminal-tricks/)。如果你有其他有趣的技巧，在评论中分享。 


------------------------------------------------------------------------------

via: http://itsfoss.com/sudo-insult-linux/

作者：[ABHISHEK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
