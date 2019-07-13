vrms 助你在 Debian 中查找非自由软件
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/vrms-1-720x340.png)

有一天，我在 Digital ocean 上读到一篇有趣的指南，它解释了[自由和开源软件之间的区别][1]。在此之前，我认为两者都差不多。但是，我错了。它们之间有一些显著差异。在阅读那篇文章时，我想知道如何在 Linux 中找到非自由软件，因此有了这篇文章。

### 向 “Virtual Richard M. Stallman” 问好，这是一个在 Debian 中查找非自由软件的 Perl 脚本

**Virtual Richard M. Stallman** ，简称 **vrms**，是一个用 Perl 编写的程序，它在你基于 Debian 的系统上分析已安装软件的列表，并报告所有来自非自由和 contrib 树的已安装软件包。对于那些不太清楚区别的人，自由软件应该符合以下[**四项基本自由**][2]。

  * **自由 0** – 不管任何目的，随意运行程序的自由。
  * **自由 1** – 研究程序如何工作的自由，并根据你的需求进行调整。访问源代码是一个先决条件。
  * **自由 2** – 重新分发副本的自由，这样你可以帮助别人。
  * **自由 3** – 改进程序，并向公众发布改进的自由，以便整个社区获益。访问源代码是一个先决条件。

任何不满足上述四个条件的软件都不被视为自由软件。简而言之，**自由软件意味着用户有运行、复制、分发、研究、修改和改进软件的自由。**

现在让我们来看看安装的软件是自由的还是非自由的，好么？

vrms 包存在于 Debian 及其衍生版（如 Ubuntu）的默认仓库中。因此，你可以使用 `apt` 包管理器安装它，使用下面的命令。

```
$ sudo apt-get install vrms
```

安装完成后，运行以下命令，在基于 debian 的系统中查找非自由软件。

```
$ vrms
```

在我的 Ubuntu 16.04 LTS 桌面版上输出的示例。

```
    Non-free packages installed on ostechnix
unrar Unarchiver for .rar files (non-free version)
1 non-free packages, 0.0% of 2103 installed packages.
```

![][4]

如你在上面的截图中看到的那样，我的 Ubuntu 中安装了一个非自由软件包。

如果你的系统中没有任何非自由软件包，则应该看到以下输出。

```
No non-free or contrib packages installed on ostechnix! rms would be proud.
```

vrms 不仅可以在 Debian 上找到非自由软件包，还可以在 Ubuntu、Linux Mint 和其他基于 deb 的系统中找到非自由软件包。

**限制**

vrms 虽然有一些限制。就像我已经提到的那样，它列出了安装的非自由和 contrib 部分的软件包。但是，某些发行版并未遵循确保专有软件仅在 vrms 识别为“非自由”的仓库中存在，并且它们不努力维护这种分离。在这种情况下，vrms 将不能识别非自由软件，并且始终会报告你的系统上安装了非自由软件。如果你使用的是像 Debian 和 Ubuntu 这样的发行版，遵循将专有软件保留在非自由仓库的策略，vrms 一定会帮助你找到非自由软件包。

就是这些。希望它是有用的。还有更好的东西。敬请关注！

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-vrms-program-helps-you-to-find-non-free-software-in-debian/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.digitalocean.com/community/tutorials/Free-vs-Open-Source-Software
[2]:https://www.gnu.org/philosophy/free-sw.html
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2018/04/vrms.png
