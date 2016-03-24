如何在 Cacti 中合并两幅图片
================================================================================
[Cacti][1] 是一个很棒的开源网络监视系统，它广泛使用于图形化地展示网络元素，例如带宽、存储、处理器和内存使用。使用它的基于Web 的界面，你可以轻松地创建和组织各种图表。然而，它默认并没有提供一些高级功能，例如合并图片、使用多个来源创建聚合图形、迁移 Cacti 到另一台服务器。使用 Cacti 的这些功能你还需要一些经验。在该教程中，我们会看到如何在将两幅 Cacti 图片合并为一幅。

看看这个例子。在过去的 6 个月中，客户端 A 连接到了交换机 A 的端口 5。端口 5 发生了错误，因此客户端迁移到了端口 6。由于 Cacti 为每个接口/元素使用不同的图，客户端的带宽历史会分成端口 5 和端口 6。结果是对于一个客户端我们有两幅图片 - 一幅是 6 个月的旧数据，另一幅保存了后续的数据。

在这种情况下，我们实际上可以合并两幅图片将旧数据加到新的图中，使得用一个单独的图为一个用户保存历史的和新数据。本教程将会解释如何做到这一点。

Cacti 将每幅图片的数据保存在它自己的 RRD（round robin database，循环数据库）文件中。当请求一幅图片时，根据保存在对应 RRD 文件中的值生成图。在 Ubuntu/Debian 系统中，RRD 文件保存在 `/var/lib/cacti/rra`，在 CentOS/RHEL 系统中则是 `/var/www/cacti/rra`。

合并图片背后的思想是更改这些 RRD 文件使得旧 RRD 文件中的值能追加到新的 RRD 文件中。

### 情景 ###

一个客户端的服务在 eth0 上运行了超过一年。由于硬件损坏，客户端迁移到了另一台服务器的 eth1 接口。我们想展示新接口的带宽，同时保留超过一年的历史数据。该客户端希望只在一幅图中显示。

### 确定图的 RRD 文件 ###

图合并的首个步骤是确定与图相关联的 RRD 文件。我们可以通过以调试模式打开图检查文件。要做到这点，在 Cacti 的菜单中： 控制台 > 管理图 > 选择图 > 打开图调试模式。

#### 旧图： ####

![](https://farm4.staticflickr.com/3853/18795518096_f50a78d082_c.jpg)

#### 新图： ####

![](https://farm4.staticflickr.com/3674/18634036918_5c4118c4b9_c.jpg)

从样例输出（基于 Debian 系统）中，我们可以确定两幅图片的 RRD 文件：

- **旧图**： /var/lib/cacti/rra/old_graph_traffic_in_8.rrd
- **新图**： /var/lib/cacti/rra/new_graph_traffic_in_10.rrd 

### 准备脚本 ###

我们会用一个 [RRD 剪接脚本][2] 来合并两个 RRD 文件。下载该 PHP 脚本，并安装到 /var/lib/cacti/rra/rrdsplice.php (Debian/Ubuntu 系统) 或 /var/www/cacti/rra/rrdsplice.php (CentOS/RHEL 系统)。

下一步，确认 Apache 用户拥有该文件。

在 Debian 或 Ubuntu 系统中，运行下面的命令：

    # chown www-data:www-data rrdsplice.php

并更新 rrdsplice.php。查找下面的行：

    chown($finrrd, "apache");

用下面的语句替换：

    chown($finrrd, "www-data");

在 CentOS 或 RHEL 系统中，运行下面的命令即可：

    # chown apache:apache rrdsplice.php

### 合并两幅图 ###

通过不带任何参数运行该脚本可以获得脚本的使用语法。

    # cd /path/to/rrdsplice.php
    # php rrdsplice.php 

----------

    USAGE: rrdsplice.php --oldrrd=file --newrrd=file --finrrd=file

现在我们准备好合并两个 RRD 文件了。只需要指定旧 RRD 文件和新 RRD 文件的名称。我们会将合并后的结果重写到新 RRD 文件中。

    # php rrdsplice.php --oldrrd=old_graph_traffic_in_8.rrd --newrrd=new_graph_traffic_in_10.rrd --finrrd=new_graph_traffic_in_10.rrd 

现在旧 RRD 文件中的数据已经追加到了新 RRD 文件中。Cacti 会将任何新数据写到新 RRD 文件中。如果我们点击图，我们可以发现也已经添加了旧图的周、月、年记录。下面图表中的第二幅图显示了旧图的周记录。

![](https://farm6.staticflickr.com/5493/18821787015_6730164068_b.jpg)

总之，该教程显示了如何简单地将两幅 Cacti 图片合并为一幅。当服务迁移到另一个设备/接口，我们希望只处理一幅图片而不是两幅时，这个小技巧非常有用。该脚本非常方便，因为它可以不管源设备是不是相同都可以合并图片，例如 Cisco 1800 路由器和 Cisco 2960 交换机。

希望这些能对你有所帮助。

--------------------------------------------------------------------------------

via: http://xmodulo.com/combine-two-graphs-cacti.html

作者：[Sarmed Rahman][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:https://linux.cn/article-5746-1.html
[2]:http://svn.cacti.net/viewvc/developers/thewitness/rrdsplice/rrdsplice.php