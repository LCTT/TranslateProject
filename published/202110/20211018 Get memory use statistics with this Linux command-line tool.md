[#]: subject: "Get memory use statistics with this Linux command-line tool"
[#]: via: "https://opensource.com/article/21/10/memory-stats-linux-smem"
[#]: author: "Tomasz Waraksa https://opensource.com/users/tomasz"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13918-1.html"

用 smem 命令获取内存使用统计信息
======

> smem 命令允许你快速查看你的网页应用的内存使用情况。

![](https://img.linux.net.cn/data/attachment/album/202110/25/101843emjjkmvk88gvyqgv.jpg)

在我的编程工作中，我经常需要了解网页应用的内存使用情况。在深入研究细节和浏览器剖析工具之前，一个粗略的估计通常就足够了。

为了了解 Linux 或 macOS 上的内存使用情况，人们通常使用 [top][2] 或 [htop][3]。我很想看到一个单一的数字：一个进程占用了多少内存。但这些工具所显示的统计数据可能很难理解。对于网页浏览器来说，它甚至更加复杂，因为它们经常运行许多独立的进程。它们在 `top` 输出中显示为一个长长的列表，每一个都有自己的单独指标。

![Memory usage using htop][4]

### smem 命令

幸运的是有 [smem][6]，另一个用于查看内存使用统计的命令行工具。用你选择的包管理器安装它，例如：

```
sudo apt install smem
```

要获得 [Firefox][7] 的总内存使用量，请执行：

```
smem -c pss -P firefox -k -t | tail -n 1
```

这些开关做了什么？

  * `-c` 开关指定要显示的列。我只对 `pss` 列感兴趣，它显示一个进程分配的内存。
  * `-P` 开关过滤进程，只包括那些名字里有 `firefox` 的进程。
  * `-k` 开关显示以 MB/GB 为单位的内存使用情况，而不是单纯的字节数。
  * `-t` 开关显示总数。
  * `tail -n 1` 过滤器只输出最后一行，也就是总数的地方。

输出是非常简单的：

```
$ smem -t -k -c pss -P firefox | tail -n 1
4.9G
```

开门见山！而且，经过又一天忙碌的工作，打开了 50 多个选项卡，Firefox 仍然只使用 5 GB。看看吧，Google Chrome。

#### 用一个脚本更容易

为了方便起见，我创建一个名为 `memory-use` 的小脚本，它将进程名称作为参数。我把所有的脚本都放在 `~/bin` 里，所以：

```
echo 'smem -c pss -P "$1" -k -t | tail -n 1' > ~/bin/memory-use && chmod +x ~/bin/memory-use
```

现在我可以很容易地测量任何应用的内存使用：

```
memory-use firefox
memory-use chrome
memory-use slack
```

#### 还有更多！

该工具不仅可以显示总的内存使用情况。它甚至可以生成图形输出。

比如：

```
smem --pie name -c pss
```

显示类似这样的内容：

![Pie chart output from smem][8]

关于更多的细节，我建议查看 [smem 手册页][6]。

你可以在 <https://linoxide.com/memory-usage-reporting-smem/> 上找到另一个很棒的教程。

希望你喜欢!

本文最初发表在[作者的博客][9]上，并经许可转载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/memory-stats-linux-smem

作者：[Tomasz Waraksa][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomasz
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y (Programming at a browser, orange hands)
[2]: https://linux.die.net/man/1/top
[3]: https://linux.die.net/man/1/htop
[4]: https://opensource.com/sites/default/files/uploads/1_htop.png (Memory usage using htop)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://linux.die.net/man/8/smem
[7]: https://www.mozilla.org/en-US/firefox/
[8]: https://opensource.com/sites/default/files/uploads/2_smem-pie-chart.png (Pie chart output from smem)
[9]: https://letsdebug.it/post/26-measure-application-memory-use-on-linux/
