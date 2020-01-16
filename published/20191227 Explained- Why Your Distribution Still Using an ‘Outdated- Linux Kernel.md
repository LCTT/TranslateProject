[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11791-1.html)
[#]: subject: (Explained! Why Your Distribution Still Using an ‘Outdated’ Linux Kernel?)
[#]: via: (https://itsfoss.com/why-distros-use-old-kernel/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

为什么你的发行版仍然在使用“过时的”Linux 内核？
======

![](https://img.linux.net.cn/data/attachment/album/202001/16/225806jbqyacu3loolobae.png)

[检查一下你的系统所使用的 Linux 内核版本][1]，你十有八九会发现，按照 Linux 内核官网提供的信息，该内核版本已经达到使用寿命终期（EOL）了。

一个软件一旦达到了使用寿命终期，那么就意味着它再也不会得到 bug 修复和维护了。

这自然会引发一连串问题：为什么我的 Linux 发行版会使用一个已经达到使用寿命终期的内核呢？这样做有没有安全风险？我的系统还安全吗？

下面将逐一解答这些问题。	

> **总结**
> 
> 上游内核维护与你的发行版的内核维护是两个不同的概念。
>
> 例如，根据 Linux 内核官网，Linux 内核 4.15 版本可能已经达到使用寿命终期了，但是在 2023 年 4 月之前，Ubuntu 18.04 长期维护版本将会继续使用这个版本，并通过向后移植安全补丁和修复 bug 来提供维护。

### 检查 Linux 内核版本，以及是否达到使用寿命终期

首先，查看你的系统所使用的 Linux 内核版本：

```
uname -r
```

我使用的是 Ubuntu 18.04，输出的 Linux 内核版本如下：

```
abhishek@itsfoss:~$ uname -r
5.0.0-37-generic
```

接下来，可以到 [Linux 内核官网][2]上看看哪些 Linux 内核版本仍然在维护状态。在网站主页上就可以看到相关信息。

你看到的内核版本状态应该类似于下图：

![Linux 内核状态][3]

如果你的内核版本没有列在内核官网主页上，就说明该版本已经达到了使用寿命终期。

可以看到，5.0 内核版本并不在列，这说明该内核版本已经不再得到维护。事实上，该版本在 [2019 年 6 月就已经达到使用寿命终期了][4]。

不幸的是，Linux 内核的生命周期没有任何规律可循。不是说常规的内核稳定发布版可以得到 X 月的维护、长期维护版本（LTS）可以得到 Y 年的维护。没有这回事。

根据实际需求，可能会存在内核的多个 LTS 版本，其使用寿命终期各不相同。在[这个页面][5]上可以查到这些 LTS 版本的相关信息，包括计划的使用寿命终期。

那么问题来了：既然 Linux 内核官网上明确表示 5.0 版本的内核已经达到了使用寿命终期，Ubuntu 为什么还在提供这个内核版本呢？

### 你的发行版使用的 Linux 内核已经达到了使用寿命终期，但是没关系！

![][6]

你是否想过，为什么 Ubuntu/Debian/Fedora 等发行版被称为 Linux “发行版”？这是因为，它们“发行” Linux 内核。

这些发行版会对 Linux 内核进行不同的修改，并添加各种 GUI 元素（包括桌面环境、显示服务器等）以及软件，然后再呈现给用户。

按照通常的工作流，Linux 发行版会选择一个内核，提供给其用户，然后在接下来的几个月、几年中，甚至是达到内核的使用寿命终期之后，仍然会继续使用该内核。

这样能够保障安全吗？其实是可以的，因为 **发行版会通过向后移植全部的重要修补来维护内核**。

换句话说，你的 Linux 发行版会确保 Linux 内核没有漏洞和 bug，并且已经通过向后移植获得了重要的新特性。在“过时的旧版本 Linux 内核”上，其实有着数以千计的改动。

如果 Linux 内核网站上说某个内核版本已经达到了使用寿命终期，那么就意味着 Linux 内核的核心维护团队不会再对该内核版本进行升级和打补丁了。

但与此同时，Debian/Ubuntu 或者其他发行版的开发者们会继续工作，通过从（由内核核心团队维护的）更新的内核版本中迁移相关的修改，维持这个老版本的生命力。

重点在于，即使你的发行版看上去是在使用一个已经过时的 Linux 内核，其实该内核也得到了良好的维护，并非是真的过时了。

### 你是否应该使用最新的稳定内核版本？

![][7]

新的 Linux 内核稳定版本每隔 2 到 3 个月发布一次，有不少用户跃跃欲试。

实话说，除非有十分充分的理由，否则不应该使用最新版本的稳定内核。你使用的发行版并不会提供这个选项，你也不能指望通过在键盘上敲出 `sudo apt give-me-the-latest-stable-kernel` 解决问题。

此外，手动[安装主流 Linux 内核版本][8]本身就是一个挑战。即使安装成功，之后每次发布 bug 修复的时候，负责更新内核的就会是你了。此外，当新内核达到使用寿命终期之后，你就有责任将它升级到更新的内核版本了。和常规的 [Ubuntu 更新][9]不同，内核升级无法通过 `apt upgrade` 完成。

同样需要记住的是，切换到主流内核之后，可能就无法使用你的发行版提供的一些驱动程序和补丁了。

正如 [Greg Kroah-Hartman][10]所言，“**你能使用的最好的内核，就是别人在维护的内核。**”除了你的 Linux 发行版之外，又有谁更胜任这份工作呢！

希望你对这个主题已经有了更好的理解。下回发现你的系统正在使用的内核版本已经达到使用寿命终期的时候，希望你不会感到惊慌失措。

欢迎在下面的评论区中留下你的疑问或建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/why-distros-use-old-kernel/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[2]: https://www.kernel.org/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/linux-kernel-status.jpg?ssl=1
[4]: http://lkml.iu.edu/hypermail/linux/kernel/1906.0/02354.html
[5]: https://www.kernel.org/category/releases.html
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/Keep_Calm_and_Trust_Your_Distribution.png?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/using_latest_kernel.png?ssl=1
[8]: https://wiki.ubuntu.com/Kernel/MainlineBuilds
[9]: https://itsfoss.com/update-ubuntu/
[10]: https://en.wikipedia.org/wiki/Greg_Kroah-Hartman
