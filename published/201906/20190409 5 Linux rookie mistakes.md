[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10952-1.html)
[#]: subject: (5 Linux rookie mistakes)
[#]: via: (https://opensource.com/article/19/4/linux-rookie-mistakes)
[#]: author: (Jen Wike Huger https://opensource.com/users/jen-wike/users/bcotton/users/petercheer/users/greg-p/users/greg-p)

5 个 Linux 新手会犯的失误
======

> Linux 爱好者们分享了他们犯下的一些最大错误。

![](https://img.linux.net.cn/data/attachment/album/201906/09/103635akfkghwh5mp58g68.jpg)

终身学习是明智的 —— 它可以让你的思维敏捷，让你在就业市场上更具竞争力。但是有些技能比其他技能更难学，尤其是那些小菜鸟错误，当你尝试修复它们时可能会花费你很多时间，给你带来很大困扰。

以学习 [Linux][2] 为例。如果你习惯于在 Windows 或 MacOS 图形界面中工作，那么转移到 Linux，要将不熟悉的命令输入到终端中，可能会有很大的学习曲线。但是，其回报是值得的，因为已经有数以百万计的人们已经证明了这一点。

也就是说，这趟学习之旅并不是一帆风顺的。我们让一些 Linux 爱好者回想了一下他们刚开始使用 Linux 的时候，并告诉我们他们犯下的最大错误。

“不要进入[任何类型的命令行界面（CLI）工作]时就期望命令会以合理或一致的方式工作，因为这可能会导致你感到挫折。这不是因为设计选择不当 —— 虽然当你在键盘上敲击时就像在敲在你的脑袋上一样 —— 而是反映了这些系统是历经了几代的软件和操作系统的发展而陆续添加完成的事实。顺其自然，写下或记住你需要的命令，并且（尽量不要）在[事情不是你所期望的][3]时感到沮丧。” —— [Gina Likins] [4]

“尽可能简单地复制和粘贴命令以使事情顺利进行，首先阅读命令，至少对将要执行的操作有一个大致的了解，特别是如果有管道命令时，如果有多个管道更要特别注意。有很多破坏性的命令看起来无害 —— 直到你意识到它们能做什么（例如 `rm`、`dd`），而你不会想要意外破坏什么东西（别问我怎么知道）。” —— [Katie McLaughlin] [5]

“在我的 Linux 之旅的早期，我并不知道我所处在文件系统中的位置的重要性。我正在删除一些我认为是我的主目录的文件，我输入了 `sudo rm -rf *`，然后就删除了我系统上的所有启动文件。现在，我经常使用 `pwd` 来确保我在发出这样的命令之前确认我在哪里。幸运的是，我能够使用 USB 驱动器启动被搞坏的笔记本电脑并恢复我的文件。” —— [Don Watkins] [6]

“不要因为你认为‘权限很难理解’而你希望应用程序可以访问某些内容时就将整个文件系统的权限重置为 [777][7]。”—— [Matthew Helmke] [8]

“我从我的系统中删除一个软件包，而我没有检查它依赖的其他软件包。我只是让它删除它想删除要的东西，最终导致我的一些重要程序崩溃并变得不可用。” —— [Kedar Vijay Kulkarni] [9]

你在学习使用 Linux 时犯过什么错误？请在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/linux-rookie-mistakes

作者：[Jen Wike Huger][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike/users/bcotton/users/petercheer/users/greg-p/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://opensource.com/resources/linux
[3]: https://lintqueen.com/2017/07/02/learning-while-frustrated/
[4]: https://opensource.com/users/lintqueen
[5]: https://opensource.com/users/glasnt
[6]: https://opensource.com/users/don-watkins
[7]: https://www.maketecheasier.com/file-permissions-what-does-chmod-777-means/
[8]: https://twitter.com/matthewhelmke
[9]: https://opensource.com/users/kkulkarn
