将 Ubuntu 和 FreeBSD 融合在一起的发行版 ：UbuntuBSD
========================================================

![](http://itsfoss.com/wp-content/uploads/2016/03/UbuntuBSD.jpg)

不止是在 Linux 的内核上面你才能体验到 Ubuntu 的快捷方便，伙计们。UbuntuBSD 可以让你在 FreeBSD 的内核上面也能体验到那种方便快捷。

UbuntuBSD 称自己是 ‘Unix for human beings’，这一点也不人惊讶。如过你能想起来的话，Ubuntu 使用的标语是 ‘Linux for human beings’ 并且在过去的 11 年里它确实让一个‘正常人’有可能用上 Linux。

UbuntuBSD 有着同样的想法。它想让新手能够接触到 Unix ，以及能使用它——如果我能这样说的话。至少，这就是它的目标。

### 什么是 BSD ？ 它和 Linux 有哪些不同？ ###

如果你是新手，那么你需要知道 [Unix 和 Linux 的区别][2].

在 Linux 出现之前，Unix 由 [AT&T][3] 的  [Ken Thompson][4]、 [Denis Ricthie][5] 以及他们的团队设计。这是在可以算作计算机上古时期的 1970 发生的事。当你知道 Unix 是一个闭源的，有产权的操作系统时你可能会感到惊讶。AT&T  给了很多第三方许可，包括学术机构和企业。

美国加州大学伯克利分校是其中一个拿到许可的学术机构。在那里开发的 Unix 系统叫做  [BSD (Berkeley Software Distribution)][6]。BSD 的最出名的开源分支是  [FreeBSD][7]，另一个最流行的闭源分支是苹果的 Mac OS X。

在 1991 年。芬兰的计算机系大学生 Linus Torvalds 从头写了自己的 Unix 系统的复制品。这就是我们今天熟知的 Linux 内核。Linux 的发行版在内核的基础上添加了图形界面、GNU 的那一套（cp, mv, ls,date, bash 什么的）、安装/管理工具，GNU C/C++ 编译器以及很多应用。

### UbuntuBSD 不是这种发行版的开端

在你知道了 Linux，Unix，FreeBSD 之间的区别之后。我要告诉你的是 UbuntuBSD 不是第一个要在 FreeBSD 内核上作出类似 Linux 的感觉的发行版。

当 Debian 选择使用 [systemd][8] 之后，[Debian GNU/kFreeBSD][9]诞生了。它使用的不是通常的 Linux 内核，而是 将 Debian 移植到了 FreeBSD 内核上。

与 Debian GNU/kFreeBSD 类似，UbuntuBSD 是将 Ubuntu 移植到了 FreeBSD 内核上。

### UbuntuBSD Beta 版代号： Escape From SystemD 

UbuntuBSD 的第一个版本已经发布，代号为“Escape From SystemD ”。它基于 Ubuntu 15.10 和 FreeBSD 10.1.

它的默认桌面环境为 [Xfce][10] ，桌面以及服务器均可使用。 对于 [ZFS][11] 的支持也包含在这个版本中。开发者还提供了一个文本界面的安装器。

### 想试试？

我不建议任何人马上就去开心地去尝试这个系统。它仍在开发并且安装器还是文本界面的。不过如果你足够自信的话，直接去下载体验吧。但是如果你是新手的话，请等一段时间，至少不要现在就去尝试：

[UbuntuBSD][12]

你认为 UbuntuBSD 怎么样？ 兹瓷不兹瓷它？

--------------------------------------------------------------------------------

via: http://itsfoss.com/ubuntubsd-ubuntu-freebsd/

作者：[ABHISHEK][a]
译者：[name1e5s](https://github.com/name1e5s)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]: http://itsfoss.com/tag/linux/
[2]: https://linux.cn/article-3159-1.html
[3]: https://en.wikipedia.org/wiki/AT%26T
[4]: https://en.wikipedia.org/wiki/Ken_Thompson
[5]: https://en.wikipedia.org/wiki/Dennis_Ritchie
[6]: http://www.bsd.org/
[7]: https://www.freebsd.org/
[8]: https://www.freedesktop.org/wiki/Software/systemd/
[9]: https://www.debian.org/ports/kfreebsd-gnu/
[10]: http://www.xfce.org/
[11]: https://en.wikipedia.org/wiki/ZFS
[12]: https://sourceforge.net/projects/ubuntubsd/
