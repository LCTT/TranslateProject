[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11629-1.html)
[#]: subject: (Switching from Python 2 to Python 3: What you need to know)
[#]: via: (https://opensource.com/article/19/11/end-of-life-python-2)
[#]: author: (Katie McLaughlin https://opensource.com/users/glasnt)

从 Python 2 切换到 Python 3 你所需要了解的
======

> Python 2 将在几周内走到生命终点，这篇文章是你迁移到 Python 3 之前应该知道的。

![](https://img.linux.net.cn/data/attachment/album/201912/01/095336lbppn8qp1nnnwqqp.jpg)

从 2020 年 1 月 1 日开始，Python 2.7 将不再得到正式支持。在此日期之后，将会发布一个[最终错误修复][2]计划，但是仅此而已。

Python 2 的生命终点（EOL）对你意味着什么？如果正在运行着 Python 2，你需要迁移。

### 是谁决定 Python 2 的生命终点？

在 [2012][3] 年，维护 Python 编程语言的团队审查了其选项。有两个越来越不同的代码库，Python 2 和 Python 3。这两者都很流行，但是较新的版本并未得到广泛采用。

除了 Python 3 中完全重写的 Unicode 支持改变了处理数据的底层方式造成的断层，这个主要版本的变化还一次性出现了一些非向后兼容的更改。这种断层的决定成文于 [2006 年][4]。为了减轻该断层的影响，Python 2 继续保持了维护，并向后移植了一些 Python 3 的功能。为了进一步帮助社区过渡，EOL 日期[从 2015 年延长至 2020 年][5]，又延长了五年。

该团队知道，维护不同的代码库是必须解决的麻烦。最终，他们[宣布了][6]一项决定：

>“我们是制作和照料 Python 编程语言的志愿者。我们已决定 2020 年 1 月 1 日将是我们停止使用 Python 2 的日子。这意味着在这一天之后，即使有人发现其中存在安全问题，我们也将不再对其进行改进。你应尽快升级到 Python 3。”

[Nick Coghlan][7] 是 CPython 的核心开发人员，也是 Python 指导委员会的现任成员，[在他的博客中添加了更多信息][8]。由 [Barry Warsaw][10]（也是 Python 指导委员会的成员）撰写的 [PEP 404][9] 详细说明了 Python 2.8 永远不会面世的原因。

### 有人还在支持 Python 2 吗？

提供者和供应商对 Python 2 的支持会有所不同。[Google Cloud 宣布了][11]它计划未来如何支持 Python 2。红帽还[宣布了红帽企业 Linux（RHEL）的计划][12]，而 AWS 宣布了 AWS 命令行界面和 [SDK][14] 的[次要版本更新要求][13]。

你还可以阅读 [Vicki Boykis][16] 在 Stack Overflow 撰写的博客文章“[为什么迁移到 Python 3 需要这么长时间？][15]”，其中她指出了采用 Python 3 缓慢的三个原因。

### 使用 Python 3 的原因

不管是否有持续的支持，尽快迁移到 Python 3 是一个好主意。Python 3 将继续受到支持，它具有 Python 2 所没有的一些非常优雅的东西。

最近发布的 [Python 3.8][17] 包含 [海象运算符][19]、[位置参数][20]和[自描述的格式化字符串][21]等[功能][18]。Python 3 的早期版本引入的[功能][22]，例如 [异步 IO][23]、[格式化字符串][24]、[类型提示][25] 和 [pathlib][26]，这里只提及了一点点。

下载最多的前 360 个软件包[已迁移到 Python 3][27]。你可以使用 [caniusepython3][28] 软件包检查你的 `requirements.txt` 文件，以查看你依赖的任何软件包是否尚未迁移。

### 将 Python 2 移植到 Python 3 的参考资源

有许多参考资源可简化你向 Python 3 的迁移。例如，“[将 Python 2 移植到 Python 3 指南][29]”列出了许多工具和技巧，可帮助你实现与 Python 2/3 单一源代码的兼容性。在 [Python3statement.org][30] 上也有一些有用的技巧。

[Dustin Ingram][31] 和 [Chris Wilcox][32] 在 [Cloud Next '19][33]上作了一个演讲，详细介绍了向 Python 3 过渡的一些动机和迁移模式。[Trey Hunner][34] 在 [PyCon 2018 演讲][35]上介绍了 Python 3 最有用的功能，鼓励你进行迁移，以便你可以利用它们。

### 加入我们！

距 2020 年 1 月 1 日仅有几周了。如果你需要每天提醒一下它即将到来的时间（并且你使用 Twitter 的话），请关注 [Python 2 日落倒计时][36] Twitter 机器人。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/end-of-life-python-2

作者：[Katie McLaughlin][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/glasnt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/govt_a%20new%20dawn.png?itok=b4zU-VAY (A sunrise)
[2]: https://www.python.org/dev/peps/pep-0373/#maintenance-releases
[3]: https://github.com/python/peps/commit/a733bc927acbca16bfa3de486fb2c7d3f767a748
[4]: https://www.python.org/dev/peps/pep-3000/#compatibility-and-transition
[5]: https://github.com/python/peps/commit/f82462002b86feff36215b4230be28967039b0cc
[6]: https://www.python.org/doc/sunset-python-2/
[7]: https://twitter.com/ncoghlan_dev
[8]: http://python-notes.curiousefficiency.org/en/latest/python3/questions_and_answers.html
[9]: https://www.python.org/dev/peps/pep-0404/
[10]: https://twitter.com/pumpichank
[11]: https://cloud.google.com/python/docs/python2-sunset/?utm_source=osdc&utm_medium=blog&utm_campaign=pysunset
[12]: https://access.redhat.com/solutions/4455511
[13]: https://aws.amazon.com/blogs/developer/deprecation-of-python-2-6-and-python-3-3-in-botocore-boto3-and-the-aws-cli/
[14]: https://aws.amazon.com/sdk-for-python/
[15]: https://stackoverflow.blog/2019/11/14/why-is-the-migration-to-python-3-taking-so-long/
[16]: https://twitter.com/vboykis
[17]: https://www.python.org/downloads/
[18]: https://docs.python.org/3.8/whatsnew/3.8.html
[19]: https://docs.python.org/3.8/whatsnew/3.8.html#assignment-expressions
[20]: https://docs.python.org/3.8/whatsnew/3.8.html#positional-only-parameters
[21]: https://docs.python.org/3.8/whatsnew/3.8.html#f-strings-support-for-self-documenting-expressions-and-debugging
[22]: https://docs.python.org/3.8/whatsnew/index.html
[23]: https://docs.python.org/3.8/library/asyncio.html#module-asyncio
[24]: https://docs.python.org/3.7/whatsnew/3.6.html#pep-498-formatted-string-literals
[25]: https://docs.python.org/3.7/whatsnew/3.5.html#pep-484-type-hints
[26]: https://docs.python.org/3.8/library/pathlib.html#module-pathlib
[27]: http://py3readiness.org/
[28]: https://pypi.org/project/caniusepython3/
[29]: https://docs.python.org/3/howto/pyporting.html
[30]: https://python3statement.org/practicalities/
[31]: https://twitter.com/di_codes
[32]: https://twitter.com/chriswilcox47
[33]: https://www.youtube.com/watch?v=Bye7Rms0Vgw&utm_source=osdc&utm_medium=blog&utm_campaign=pysunset
[34]: https://twitter.com/treyhunner
[35]: https://www.youtube.com/watch?v=klaGx9Q_SOA
[36]: https://twitter.com/python2sunset
