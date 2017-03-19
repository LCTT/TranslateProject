MySQL 集群服务简介
=====================

[MySQL Cluster.me][1] 开始提供基于 **Galera Replication** 技术的 **MySQL** 和 **MariaDB** 集群服务。

在本文中我们将会讨论 **MySQL** 和 **MariaDB** 集群服务的主要特性。

[
 ![MySQL集群服务](http://www.tecmint.com/wp-content/uploads/2017/01/MySQL-Clusters-Service.png) 
][2]

*MySQL 集群服务*

### 什么是 MySQL 集群

如果你曾经疑惑过如何提升 MySQL 数据库的可靠性和可扩展性，或许你会发现其中一个解决办法就是通过基于 **Galera Cluster** 技术的 **MySQL 集群**解决方案。

这项技术使得你可以在一个或者多个数据中心的多个服务器上获得经过同步的完整 MySQL 数据副本。这可以实现数据库的高可用性 - 当你的一个或者多个数据库服务器崩溃后，仍然能够从其它剩余服务器上获得完整的服务。

需要注意的是在 **MySQL 集群**中需要至少 3 台服务器，因为当其中一台服务器从崩溃中恢复的时候需要从仍然存活的两台服务器中选择一个**捐赠者**拷贝一份数据，所以为了能够从崩溃中顺利恢复数据，必须要保证两台在线服务器以便从中恢复数据。（LCTT 译注：在捐赠者提供复制数据时，另外一台可以不停顿地提供服务）

同样，[MariaDB 集群][3]和 MySQL 集群在本质上是相同的，因为 MariaDB 是基于 MySQL 开发的一个更新、更优化的版本。

[
 ![MySQL集群与Galera复制技术](http://www.tecmint.com/wp-content/uploads/2017/01/MySQL-Clusters-Galera-Replications.png) 
][4]

*MySQL 集群与 Galera 复制技术*

### 什么是 MySQL 和 MariaDB 集群服务?

**MySQL 集群**服务提供了能够同时解决可靠性和可扩展性的方案。

首先，集群服务使你能够忽略任何数据中心引起的问题，并能获得高达 **100% 正常运行时间**的数据库高可用性。

其次，将乏味无趣的 MySQL 集群相关管理工作外包出去，能够使你更加专注于业务工作。

事实上，独立管理一个集群需要你能够完成以下所有工作：

1. **安装和设置集群** – 这可能需要一个有经验的数据库管理员花费数小时来设置一个可用的集群。
2. **集群监控** – 必须使用一种方案 24 * 7 监控集群运作，因为很多问题都可能发生-集群不同步、服务器崩溃、硬盘空间满等。
3. **优化及调整集群大小** – 当你管理了很大的数据库时，调整集群大小将会是一个巨大的挑战。处理这个任务时需要格外小心。
4. **备份管理** – 为了防止集群失败带来的危险，你需要备份集群数据。
5. **解决问题** – 你需要一个经验丰富的工程师来对集群进行优化及解决相关问题。

但是现在你只需要通过使用 **MySQLcluster.me** 团队提供的 **MySQL 集群服务**就可以节省大量的时间和金钱。

**MySQLcluster.me 提供的 MySQL 集群服务包括了哪些内容？**

除了很多高可用性数据服务提供的 **100%** 可用性外，你还将获得如下保证：

1. **任何时候都可以调整 MySQL 集群大小** – 你可以增加或者减少集群资源（包括 RAM、CPU、DISK）以便满足业务尖峰需求。
2. **优化硬盘和数据库的性能** – 硬盘能够达到**10000 IOPS**，这对数据库操作十分重要。

3. **数据中心选择** – 你可以选择将集群布置在哪个数据中心。当前支持的数据中心有：Digital Ocean、 Amazon AWS、 RackSpace、 Google Compute Engine。
4. **24×7 集群服务支持** – 我们的团队能够为你集群上发生的任何问题提供支持，甚至包括对你的集群架构提供建议。
5. **集群备份** – 我们团队会为你设置备份，这样你的集群数据能够每天备份到安全的地方。
6. **集群监控** – 我们团队设置了自动监控以便能够及时发现你的集群出现的问题，并提供支持，哪怕你并没有在值班。

拥有自己的 **MySQL 集群**会有很多优势，但是需要你足够耐心和有经验才行。

与 [MySQL Cluster][5] 团队联系以便找到适合你的工具包.

--------------------------------------------------------------------------------

作者简介：

我是 Ravi Saive，开发了 TecMint。电脑极客和 Linux 专家，喜欢分享关于互联网的建议和点子。我的大部分服务都运行在开源平台 Linux 上。关注我的 Twitter、Facebook 和 Google+。

--------------------------------------------

via: http://www.tecmint.com/getting-started-with-mysql-clusters-as-a-service/

作者：[Ravi Saive][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:https://www.mysqlcluster.me/#utm_source=tecmintpost1&utm_campaign=tecmintpost1&utm_medium=tecmintpost1
[2]:http://www.tecmint.com/wp-content/uploads/2017/01/MySQL-Clusters-Service.png
[3]:https://www.mysqlcluster.me/#utm_source=tecmintpost1&utm_campaign=tecmintpost1&utm_medium=tecmintpost1
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/MySQL-Clusters-Galera-Replications.png
[5]:https://www.mysqlcluster.me/#utm_source=tecmintpost1&utm_campaign=tecmintpost1&utm_medium=tecmintpost1
