[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10824-1.html)
[#]: subject: (Ping Multiple Servers And Show The Output In Top-like Text UI)
[#]: via: (https://www.ostechnix.com/ping-multiple-servers-and-show-the-output-in-top-like-text-ui/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

ping 多台服务器并在类似 top 的界面中显示
======

![Ping Multiple Servers And Show The Output In Top-like Text UI][1]

不久前，我们写了篇关于 [fping][2] 的文章，该程序能使我们能够同时 ping 多台主机。与传统的 `ping` 不同，`fping` 不会等待一台主机的超时。它使用循环法，这表示它将 ICMP Echo 请求发送到一台主机，然后转到另一台主机，最后一次显示哪些主机开启或关闭。今天，我们将讨论一个名为 `pingtop` 的类似程序。顾名思义，它会一次 ping 多台服务器，并在类似 `top` 的终端 UI 中显示结果。它是用 Python 写的自由开源程序。

### 安装 pingtop

可以使用 `pip` 安装 `pingtop`，`pip` 是一个软件包管理器，用于安装用 Python 开发的程序。确保已在 Linux 中安装了 Python 3.7.x 和 pip。

要在 Linux 上安装 `pip`，请参阅以下链接。

* [如何使用 pip 管理 Python 包][3]

安装 `pip` 后，运行以下命令安装 `pingtop`：

```
$ pip install pingtop
```

现在让我们继续使用 `pingtop` ping 多个系统。

### ping 多台服务器并在类似 top 的终端 UI 中显示

要 ping 多个主机/系统，请运行：

```
$ pingtop ostechnix.com google.com facebook.com twitter.com
```

现在，你将在一个漂亮的类似 `top` 的终端 UI 中看到结果，如下所示。

![][4]

*使用 pingtop ping 多台服务器*


建议阅读：

 * [一些你可能想知道的替代 “top” 命令的程序][5]

我个人目前没有使用 pingtop 的情况。但我喜欢在这个在文本界面中展示 ping 命令输出的想法。试试看它，也许有帮助。

就是这些了。还有更多好东西。敬请期待！干杯！

资源：

  * [pingtop GitHub 仓库][6]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ping-multiple-servers-and-show-the-output-in-top-like-text-ui/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/pingtop-720x340.png
[2]: https://www.ostechnix.com/ping-multiple-hosts-linux/
[3]: https://linux.cn/article-10110-1.html
[4]: http://www.ostechnix.com/wp-content/uploads/2019/04/pingtop-1.gif
[5]: https://www.ostechnix.com/some-alternatives-to-top-command-line-utility-you-might-want-to-know/
[6]: https://github.com/laixintao/pingtop
