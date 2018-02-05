Torrent 提速 - 为什么总是无济于事
======

![](http：//www.theitstuff.com/wp-content/uploads/2017/11/increase-torrent-speed.jpg)
是不是总是想要 **更快的 torrent 速度**？不管现在的速度有多块，但总是无法对此满足。我们对 torrent 速度的痴迷使我们经常从包括 YouTube 视频在内的许多网站上寻找并应用各种所谓的技巧。但是相信我，从小到大我就没发现哪个技巧有用过。因此本文我们就就来看看，为什么尝试提高 torrent 速度是行不通的。

##  影响速度的因素

###  本地因素

从下图中可以看到 3 台电脑分别对应的 A，B，C 三个用户。A 和 B 本地相连，而 C 的位置则比较远，它与本地之间有 1，2，3 三个连接点。

[![][1]][2]

若用户 A 和用户 B 之间要分享文件，他们之间直接分享就能达到最大速度了而无需使用 torrent。这个速度跟互联网什么的都没有关系。

+ 网线的性能

+ 网卡的性能

+ 路由器的性能

当谈到 torrent 的时候，人们都是在说一些很复杂的东西，但是却总是不得要点。

[![LAN wire，network cards，router][3]][3]

现在我们谈论的是本地文件分享，目前较新一点的网卡速率大约 1 Gigabit 左右。常见的路由器大约 300 Megabits 而网线大概能达到 100 Megabits。当然具体的配置可能不一样，我这里只是给一个一般性的例子。

由于你有一个 1 Gigabit 的网卡，你可能会觉得你的下载速度应该达到 125 Megabytes。但是路由器只允许传输 300 Megabits 也就是 30 Megabyte。

即使你把目标降到 30 Megabytes，然而你连接到路由器的电缆/网线的性能最多只有 100 megabits 也就是 10 MegaBytes。这是一个纯粹的瓶颈问题，由一个薄弱的环节影响到了其他强健部分，也就是说这个传输速率只能达到 10 Megabytes，即电缆的极限速度。现在想象有一个 torrent 即使能够用最大速度进行下载，那也会由于你的硬件不够强大而导致瓶颈。

###  外部因素

现在再来看一下这幅图。用户 C 在很遥远的某个地方。甚至可能在另一个国家。

[![how torrent works][1]][2]

假设这个用户创建了一个 torrent 而你想去下载它。第一个问题就是我们刚才讨论过的，你不可能跨越 10 Megabyte 这道坎。

第二，由于 C 与本地之间多个有连接点，其中一个点就有可能成为瓶颈所在，可能由于繁重的流量和相对薄弱的硬件导致了缓慢的速度。

###  Seeders( 译者注：做种者) 与 Leechers( 译者注：只下载不做种的人)

关于此已经有了太多的讨论，总的想法就是搜索更多的种子，但要注意上面的那些因素，一个很好的种子提供者但是跟我之间的连接不好的话那也是无济于事的。通常，这不可能发生，因为我们也不是唯一下载这个资源的人，一般都会有一些在本地的人已经下载好了这个文件并已经在做种了。

##  结论

我们尝试搞清楚哪些因素影响了 torrent 速度的好坏。不管我们如何用软件进行优化，大多数时候是这是由于物理瓶颈导致的。我从来不关心那些软件，使用默认配置对我来说就够了。

希望你会喜欢这篇文章，有什么想法敬请留言。


--------------------------------------------------------------------------------

via: http://www.theitstuff.com/increase-torrent-speed-will-never-work

作者：[Rishabh Kandari][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theitstuff.com/author/reevkandari
[1]:http://www.theitstuff.com/wp-content/uploads/2017/11/A-550x275.png
[2]:http://www.theitstuff.com/wp-content/uploads/2017/11/A.png
[3]:http://www.theitstuff.com/wp-content/uploads/2017/11/A-1-e1509773618549.png
[4]:http://www.linuxandubuntu.com/home/torrents-everything-you-need-to-know
