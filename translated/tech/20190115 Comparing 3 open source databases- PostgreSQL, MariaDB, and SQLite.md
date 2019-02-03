[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Comparing 3 open source databases: PostgreSQL, MariaDB, and SQLite)
[#]: via: (https://opensource.com/article/19/1/open-source-databases)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

开源数据库 PostgreSQL、MariaDB 和 SQLite 的对比
======
>  要知道如何选择最适合你的需求的开源数据库。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_container_block.png?itok=S8MbXEYw)

在现代企业的技术领域中，开源软件已经成为了一股不可忽视的重要力量。借助[<ruby>开源运动<rt>open source movement</rt></ruby>][1]的东风，很多重大的技术已经得到了长足的发展。

个中原因显而易见，尽管一些基于 Linux 的开源网络标准可能不如著名厂商的产品那么受欢迎，但是不同制造商的智能设备之间能够互相通信，开源技术功不可没。当然也有不少人认为开源应用比厂商提供的产品更加好，所以无论如何，使用开源数据库进行开发确实是相当有利的。

和其它类型的应用软件一样，[不同的开源数据库管理系统之间在功能和特性上可能会存在着比较大的差异][2]。因此，如果要为整个团队选择一个开源数据库，那么应该重点考察数据库是否对用户友好、是否能够持续适应团队需求、是否能够提供足够安全的功能等方面的因素。

出于这方面考虑，我们在这篇文章中对一些开源数据库进行了概述和对比。但也有可能略过了一些常用的数据库。需要提到的是，MongoDB 最近更改了它的许可证，因此它已经不是完全的开源产品了。从商业角度来看，这个决定是很有意义的，因为 MongoDB 已经成为了[约 27000 家公司][3]在数据库托管方面的实际解决方案，这也意味着 MongoDB 已经不再被视为真正的开源产品。

另外，在 MySQL 被 Oracle 收购之后，这个产品就已经不再具有开源性质了。MySQL 在过去相当长的一段时间里都是很多项目的首选数据库，因此它的案例也是摆在其它开源数据库面前的一个巨大挑战。

下面讨论一下我们提到的三个开源数据库。

### PostgreSQL

[PostgreSQL][4] 可以说是开源数据库中的一个重要成员。无论是哪种规模的企业，PostgreSQL 可能都是它们的首选解决方案。Oracle 对 MySQL 的收购在当时来说可能具有一定的商业意义，但是随着云存储的日益壮大，[开发者对 MySQL 的依赖程度或许并不如以前那么大了][5]。

尽管 PostgreSQL 不是一个最近几年才面世的新产品，但它却是借助了 [MySQL 衰落][6]的机会才逐渐成为最受欢迎的开源数据库之一。由于它和 MySQL 的工作方式非常相似，因此很多热衷于使用开源软件的开发者都纷纷转向 PostgreSQL。

#### 优势

  * 目前 PostgreSQL 最显著的优点是它的算法效率高，因此它的性能就比其它的数据库也高一些。这一点在处理大型数据集的时候就可以很明显地体现出来了，否则在运算过程中 I/O 会成为瓶颈。
  * PostgreSQL 也是最灵活的开源数据库之一，使用 Python、Perl、Java、Ruby、C 或者 R 都能够很方便地调用数据库。
  * 作为最常用的几个开源数据库之中，PostgreSQL 的社区支持是做得最好的。




#### 劣势

  * 在数据量比较大的时候，PostgreSQL 的效率毋庸置疑是很高的，但对于数据量较小的情况，使用 PostgreSQL 就显得不如其它的一些工具轻量级了。

  * 尽管拥有一个很优秀的社区支持，但 PostgreSQL 的核心文档仍然需要作出改进。

  * 如果你需要使用并行计算或者集群化等高级工具，就需要安装 PostgreSQL 的第三方插件。尽管官方有计划将这些功能逐步添加到主要版本当中，但可能会需要再等待好几年才能实现。




### MariaDB

[MariaDB][7] 是 MySQL 的真正开源发行版本（在 [GNU GPLv2][8] 下发布）。在 Oracle 收购 MySQL 之后，MySQL 的一些核心开发人员认为 Oracle 会破坏 MySQL 的开源理念，因此建立了 MariaDB 这个独立的分支。

MariaDB 在开发过程中替换了 MySQL 的几个关键组件，但仍然尽可能地保持兼容 MySQL。MariaDB 使用了 Aria 作为存储引擎，这个存储引擎既可以作为事务式引擎，也可以作为非事务式引擎。在 MariaDB 独立出来之前，就[有一些人推测][10] Aria 会成为 MySQL 未来版本中的标准引擎。

