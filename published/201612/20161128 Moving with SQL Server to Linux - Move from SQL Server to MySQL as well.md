把 SQL Server 迁移到 Linux？不如换成 MySQL
============================================================

最近几年，数量庞大的个人和组织放弃 Windows 平台选择 Linux 平台，而且随着人们体验到更多 Linux 的发展，这个数字将会继续增长。在很长的一段时间内， Linux 是网络服务器的领导者，因为大部分的网络服务器都运行在 Linux 之上，这或许是为什么那么多的个人和组织选择迁移的一个原因。

迁移的原因有很多，更强的平台稳定性、可靠性、成本、所有权和安全性等等。随着更多的个人和组织迁移到 Linux 平台，MS SQL 服务器数据库管理系统的迁移也有着同样的趋势，首选的是 MySQL ，这是因为 MySQL 的互用性、平台无关性和购置成本低。

有如此多的个人和组织完成了迁移，这是应业务需求而产生的迁移，而不是为了迁移的乐趣。因此，有必要做一个综合可行性和成本效益分析，以了解迁移对于你的业务上的正面和负面影响。

迁移需要基于以下重要因素：

### 对平台的掌控

不像 Windows 那样，你不能完全控制版本发布和修复，而 Linux 可以让你需要需要修复的时候真正给了你获取修复的灵活性。这一点受到了开发者和安全人员的喜爱，因为他们能在一个安全威胁被确定时立即自行打补丁，不像 Windows ，你只能期望官方尽快发布补丁。

### 跟随大众

目前， 运行在 Linux 平台上的服务器在数量上远超 Windows，几乎是全世界服务器数量的四分之三，而且这种趋势在最近一段时间内不会改变。因此，许多组织正在将他们的服务完全迁移到 Linux 上，而不是同时使用两种平台，同时使用将会增加他们的运营成本。

### 微软没有开放 SQL Server 的源代码

微软宣称他们下一个名为 Denali 的新版 MS SQL Server 将会是一个 Linux 版本，并且不会开放其源代码，这意味着他们仍然使用的是软件授权模式，只是新版本将能在 Linux 上运行而已。这一点将许多乐于接受开源新版本的人拒之门外。

这也没有给那些使用闭源的 Oracle 用户另一个选择，对于使用完全开源的 [MySQL 用户][7]也是如此。

### 节约授权许可证的花费

授权许可证的潜在成本让许多用户很失望。在 Windows 平台上运行 MS SQL 服务器有太多的授权许可证牵涉其中。你需要这些授权许可证：

*   Windows 操作系统
*   MS SQL 服务器
*   特定的数据库工具，例如 SQL 分析工具等

不像 Windows 平台，Linux 完全没有高昂的授权花费，因此更能吸引用户。 MySQL 数据库也能免费获取，甚而它提供了像 MS SQL 服务器一样的灵活性，那就更值得选择了。不像那些给 MS SQL 设计的收费工具，大部分的 MySQL 数据库实用程序是免费的。

### 有时候用的是特殊的硬件

因为 Linux 是不同的开发者所开发，并在不断改进中，所以它独立于所运行的硬件之上，并能被广泛使用在不同的硬件平台。然而尽管微软正在努力让 Windows 和 MSSQL 服务器做到硬件无关，但在平台无关上依旧有些限制。

### 支持

有了 Linux、MySQL 和其它的开源软件，获取满足自己特定需求的帮助变得更加简单，因为有不同开发者参与到这些软件的开发过程中。这些开发者或许就在你附近，这样更容易获取帮助。在线论坛也能帮上不少，你能发帖并讨论你所面对的问题。

至于那些商业软件，你只能根据他们的软件协议和时间来获得帮助，有时候他们不能在你的时间范围内给出一个解决方案。

在不同的情况中，迁移到 Linux 都是你最好的选择，加入一个彻底的、稳定可靠的平台来获取优异表现，众所周知，它比 Windows 更健壮。这值得一试。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/

作者：[Tony Branson][a]
译者：[ypingcn](https://github.com/ypingcn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/howtoforgecom
[1]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#to-have-control-over-the-platform
[2]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#joining-the-crowd
[3]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#microsoft-isnrsquot-open-sourcing-sql-serverrsquos-code
[4]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#saving-on-license-costs
[5]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#sometimes-the-specific-hardware-being-used
[6]:https://www.howtoforge.com/tutorial/moving-with-sql-server-to-linux-move-from-sql-server-to-mysql-as-well/#support
[7]:http://www.scalearc.com/how-it-works/products/scalearc-for-mysql
