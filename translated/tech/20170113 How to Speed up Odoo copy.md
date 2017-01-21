Odoo提速指南
============================================================

 ![speed up odoo](https://www.rosehosting.com/blog/wp-content/uploads/2016/12/speed-up-odoo.jpg) 

Odoo 是最流行的 ERP（企业资源计划）软件，它由 Python 编写，使用 PostgreSQL 作为后端数据库。Odoo 社区版是免费的开源软件，它囊括了项目管理，生产、财务、记账和销售管理，仓储管理，人力资源管理，甚至还有更多项目。里面包含了 30 个核心模块，以及超过 3000 个社区模块。Odoo 部署了大量的模块，数据库里也包含了庞大的数据等等，这些都使得这个软件比较复杂，可能会导致效率低下。Odoo 的两个主要瓶颈在于磁盘访问，以及数据库查询时间。

为了提升 Odoo 实例的性能，你可以：

*   使用一个快速磁盘驱动器来存储（最好是 SSD）。
*   使用[内存充足的 Linux VPS][1]。
*   在 Odoo 中激活多重处理模式。
*   正确配置并优化 PostgreSQL 服务。

### 获得一台有着更多内存的 SSD VPS

正如我们先前提到的，随机磁盘访问速度时 Odoo 的主要瓶颈之一。因此，要确保 Odoo 部署在一台[基于 SSD 的 VPS][2] 上。由于 Odoo 是一个对资源十分敏感的应用，因此始终要把它安装在一台有着更多 RAM 的 VPS 上，如果可能，将整个 Odoo 实例及其数据库加载到 RAM 中。固态磁盘驱动器尤其以随机存取见长，而且由于 SSD 没有任何活动部件，它们能够取得数百倍于传统机械硬盘驱动器的随机存取 IOPS。如果服务器没有采用 SSD 来驱动或提速，那么不管你对 Odoo 做多少优化和配置都无济于事，它仍然会很慢。所以，获得正确的主机来部署 Odoo 是提升其性能的最重要因素。

跟大家提过 Odoo 是一个资源饥渴的应用有没有？貌似说过吧。但是不要担心，RoseHosting 将为你们提供一个终极解决方案——一台为性能而量身定做的 [Odoo SSD VPS][3]，为匹配你的最大需求而优化。来，从我们这搞一台 SSD VPS 吧，你会发现什么才真的叫 Odoo 破纪录的速度。

其它 Odoo 优化包括：
### 在 Odoo 配置中启用多重处理选项

要实现此功能，请定位到 openerp 服务器二进制文件：
```
#updatedb
#locate openerp-server

/usr/bin/openerp-server
```

执行以下命令：

```
#/usr/bin/openerp-server --help
```

该命令的输出结果如下：

```
Usage: openerp-server [options]

Options:
  --version             show program's version number and exit

  (...)

  Multiprocessing options:
    --workers=WORKERS   Specify the number of workers, 0 disable prefork mode.
    --limit-memory-soft=LIMIT_MEMORY_SOFT
                        Maximum allowed virtual memory per worker, when
                        reached the worker be reset after the current request
                        (default 671088640 aka 640MB).
    --limit-memory-hard=LIMIT_MEMORY_HARD
                        Maximum allowed virtual memory per worker, when
                        reached, any memory allocation will fail (default
                        805306368 aka 768MB).
    --limit-time-cpu=LIMIT_TIME_CPU
                        Maximum allowed CPU time per request (default 60).
    --limit-time-real=LIMIT_TIME_REAL
                        Maximum allowed Real time per request (default 120).
    --limit-request=LIMIT_REQUEST
                        Maximum number of request to be processed per worker
                        (default 8192).
```

工作进程的数量应该和分配到 VPS 的 CPU 核心数一样，或者，如果你想为 PostgreSQL 数据库，cron 任务，或者其它和 Odoo 实例安装在同一台 VPS 上的其它应用预留出一些 CPU 核心，那么你可以将工作进程数设置为一个比 VPS 上可用 CPU 核心更低的值，以避免资源耗尽。

limit-memory-soft 和 limit-memory-hard 参数不言自明，你可以使用默认值，也可以根据 VPS 上的实际可用 RAM 来进行修改。 

例如，如果你的 VPS 有 8 个 CPU 核心，以及 16 GB 内存，那么你可以将工作进程数设置为 17（CPU 核心数 x 2 + 1），limit-memory-soft 总值设置为 be 640 x 17 = 10880 MB，而 limit-memory-hard 总数设置为 68MB x 17 = 13056 MB，这样，Odoo 就会有总计达 12.75 GB 的 RAM。

例如，在一台拥有 16 GB RAM 和 8 个 CPU 核心的 VPS 上，编辑 Odoo 配置文件（如 /etc/odoo-server.conf），并添加以下行：
```
vi /etc/odoo-server.conf
```

```
workers = 17

limit_memory_hard = 805306368

limit_memory_soft = 671088640

limit_request = 8192

limit_time_cpu = 60

limit_time_real = 120

max_cron_threads = 2
```
别忘了重启 Odoo 让修改生效。

### 正确配置并优化 PostgreSQL

对于 PostgreSQL 优化，时刻将它更新到最新版本是一个不错的主意。在 PostgreSQL 配置文件（pg_hba.conf）中，有两个设置需要修改：shared_buffers 和 effective_cache_size。将 shared_buffers 设置为可用内存的 20%，effective_cache_size 设置为可用内存的 50%。

例如，如果 Odoo 安装到了一台 16 GB RAM 的 SSD VPS 上，那么在 pg_hba.conf 中使用如下设置：
```
vi /var/lib/postgresql/data/pg_hba.conf
```

```
shared_buffers = 3072MB
effective_cache_size = 8192MB
```
重启 PostgreSQL 服务来让修改生效。

同时，也别忘了周期性手动执行‘[VACUUM][4]‘ 。‘Vacuuming’会将陈旧或临时数据清理干净，但请牢记，它会大量占用 CPU 和磁盘使用。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/how-to-speed-up-odoo/

作者：[rosehosting.com][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/
[1]:https://www.rosehosting.com/linux-vps-hosting.html
[2]:https://www.rosehosting.com/linux-vps-hosting.html
[3]:https://www.rosehosting.com/odoo-hosting.html
[4]:https://wiki.postgresql.org/wiki/Introduction_to_VACUUM,_ANALYZE,_EXPLAIN,_and_COUNT