#### 优势

  * 由于 MariaDB [频繁进行安全发布][11]，很多用户选择使用 MariaDB 而不选择 MySQL。尽管这不一定代表 MariaDB 会比 MySQL 更加安全，但确实表明它的开发社区对安全性十分重视。

  * 有一些人认为，MariaDB 的主要优点就是它在坚持开源的同时会与 MySQL 保持高度兼容，这就表示从 MySQL 向 MariaDB 的迁移会非常容易。

  * 也正是由于这种兼容性，MariaDB 也可以和其它常用于 MySQL 的语言配合使用，因此从 MySQL 迁移到 MariaDB 之后，学习和调试代码的时间成本会非常低。

  * 你可以将 WordPress 和 MariaDB（而不是 MySQL）[配合使用][12]从而获得更好的性能和更丰富的功能。WordPress 是[最受欢迎的<ruby>内容管理系统<rt>Content Management System</rt></ruby>][13]（CMS），并且拥有活跃的开源开发者社区。各种第三方插件在 WordPress 和 MariaDB 配合使用时都能够正常工作。




#### 劣势

  * MariaDB 有时会变得比较臃肿，尤其是它的 IDX 日志文件在长期使用之后会变得非常大，最终导致性能下降。

  * MariaDB 的缓存并没有期望中那么快，这可能会让人有所失望。

  * 尽管 MariaDB 最初承诺兼容 MySQL，但目前 MariaDB 已经不是完全兼容 MySQL。如果要从 MySQL 迁移到 MariaDB，就需要额外做一些兼容工作。




### SQLite

[SQLite][14] 可以说是世界上实现最多的数据库引擎，因为它被很多流行的 web 浏览器、操作系统和手机所采用。它最初是作为 MySQL 的轻量级分支所开发的。SQLite 和很多其它的数据库不同，它不采用客户端-服务端的引擎架构，而是将整个软件嵌入到每个实现当中。

这样的架构让 SQLite 拥有一个强大的优势，就是在嵌入式系统或者分布式系统中，每台机器都搭载了数据库的整个实现。这样的做法减少了系统间的调用，从而大大提高了数据库的性能。

#### 优势

  * 如果你需要构建和实现一个小型数据库，SQLite [可能是最好的选择][15]。它小而灵活，不需要费工夫寻求各种变通方案，就可以在嵌入式系统中实现。

  * SQLite 体积很小，因此速度也很快。其它的一些高级数据库可能会使用复杂的优化方式来提高效率，但不如SQLite 这样减小数据库大小更为直接。

  * SQLite 被广泛采用也导致它可能是兼容性最高的数据库。如果你希望将应用程序集成到智能手机上，只要有第三方应用程序使用到了 SQLite，就能够正常运行数据库了。




#### 劣势

  * SQLite 的轻量意味着它缺少了很多其它大型数据库的常见功能。例如数据加密就是[抵御网络攻击][16]的标准功能，而 SQLite 却没有内置这个功能。

  * SQLite 的广泛流行和源码公开使它易于使用，但是也让它更容易遭受攻击。这是它最大的劣势。SQLite 经常被发现高位的漏洞，例如最近的 [Magellan][17]。

  * 尽管 SQLite 单文件的方式拥有速度上的优势，但是要使用它实现多用户环境却比较困难。




### 哪个开源数据库才是最好的？

当然，对于开源数据库的选择还是取决于业务的需求以及系统的体量。对于小型数据库或者是使用量比较小的数据库，可以使用比较轻量级的解决方案，这样不仅可以加快实现的速度，而且由于系统的复杂程度不算太高，花在调试上的时间成本也不会太高。

而对于大型的系统，尤其是业务增长速度较快的业务，最好还是花时间使用更复杂的数据库（例如 PostgreSQL）。这是一个磨刀不误砍柴工的选择，能够让你不至于在后期再重新选择另一款数据库。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/open-source-databases

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/2/pivotal-moments-history-open-source
[2]: https://blog.capterra.com/free-database-software/
[3]: https://idatalabs.com/tech/products/mongodb
[4]: https://www.postgresql.org/
[5]: https://www.theregister.co.uk/2018/05/31/rise_of_the_open_source_data_strategies/
[6]: https://www.itworld.com/article/2721995/big-data/signs-of-mysql-decline-on-horizon.html
[7]: https://mariadb.org/
[8]: https://github.com/MariaDB/server/blob/10.4/COPYING
[9]: https://mariadb.com/about-us/
[10]: http://kb.askmonty.org/en/aria-faq
[11]: https://mariadb.org/tag/security/
[12]: https://mariadb.com/resources/blog/how-to-install-and-run-wordpress-with-mariadb/
[13]: https://websitesetup.org/popular-cms/
[14]: https://www.sqlite.org/index.html
[15]: https://www.sqlite.org/aff_short.html
[16]: https://hostingcanada.org/most-common-website-vulnerabilities/
[17]: https://www.securitynewspaper.com/2018/12/18/critical-vulnerability-in-sqlite-you-should-update-now/


