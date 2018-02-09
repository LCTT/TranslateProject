优化 MySQL： 3 个简单的小调整
============================================================

如果你不改变 MySQL 的缺省配置，你的服务器的性能就像下图的坏在一档的法拉利一样 “虎落平阳被犬欺” …

![](https://cdn-images-1.medium.com/max/1000/1*b7M28XbrOc4FF3tJP-vvyg.png)

我并不期望成为一个专家级的 DBA，但是，在我优化 MySQL 时，我推崇 80/20 原则，明确说就是通过简单的调整一些配置，你可以压榨出高达 80% 的性能提升。尤其是在服务器资源越来越便宜的当下。

### 警告

1.  没有两个数据库或者应用程序是完全相同的。这里假设我们要调整的数据库是为一个“典型”的 Web 网站服务的，优先考虑的是快速查询、良好的用户体验以及处理大量的流量。
2.  在你对服务器进行优化之前，请做好数据库备份！

### 1、 使用 InnoDB 存储引擎

如果你还在使用 MyISAM 存储引擎，那么是时候转换到 InnoDB 了。有很多的理由都表明 InnoDB 比 MyISAM 更有优势，如果你关注性能，那么，我们来看一下它们是如何利用物理内存的：

*   MyISAM：仅在内存中保存索引。
*   InnoDB：在内存中保存索引**和**数据。

结论：保存在内存的内容访问速度要比磁盘上的更快。

下面是如何在你的表上去转换存储引擎的命令：

```
ALTER TABLE table_name ENGINE=InnoDB;
```

*注意：你已经创建了所有合适的索引，对吗？为了更好的性能，创建索引永远是第一优先考虑的事情。*

### 2、 让 InnoDB 使用所有的内存 

你可以在 `my.cnf`  文件中编辑你的 MySQL 配置。使用 `innodb_buffer_pool_size` 参数去配置在你的服务器上允许 InnoDB 使用物理内存数量。

对此（假设你的服务器_仅仅_运行 MySQL），公认的“经验法则”是设置为你的服务器物理内存的 80%。在保证操作系统不使用交换分区而正常运行所需要的足够内存之后 ，尽可能多地为 MySQL 分配物理内存。

因此，如果你的服务器物理内存是 32 GB，可以将那个参数设置为多达 25 GB。

```
innodb_buffer_pool_size = 25600M
```

*注意：（1）如果你的服务器内存较小并且小于 1 GB。为了适用本文的方法，你应该去升级你的服务器。 （2） 如果你的服务器内存特别大，比如，它有 200 GB，那么，根据一般常识，你也没有必要为操作系统保留多达 40 GB 的内存。 *

### 3、 让 InnoDB 多任务运行

如果服务器上的参数 `innodb_buffer_pool_size` 的配置是大于 1 GB，将根据参数 `innodb_buffer_pool_instances` 的设置， 将 InnoDB 的缓冲池划分为多个。

拥有多于一个的缓冲池的好处有：

> 在多线程同时访问缓冲池时可能会遇到瓶颈。你可以通过启用多缓冲池来最小化这种争用情况：

对于缓冲池数量的官方建议是：

> 为了实现最佳的效果，要综合考虑 `innodb_buffer_pool_instances` 和 `innodb_buffer_pool_size` 的设置，以确保每个实例至少有不小于 1 GB 的缓冲池。

因此，在我们的示例中，将参数 `innodb_buffer_pool_size` 设置为 25 GB 的拥有 32 GB 物理内存的服务器上。一个合适的设置为 25600M / 24 = 1.06 GB

```
innodb_buffer_pool_instances = 24
```

### 注意！

在修改了 `my.cnf` 文件后需要重启 MySQL 才能生效：

```
sudo service mysql restart
```

* * *

还有更多更科学的方法来优化这些参数，但是这几点可以作为一个通用准则来应用，将使你的 MySQL 服务器性能更好。

--------------------------------------------------------------------------------

作者简介:

我喜欢商业技术以及跑车 | 集团 CTO @ Parcel Monkey， Cloud Fulfilment & Kong。

------

via: https://medium.com/@richb_/tuning-mysql-3-simple-tweaks-6356768f9b90

作者：[Rich Barrett](https://medium.com/@richb_)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

