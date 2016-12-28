翻译中 by ypingcn

把 SQL Server 迁移到Linux？也把 SQL Server 换成 MySQL 吧！
============================================================

### 在这篇文章里将会讲

1.  [To have Control Over the Platform][1]
2.  [Joining the Crowd][2]
3.  [Microsoft isn’t Open Sourcing SQL Server’s Code][3]
4.  [Saving on License Costs][4]
5.  [Sometimes, the Specific Hardware being Used][5]
6.  [Support][6]

最近几年，数量庞大的个人和组织放弃 Windows 平台选择 Linux 平台，而且随着人们体验到更多 Linux 的发展，这个数字将会继续增长。在很长的一段时间内， Linux是网络服务器的领导者，因为大部分的网络服务器都运行在 Linux 之上，这或许是一个为什么那么多个人和组织选择迁移的原因。
Over the recent years, there has been a large number of individuals as well as organizations who are ditching the Windows platform for Linux platform, and this number will continue to grow as more developments in Linux are experienced. Linux has for long been the leader in Web servers as most of the web servers run on Linux, and this could be one of the reasons why the high migration is being experienced.

迁移的原因有很多，更强的平台稳定性、可靠性、花费、所有权和安全性。更多的个人和组织迁移到 Linux 平台，MS SQL Server数据库管理系统的迁移也有着同样的趋势， 首选的是MySQL，因为MySQL的互用性、平台独立和低的购置成本。
The reasons for this migration are as numerous, ranging from more platform stability, reliability, costs, ownership and security among others. As more entities migrate to the Linux platform, so is the migration from MS SQL server database management system, top MySQL, because of interoperability and platform independence of MySQL, as well as low acquisition costs.

有多少个人和组织完成了迁移，就有多少商业需求应该被满足，迁移，不能只是为了乐趣。同样的，一个综合可行性和成本效益分析是有必要执行的，分析能了解迁移对于你业务上的正面和负面影响。
As much as the migration is to be done, the need for it should be necessitated by the business and not just for the mere pleasure of it.As such, a comprehensive feasibility and cost-benefit analysis should be carried out to know the impact that the migration will have on your business, both positive and negative.

迁移需要基于以下的重要因素：
The migration may be based on the following key factors:

### To have Control Over the Platform

不像Windows那样每次发布和修复都不能完全掌控,当你需要修复的时候， Linux 真正给了你灵活性去获取他们。这一点受到开发者和安全人员的喜爱，因为他们能在一个安全威胁被确定时立即修复它。
Unlike in windows where you are not in full control of the releases and fixes, Linux does give you that flexibility to get fixes as and when you require them. This is preferred by developers and security personnel in that they are able to immediately apply a fix when a security threat is identified, unlike in Windows where you can only hope they release the fixes soon.

### Joining the Crowd

目前， 运行在 Linux 平台上的服务器在数量上远超过 Windows，几乎是全世界服务器数量的四分之三,而且这种趋势在最近一段时间内不会改变。因此，许多组织正在将他们的服务完全迁移到 Linux 上，而不是同时使用两种平台，那将会增加他们的运营成本。
The Linux platform far outnumbers Windows in the number of servers that are running on it, nearly a quarter of all servers in the world, and the trend is not about to change anytime soon. Many organizations, therefore, do migrate so as to be fully on Linux rather than running two platforms concurrently, which adds up to their operating costs.

### Microsoft isn’t Open Sourcing SQL Server’s Code

微软宣称他们下一个名为 Denali 的新版 MSSQL Server 将会是一个 Linux 版本，并且不会开放其源代码，这意味着他们的协议依旧有效，但是新版本将能在Linux上运行。这一点将许多乐于接受开源新版的人拒之门外。

In as much as Microsoft have announced that their next release of MSSQL server (named Denali) will be a Linux version, that will still not open their source code, meaning that their licenses will still apply, but the release will be run on Linux. This still locks out the many users who would happily take to the release if it was open source.

这仍然没有给那些使用闭源的 Oracle 用户另一个选择，使用完全开源的 MySQL 用于也是如此。
This still does not give an alternative to those users who are using Oracle, which is not open source; neither does it to those [using MySQL][7], which is fully open source.

### Saving on License Costs

许可证的潜在成本让许多用户很失望。在 Windows 平台上运行 MSSQL 服务器有太多的许可证牵涉其中。你需要这些许可：
The cost implication of licenses is a huge letdown for many users. Running a MSSQL server on Windows platform has too many licenses involved. You need licenses for:

*   The windows operating system Windows 操作系统
*   The MSSQL server MSSQL服务器
*   Specific database tools e.g. SQL analytics tools, etc.特定的数据库工具例如 SQL 分析工具等

不像在 Windows 平台上， Linux 完全没有高昂的授权花费，，因此更能吸引用户。 MySQL 数据库也能免费获取，即使他能灵活地当作是一个 MSSQL 服务器。不像那些给 MSSQL 设计的收费程序，大部分的 MySQL 数据库实用程序是免费的。
Unlike in Windows platform, Linux eliminates the issues of high licenses costs, and thus more appealing to users. MySQL database is also a free source even though it offers the flexibility just as MSSQL server, thus it is more preferred. Most of the database utility tools for MySQL are mostly free, unlike for MSSQL.

### Sometimes, the Specific Hardware being Used

因为 Linux 先进和总是被不同的开发者所选择，所以它独立于所运行的硬件之上并能被广泛使用在不同的硬件平台。然而微软正在努力让 Windows 和 MSSQL 服务器拥有硬件独立性，在平台的独立性上依旧有些限制。
Because Linux is developed and always being enhanced by various developers, it is independent of the hardware it operates on and thus widely used on different hardware platforms. However, as much as Microsoft has tried to ensure that Windows and MSSQL server are hardware independent; there are still some limitations in platform independence.

### Support
有了 Linux 、 MySQL 和其他的开源软件，获取满足自己特定需求的帮助变得更加简单，因为有不同开发者参与到这些软件的开发过程中。这些开发者或许就在你附近，这样更容易获取帮助。在线论坛也能帮上不少，你能发帖并讨论你所面对的问题
With Linux and MySQL, as well as with other open source software, it is easier to get support on the specific need that you have, because there are various developers involved in their development. These developers maybe within your locality, thus are easily reached. Also, online forums are of great help whereby you are able to post and discuss the issues you face.

至于那些商业软件，你只能根据他们的软件协议和时间来获得帮助，有时候他们不能在你的时间范围内给出一个解决方案。
For commercial software, you get support based on their software agreement with you and their timing, and at times may not give you a solution within the timelines that you have.

在不同的情况中，迁移到 Linux 都是你最好的选择，加入一个彻底、稳定可依赖的平台来获取优异表现。总所周知，这比 Windows 要多花费一点精力。这值得一试。
In every case, migrating to Linux gives you the best option and outcome that you can have, by joining a radical, stable and reliable platform, which is known to be more robust than Windows. It is worth a shot.

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
