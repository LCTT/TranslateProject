更多你所不知道的 Linux 命令
============================================================

![unknown Linux commands](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/outer-limits-of-linux.jpg?itok=5L5xfj2v "unknown Linux commands")

> 在这篇文章中和 Carla Schroder 一起探索 Linux 中的一些鲜为人知的强大工具。

本文是一篇关于一些有趣但鲜为人知的工具 `termsaver`、`pv` 和 `calendar` 的文章。`termsaver` 是一个终端 ASCII 屏保，`pv`  能够测量数据吞吐量并模拟输入。Debian 的 `calendar` 拥有许多不同的日历，并且你还可以制定你自己的日历。

### 终端屏保

难道只有图形桌面能够拥有有趣的屏保吗？现在，你可以通过安装 `termsaver` 来享受 ASCII 屏保，比如 matrix（LCTT 译注：电影《黑客帝国》中出现的黑客屏保）、时钟、星球大战以及两个<ruby>不太安全<rt>not-safe-for-work</rt></ruby>（NSFW）的屏保。 NSFW 屏保还有很多。

`termsaver` 可以从 Debian/Ubuntu 的包管理器中直接下载安装，如果你使用别的不包含该软件包的发行版比如 CentOS，那么你可以从 [termsaver.brunobraga.net][7] 下载，然后按照安装指导进行安装。

运行 `termsaver -h` 来查看一系列屏保：

```
 randtxt        displays word in random places on screen
 starwars       runs the asciimation Star Wars movie
 urlfetcher     displays url contents with typing animation
 quotes4all     displays recent quotes from quotes4all.net
 rssfeed        displays rss feed information
 matrix         displays a matrix movie alike screensaver
 clock          displays a digital clock on screen
 rfc            randomly displays RFC contents
 jokes4all      displays recent jokes from jokes4all.net (NSFW)
 asciiartfarts  displays ascii images from asciiartfarts.com (NSFW)
 programmer     displays source code in typing animation
 sysmon         displays a graphical system monitor
```

![Linux commands](https://www.linux.com/sites/lcom/files/styles/floated_images/public/linux-commands-fig-1.png?itok=HveXXLLK "Linux commands")

*图片 1： 星球大战屏保。*

你可以通过运行命令 `termsaver [屏保名]` 来使用屏保，比如 `termsaver matrix` ，然后按 `Ctrl+c` 停止。你也可以通过运行 `termsaver [屏保名] -h` 命令来获取关于某一个特定屏保的信息。图片 1 来自 `startwars` 屏保，它运行的是古老但受人喜爱的 [Asciimation Wars][8] 。

那些不太安全（NSFW）的屏保通过在线获取资源的方式运行，我并不喜欢它们，但好消息是，由于 `termsaver` 是一些 Python 脚本文件，因此，你可以很容易的利用它们连接到任何你想要的 RSS 资源。

### pv

`pv` 命令是一个非常有趣的小工具但却很实用。它的用途是监测数据复制的过程，比如，当你运行 `rsync` 命令或创建一个 `tar` 归档的时候。当你不带任何选项运行 `pv` 命令时，默认参数为：

*   -p ：进程
*   -t ：时间，到当前总运行时间
*   -e ：预计完成时间，这往往是不准确的，因为 `pv` 通常不知道需要移动的数据的大小
*   -r ：速率计数器，或吞吐量
*   -b ：字节计数器

一次 `rsync` 传输看起来像这样：

```
$ rsync -av /home/carla/ /media/carla/backup/ | pv 
sending incremental file list
[...]
103GiB 0:02:48 [ 615MiB/s] [  <=>
```

创建一个 tar 归档，就像下面这个例子：

```
$ tar -czf - /file/path| (pv  > backup.tgz)
 885MiB 0:00:30 [28.6MiB/s] [  <=>
```

`pv` 能够监测进程，因此也可以监测 Web 浏览器的最大活动，令人惊讶的是，它产生了如此多的活动：

```
$ pv -d  3095                                                                                                             
  58:/home/carla/.pki/nssdb/key4.db:    0 B 0:00:33 
  [   0 B/s] [<=>                                                                           ] 
  78:/home/carla/.config/chromium/Default/Visited Links:  
  256KiB 0:00:33 [   0 B/s] [<=>                                                      ] 
  ] 
  85:/home/carla/.con...romium/Default/data_reduction_proxy_leveldb/LOG:  
  298 B 0:00:33 [   0 B/s] [<=>                                       ] 
```

在网上，我偶然发现一个使用 `pv` 最有趣的方式：使用 `pv` 来回显输入的内容：

```
$ echo "typing random stuff to pipe through pv" | pv -qL 8
typing random stuff to pipe through pv
```

普通的 `echo` 命令会瞬间打印一整行内容。通过管道传给 `pv` 之后能够让内容像是重新输入一样的显示出来。我不知道这是否有实际的价值，但是我非常喜欢它。`-L` 选项控制回显的速度，即多少字节每秒。

`pv` 是一个非常古老且非常有趣的命令，这么多年以来，它拥有了许多的选项，包括有趣的格式化选项，多种输出选项，以及传输速度修改器。你可以通过 `man pv` 来查看所有的选项。

### /usr/bin/calendar

通过浏览 `/usr/bin` 目录以及其他命令目录和阅读 man 手册，你能够学到很多东西。在 Debian/Ubuntu 上的 `/usr/bin/calendar` 是 BSD 日历的一个变种，但它漏掉了月亮历和太阳历。它保留了多个日历包括 `calendar.computer, calendar.discordian, calendar.music` 以及 `calendar.lotr`。在我的系统上，man 手册列出了 `/usr/bin/calendar` 里存在的不同日历。下面这个例子展示了指环王日历接下来的 60 天：

```
$ calendar -f /usr/share/calendar/calendar.lotr  -A 60
Apr 17  An unexpected party
Apr 23  Crowning of King Ellesar
May 19  Arwen leaves Lorian to wed King Ellesar
Jun 11  Sauron attacks Osgilliath
```

这些日历是纯文本文件，因此，你可以轻松的创建你自己的日历。最简单的方式就是复制已经存在的日历文件的格式。你可以通过 `man calendar` 命令来查看创建个人日历文件的更详细的指导。

又一次很快走到了尽头。你可以花费一些时间来浏览你的文件系统，挖掘更多有趣的命令。

 _你可以通过来自 Linux 基金会和 edx 的免费课程 ["Introduction to Linux"][5] 来学习更过关于 Linux 的知识_。

（题图：[CC Zero][2] Pixabay）

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/4/more-unknown-linux-commands

作者：[CARLA SCHRODER][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/linux-commands-fig-1png

[4]:https://www.linux.com/files/images/outer-limits-linuxjpg
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[6]:https://www.addtoany.com/share#url=https%3A%2F%2Fwww.linux.com%2Flearn%2Fintro-to-linux%2F2017%2F4%2Fmore-unknown-linux-commands&amp;amp;amp;title=More%20Unknown%20Linux%20Commands
[7]:http://termsaver.brunobraga.net/
[8]:http://www.asciimation.co.nz/
