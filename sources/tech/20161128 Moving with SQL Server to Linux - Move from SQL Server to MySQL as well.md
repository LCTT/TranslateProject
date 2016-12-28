翻译中 by ypingcn

把 SQL Server 迁移到Linux？也把 SQL Server 换成 MySQL 吧！
============================================================

### 在这篇文章里将会讲

1.  [控制平台][1]
2.  [跟随大众][2]
3.  [微软没有开放 SQL Server 的源代码][3]
4.  [节约许可证的花费][4]
5.  [有时候被使用的特定硬件][5]
6.  [支持][6]

最近几年，数量庞大的个人和组织放弃 Windows 平台选择 Linux 平台，而且随着人们体验到更多 Linux 的发展，这个数字将会继续增长。在很长的一段时间内， Linux是网络服务器的领导者，因为大部分的网络服务器都运行在 Linux 之上，这或许是一个为什么那么多个人和组织选择迁移的原因。

迁移的原因有很多，更强的平台稳定性、可靠性、花费、所有权和安全性。更多的个人和组织迁移到 Linux 平台，MS SQL 服务器数据库管理系统的迁移也有着同样的趋势，首选的是 MySQL ，因为 MySQL 的互用性、平台独立和低的购置成本。

有多少个人和组织完成了迁移，就应该满足多少商业需求，迁移，不能只是为了乐趣。这样的话，一个综合可行性和成本效益分析是有必要执行的，分析能了解迁移对于你业务上的正面和负面影响。

迁移需要基于以下重要因素：

### 控制平台

不像Windows那样每次发布和修复都不能完全掌控,当你需要修复的时候，Linux 真正给了你灵活性去获取修复。这一点受到开发者和安全人员的喜爱，因为他们能在一个安全威胁被确定时立即自行打补丁，不像 Windows ，你只能期望官方尽快发布补丁。

### 跟随大众

目前， 运行在 Linux 平台上的服务器在数量上远超过 Windows，几乎是全世界服务器数量的四分之三,而且这种趋势在最近一段时间内不会改变。因此，许多组织正在将他们的服务完全迁移到 Linux 上，而不是同时使用两种平台，同时使用将会增加他们的运营成本。

### 微软没有开放 SQL Server 的源代码

微软宣称他们下一个名为 Denali 的新版 MSSQL Server 将会是一个 Linux 版本，并且不会开放其源代码，这意味着他们的协议依旧有效，但是新版本将能在Linux上运行。这一点将许多乐于接受开源新版的人拒之门外。

这仍然没有给那些使用闭源的 Oracle 用户另一个选择，使用完全开源的 [MySQL 用户][7]也是如此。

### 节约许可证的花费

许可证的潜在成本让许多用户很失望。在 Windows 平台上运行 MSSQL 服务器有太多的许可证牵涉其中。你需要这些许可：

*   Windows 操作系统
*   MSSQL 服务器
*   特定的数据库工具，例如 SQL 分析工具等

不像 Windows 平台，Linux 完全没有高昂的授权花费，因此更能吸引用户。 MySQL 数据库也能免费获取，即使它能灵活地当作是一个 MSSQL 服务器。不像那些给 MSSQL 设计的收费程序，大部分的 MySQL 数据库实用程序是免费的。

### 有时候被使用的特定硬件

因为 Linux 先进和总是被不同的开发者所选择，所以它独立于所运行的硬件之上并能被广泛应用在不同的硬件平台。然而微软正在努力让 Windows 和 MSSQL 服务器拥有硬件独立性，在平台的独立性上依旧有些限制。

### 支持
有了 Linux 、 MySQL 和其他的开源软件，获取满足自己特定需求的帮助变得更加简单，因为有不同开发者参与到这些软件的开发过程中。这些开发者或许就在你附近，这样更容易获取帮助。在线论坛也能帮上不少，你能发帖并讨论你所面对的问题。

至于那些商业软件，你只能根据他们的软件协议和时间来获得帮助，有时候他们不能在你的时间范围内给出一个解决方案。

在不同的情况中，迁移到 Linux 都是你最好的选择，加入一个彻底、稳定可靠的平台来获取优异表现。总所周知，这比 Windows 要多花费一点精力。这值得一试。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/

作者：[Tony Branson ][a]
译者：[ypingcn](https://github.com/ypingcn)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/howtoforgecom
[1]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#to-have-control-over-the-platform
[2]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#joining-the-crowd
[3]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#microsoft-isnrsquot-open-sourcing-sql-serverrsquos-code
[4]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#saving-on-license-costs
[5]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#sometimes-the-specific-hardware-being-used
[6]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#support
[7]:http://www.scalearc.com/how-it-works/products/scalearc-for-mysql
