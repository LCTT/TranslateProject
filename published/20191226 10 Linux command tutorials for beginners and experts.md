[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12011-1.html)
[#]: subject: (10 Linux command tutorials for beginners and experts)
[#]: via: (https://opensource.com/article/19/12/linux-commands)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

10 篇对初学者和专家都有用的 Linux 命令教程
======

> 在这有关 Linux 命令的十大文章中，了解如何使 Linux 发挥所需的作用。

![](https://img.linux.net.cn/data/attachment/album/202003/19/095932xc64xw7cwqlolale.jpg)

**很好地**使用 Linux 意味着了解有哪些命令以及它们可以为你执行的功能。

### 《在 Linux 命令行下使用“原力”》

<ruby>原力<rt>force</rt></ruby>有光明的一面和黑暗的一面。正确理解这个对于真正掌握它至关重要。Alan Formy-Duval 在他的文章《[在 Linux 命令行下使用“原力”][2]》中，解释了一些流行的、有时是危险的命令的 `-f` 选项（也称为 `--force`）。

### 《Linux useradd 命令介绍》

共享帐户是一个坏主意。相反，请使用典型的 `useradd` 命令为不同的人（甚至是不同的角色）分配单独的帐户。作为其经典的 Linux 管理基础系列的一部分，Alan Formy-Duval 提供了《[Linux useradd 命令介绍][3]》，并且像往常一样，他用**朴实明白的语言**对其进行了解释，以便新老管理员都可以理解。

### 《用 Linux 命令显示硬件信息》

机器**里面**是什么？有时不使用螺丝刀检查硬件很有用。无论是你正在使用的计算机，还是在商店购买前进行测试的计算机、或者是正在尝试维修的计算机，在《[用 Linux 命令显示硬件信息][4]》中，Howard Fosdick 提供了或流行或晦涩难懂的命令，以帮助你深入了解计算机的硬件信息。

### 《如何在 Linux 上使用 gocryptfs 加密文件》

从社会保险号到个人信件再到亲人，我们的文件中包含了许多私人数据。在《[如何在 Linux 上使用 gocryptfs 加密文件][5]》中，Brian "Bex" Exelbierd 解释了如何保持**隐私*的私密性。此外，他展示了一种加密文件的方式，这种方式对你现有的工作流程几乎没有影响。这不是复杂的 PGP 风格的密钥管理和后台密钥代理的难题，这是快速、无缝和安全的文件加密。

### 《如何使用 rsync 的高级用法进行大型备份》

在新的一年中，许多人会下定决心要更加努力地进行备份。Alan Formy-Duval 早在几年前就已经做出了解决方案，因为在《[如何使用 rsync 的高级用法进行大型备份][6]》中，他表现出对文件同步命令的极其熟悉。你可能不会马上记住所有语法，但其思路是读取和处理选项、构造备份命令，然后使其自动化。这是使用 `rsync` 的明智方法，也是可靠地执行备份的**唯一**方法。

### 《在 Linux 命令行使用 more 查看文本文件》

在 Scott Nesbitt 的文章《[在 Linux 命令行使用 more 查看文本文件][7]》中，古老而良好的默认分页器 `more` 引起了人们的关注。许多人安装和使用 `less`，因为它比 `more` 更灵活。但是，随着越来越多的系统在新出现的容器中实现，有时甚至不存在像 `less` 或 `most` 之类的新颖的豪华工具。了解和使用`more` 很简单，这是常见的默认设置，并且是生产系统最后的调试工具。

### 《关于 sudo 你可能不知道的》

`sudo` 命令因其过失而闻名。人们知道 `sudo` 一词，我们大多数人认为我们知道它的作用。我们的观点是正确的，但是正如 Peter Czanik 在他的文章《[关于 sudo 你可能不知道的][8]》中所揭示的那样，该命令所包含的不仅仅是“<ruby>西蒙说的<rt>Simon says</rt></ruby>”（LCTT 译注：国外的一个儿童游戏）。就像这个经典的童年游戏一样，`sudo` 命令功能强大，也容易犯愚蠢的错误 —— 有更多的可能产生可怕都后果，而这是你绝不想遇上的事情！

### 《怎样用 Bash 编程：语法和工具》

如果你是 Linux、BSD 或 Mac（以及近来的 Windows）用户，你也许使用过交互式 Bash shell。它是快速的、一次性命令的绝佳 shell，这就是为什么这么多 Linux 用户喜欢将其用作主要用户界面的原因。但是，Bash 不仅仅是个命令提示符。它也是一种编程语言，如果你已经在使用 Bash 命令，那么自动化的道路从未如此简单过。在 David Both 的出色作品《[怎样用 Bash 编程：语法和工具][9]》中对其进行全面了解。

### 《精通 Linux 的 ls 命令》

`ls` 命令是那些两个字母的命令之一。单字母命令是针对慢速终端的优化，因为慢速终端的输入的每个字母都会导致明显的延迟，而这对于懒惰的打字员来说也是不错的奖励。一如既往地，Seth Kenlon 清晰实用地解释了你可以怎样《[精通 Linux 的 ls 命令][10]》。最重要的是，在“一切都是文件”的系统中，列出文件至关重要。

### 《Linux cat 命令入门》

`cat` 命令（con*cat*enate 的缩写）看似简单。无论是使用它来快速查看文件的内容还是将内容通过管道传输到另一个命令，你都可能没有充分利用 `cat` 的功能。Alan Formy-Duval 的《[Linux cat 命令入门][11]》提供了一些新思路，可以使你没有打开文件的感觉就可以看到文件内容。另外，了解各种有关 `zcat` 的知识，这样你就可以无需解压缩就可以得到压缩文件的内容！这是一件小而简单的事情，但是**这**是使 Linux 很棒的原因。

### 继续旅程

不要让这些关于 Linux 命令的 10 篇最佳文章成为你的旅程终点。关于 Linux 及其多才多艺的提示符，还有更多值得去发现，因此，请继续关注以获取更多知识。而且，如果你想让我们介绍一个 Linux 命令，请在评论中告诉我们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-commands

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://linux.cn/article-10881-1.html
[3]: https://linux.cn/article-11756-1.html
[4]: https://linux.cn/article-11422-1.html
[5]: https://opensource.com/article/19/8/how-encrypt-files-gocryptfs
[6]: https://linux.cn/article-10865-1.html
[7]: https://linux.cn/article-10531-1.html
[8]: https://linux.cn/article-11595-1.html
[9]: https://linux.cn/article-11552-1.html
[10]: https://linux.cn/article-11159-1.html
[11]: https://opensource.com/article/19/2/getting-started-cat-command
[12]: https://opensource.com/how-submit-article
