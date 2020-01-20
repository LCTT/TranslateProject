[#]: collector: (lujun9972)
[#]: translator: (LuuMing)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11693-1.html)
[#]: subject: (Easy means easy to debug)
[#]: via: (https://arp242.net/weblog/easy.html)
[#]: author: (Martin Tournoij https://arp242.net/)

简单就是易于调试
======

对于框架、库或者工具来说，怎样做才算是“简单”？也许有很多的定义，但我的理解通常是**易于调试**。我经常见到人们宣传某个特定的程序、框架、库、文件格式或者其它什么东西是简单的，因为他们会说“看，我只需要这么一点工作量就能够完成某项工作，这太简单了”。非常好，但并不完善。

你可能只编写一次软件，但几乎总要经历好几个调试周期。注意我说的调试周期并不意味着“代码里面有 bug 你需要修复”，而是说“我需要再看一下这份代码来修复 bug”。为了调试代码，你需要理解它，因此“易于调试”延伸来讲就是“易于理解”。

抽象使得程序易于编写，但往往是以难以理解为代价。有时候这是一个很好的折中，但通常不是。大体上，如果能使程序在日后易于理解和调试，我很乐意花更多的时间来写一些东西，因为这样实际上更省时间。

简洁并不是让程序易于调试的**唯一**方法，但它也许是最重要的。良好的文档也是，但不幸的是好的文档太少了。（注意，质量并**不**取决于字数！）

这种影响是真是存在的。难以调试的程序会有更多的 bug，即使最初的 bug 数量与易于调试的程序完全相同，而是因为修复 bug 更加困难、更花时间。

在公司的环境中，把时间花在难以修复的 bug 上通常被认为是不划算的投资。而在开源的环境下，人们花的时间会更少。（大多数项目都有一个或多个定期的维护者，但成百上千的贡献者提交的仅只是几个补丁）

---

这并不全是 1974 年由 Brian W. Kernighan 和 P. J. Plauger 合著的《<ruby>编程风格的元素<rt>The Elements of Programming Style</rt></ruby>》中的观点：

> 每个人都知道调试比起编写程序困难两倍。当你写程序的时候耍小聪明，那么将来应该怎么去调试？

我见过许多看起来写起来“极尽精妙”，但却导致难以调试的代码。我会在下面列出几种样例。争论这些东西本身有多坏并不是我的本意，我仅想强调对于“易于使用”和“易于调试”之间的折中。

* <ruby>ORM<rt>对象关系映射</rt></ruby> 库可以让数据库查询变得简单，代价是一旦你想解决某个问题，事情就变得难以理解。
* 许多测试框架让调试变得困难。Ruby 的 rspec 就是一个很好的例子。有一次我不小心使用错了，结果花了很长时间搞清楚**究竟**哪里出了问题（因为它给出错误提示非常含糊）。

    我在《[测试并非万能][1]》这篇文章中写了更多关于以上的例子。
* 我用过的许多 JavaScript 框架都很难完全理解。Clever（LCTT 译注：一种 JS 框架）的语句一向很有逻辑，直到某条语句不能如你预期的工作，这时你就只能指望 Stack Overflow 上的某篇文章或 GitHub 上的某个回帖来帮助你了。

    这些函数库**确实**让任务变得非常简单，使用它们也没有什么错。但通常人们都过于关注“易于使用”而忽视了“易于调试”这一点。
* Docker 非常棒，并且让许多事情变得非常简单，直到你看到了这条提示：

    ```
 ERROR: for elasticsearch Cannot start service elasticsearch:
oci runtime error: container_linux.go:247: starting container process caused "process_linux.go:258:
applying cgroup configuration for process caused \"failed to write 898 to cgroup.procs: write
/sys/fs/cgroup/cpu,cpuacct/docker/b13312efc203e518e3864fc3f9d00b4561168ebd4d9aad590cc56da610b8dd0e/cgroup.procs:
invalid argument\""
```

    或者这条：

    ```
ERROR: for elasticsearch Cannot start service elasticsearch: EOF
```

    那么...你怎么看？
* `Systemd` 比起 `SysV`、`init.d` 脚本更加简单，因为编写 `systemd` 单元文件比起编写 `shell` 脚本更加方便。这也是 Lennart Poetterin 在他的 [systemd 神话][2] 中解释 `systemd` 为何简单时使用的论点。

    我非常赞同 Poettering 的观点——也可以看 [shell 脚本陷阱][3] 这篇文章。但是这种角度并不全面。单元文件简单的背后意味着 `systemd` 作为一个整体要复杂的多，并且用户确实会受到它的影响。看看我遇到的这个[问题][4]和为它所做的[修复][5]。看起来很简单吗？


--------------------------------------------------------------------------------

via: https://arp242.net/weblog/easy.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: https://www.arp242.net/testing.html
[2]: http://0pointer.de/blog/projects/the-biggest-myths.html
[3]:https://www.arp242.net/shell-scripting-trap.html
[4]:https://unix.stackexchange.com/q/185495/33645
[5]:https://cgit.freedesktop.org/systemd/systemd/commit/?id=6e392c9c45643d106673c6643ac8bf4e65da13c1
