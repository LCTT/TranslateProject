命令行基础工具的更佳替代品
================================================================================

命令行听起来有时候会很吓人，特别是在刚刚接触的时候，你甚至可能做过有关命令行的噩梦。然而渐渐地，我们都会意识到命令行实际上并不是那么吓人，反而是非常有用。实际上，没有命令行正是每次我使用 Windows 时让我感到崩溃的地方。这种感觉上的变化是因为命令行工具实际上是很智能的。 你在任何一个 Linux 终端上所使用的基本工具功能都是很强大的， 但还远说不上是足够强大。 如果你想使你的命令行生涯更加愉悦， 这里有几个程序你可以下载下来替换原来的默认程序， 它还可以给你提供比原始程序更多的功能。

### dfc ###

作为一个 LVM 使用者, 我非常喜欢随时查看我的硬盘存储器的使用情况. 我也从来没法真正理解为什么在 Windows 上我们非得打开资源管理器来查看电脑的基本信息。在 Linux 上， 我们可以使用如下命令：

    $ df -h

![](https://farm4.staticflickr.com/3858/14768828496_c8a42620a3_z.jpg)

该命令可显示电脑上每一分卷的大小、 已使用空间、 可用空间、 已使用空间百分比和挂载点。 注意， 我们必须使用 "-h" 选项使得所有数据以可读形式显示(使用 GiB 而不是 KiB)。 但你可以使用 [dfc][1] 来完全替代 df， 它不需要任何额外的选项就可以得到 df 命令所显示的内容， 并且会为每个设备绘制彩色的使用情况图, 因此可读性会更强。

![](https://farm6.staticflickr.com/5594/14791468572_a84d4b6145_z.jpg)

另外， 你可以使用 "-q" 选项将各分卷排序， 使用 "-u" 选项指定你希望使用的单位， 甚至可以使用 "-e" 选项来获得 csv 或者 html 格式的输出.

### dog ###

Dog 比 cat 好， 至少这个程序自己是这么宣称的。 你应该相信它一次。 所有 cat 命令能做的事， [dog][2] 都做的更好。 除了仅仅能在控制台上显示一些文本流之外， dog 还可以对其进行过滤。 例如， 你可以使用如下语法来获得网页上的所有图片：

    $ dog --images [URL] 

![](https://farm6.staticflickr.com/5568/14811659823_ea8d22d045_z.jpg)

或者是所有链接：

    dog --links [URL] 

![](https://farm4.staticflickr.com/3902/14788690051_7472680968_z.jpg)

另外， dog 命令还可以处理一些其他的小任务， 比如全部转换为大写或小写， 使用不同的编码， 显示行号和处理十六进制文件。 总之, dog 是 cat 的必备替代品。

### advcp ###

一个 Linux 中最基本的命令就是复制命令： cp。 它几乎和 cd 命令地位相同。 然而， 它的输出非常少。 你可以使用 verbose 模式来实时查看正在被复制的文件， 但如果一个文件非常大的话， 你看着屏幕等待却完全不知道后台在干什么。 一个简单的解决方法是加上一个进度条： 这正是 advcp (advanced cp 的缩写) 所做的！ advcp 是 [GNU coreutils][4] 的一个 [补丁版本][3]， 它提供了 acp 和 amv 命令， 即"高级"的 cp 和 mv 命令. 使用语法如下：

    $ acp -g [file] [copy] 

它把文件复制到另一个位置， 并显示一个进度条。

![](https://farm6.staticflickr.com/5588/14605117730_fe611fc234_z.jpg)

我还建议在 .bashrc 或 .zshrc 中设置如下命令别名：

    alias cp="acp -g"
    alias mv="amv -g"

(译者注: 原文给出的链接已貌似失效, 我写了一个可用的安装脚本放在了我的 [gist](https://gist.github.com/b978fc93b62e75bfad9c) 上, 用的是 AUR 里的 [patch](https://aur.archlinux.org/packages/advcp)。)

### The Silver Searcher ###

[the silver searcher][5] 这个名字听起来很不寻常（银搜索...）， 它是一款设计用来替代 grep 和 [ack][6] 的工具。 The silver searcher 在文件中搜索你想要的部分， 它比 ack 要快， 而且能够忽略一些文件而不像 grep 那样。（译者注： 原文的意思貌似是 grep 无法忽略一些文件， 但 grep 有类似选项） the silver searcher 还有一些其他的功能，比如彩色输出， 跟随软连接， 使用正则表达式， 甚至是忽略某些模式。

![](https://farm4.staticflickr.com/3876/14605308117_f966c77140_z.jpg)

作者在开发者主页上提供了一些搜索速度的统计数字， 如果它们的确是真的的话， 那是非常可观的。 另外， 你可以把它整合到 Vim 中， 用一个简洁的命令来调用它。 如果要用两个词来概括它， 那就是： 智能、快速。

### plowshare ###

所有命令行的粉丝都喜欢使用 wget 或其他对应的替代品来从互联网上下载东西。 但如果你使用许多文件分享网站， 像 mediafire 或者 rapidshare。 你一定很乐意了解一款专门为这些网站设计的对应的程序， 叫做 [plowshare][7]。 安装成功之后， 你可以使用如下命令来下载文件：

    $ plowdown [URL] 

或者是上传文件:

    $ plowup [website name] [file] 

前提是如果你有那个文件分享网招的账号的话。

最后， 你可以获取分享文件夹中的一系列文件的链接：

    $ plowlist [URL] 

或者是文件名、 大小、 哈希值等等：

    $ plowprobe [URL] 

对于那些熟悉这些服务的人来说， plowshare 还是缓慢而令人难以忍受的 jDownloader 的一个很好的替代品。

### htop ###

如果你经常使用 top 命令， 很有可能你会喜欢 [htop][8] 命令。 top 和 htop 命令都能对正在运行的进程提供了实时查看功能， 但 htop 还拥有一系列 top 命令所没有的人性化功能。 比如， 在 htop 中， 你可以水平或垂直滚动进程列表来查看每个进程的完整命令名， 还可以使用鼠标点击和方向键来进行一些基本的进程操作(比如 kill、 (re)nice 等)，而不用输入进程标识符。

![](https://farm6.staticflickr.com/5581/14819141403_6f2348590f_z.jpg)

### mtr ###

系统管理员的一个基本的网络诊断工具traceroute可以用于显示从本地网络到目标网络的网络第三层协议的路由。mtr（即“My Traceroute”的缩写）继承了强大的traceroute功能，并集成了 ping 的功能。当发现了一个完整的路由时，mtr会显示所有的中继节点的 ping 延迟的统计数据，对网络延迟的定位非常有用。虽然也有其它的 traceroute的变体（如：tcptraceroute 或 traceroute-nanog），但是我相信 mtr 是traceroute 工具里面最实用的一个增强工具。

![](https://farm4.staticflickr.com/3884/14783092046_b3a90ab462_z.jpg)


总的来说， 这些十分有效的基本命令行的替代工具就像那些有用的小珍珠一样， 它们并不是那么容易被发现， 但当一旦你找到一个， 你就会惊讶你是如何忍受这么长没有它的时间！ 如果你还知道其他的与上面描述相符的工具， 请在评论中分享给我们。


--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/better-alternatives-basic-command-line-utilities.html

作者：[Adrien Brochard][a]
译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://projects.gw-computing.net/projects/dfc
[2]:http://archive.debian.org/debian/pool/main/d/dog/
[3]:http://zwicke.org/web/advcopy/
[4]:http://www.gnu.org/software/coreutils/
[5]:https://github.com/ggreer/the_silver_searcher
[6]:http://xmodulo.com/2014/01/search-text-files-patterns-efficiently.html
[7]:https://code.google.com/p/plowshare/
[8]:http://hisham.hm/htop/
