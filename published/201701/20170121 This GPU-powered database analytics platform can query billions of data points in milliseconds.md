MapD：由 GPU 驱动的数据库分析平台可在几毫秒内查询数十亿条数据
=================================================

 ![database analytics platform MapD](http://i0.wp.com/opensourceforu.com/wp-content/uploads/2015/03/Database-Backup1.jpg?resize=750%2C525) 


麻省理工学院计算机科学与人工智能实验室（CSAIL）的前研究员开发了一款名为 MapD 的数据库分析平台。该平台使用 GPU 而不是 CPU ，可在几毫秒内查询和映射数十亿条数据。

人们通常将 GPU 与图像处理和游戏相关联。然而，现代 GPU 中高效的核心和处理单元也可以用于通用计算应用。以前在 CSAIL 工作的 Todd Mostak 开发了 MapD，它能在毫秒内处理数十亿条数据。

Mostak [声称][5] 他的 MapD 比由 CPU 驱动的传统数据库管理系统的快 100 倍。该平台可以在短时间内处理并可视化大量数据，并且被处理的数据的参数可以很容易地修改。

MapD 将所有数据缓存在多个 GPU 上，而不是存储在某些 CPU 上。每个 GPU 被给予不同的缓冲池以节省时间。通过此过程，系统可以提供比 CPU 驱动的数据库系统快两到三倍的性能。

许多公司客户已经开始使用 Mostak 的 MapD。像 Verizon 这样的电信公司据说也在为其内部研发尝试该数据库分析平台。这家电信公司使用 MapD 分析了 8500 万用户的 SIM 卡更新数据库。

除了 Verizon，MapD 还有如社交媒体公司，金融和广告公司的客户。

由 Mostak 领导的创业公司最近从美国中央情报局的投资部门 In-Q-Tel 筹集了一笔资金。你可以期望在不久的将来在不同的领域中使用 MapD 的各种情况。

--------------------------------------------------------------------------------

via: http://opensourceforu.com/2017/01/gpu-powered-database-analytics-platform-query-billions-data-points/

作者：[RAJAT KABADE][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://twitter.com/home?status=This%20GPU-powered%20database%20analytics%20platform%20can%20query%20billions%20of%20data%20points%20in%20milliseconds+http://opensourceforu.com/2017/01/gpu-powered-database-analytics-platform-query-billions-data-points/
[2]:https://plus.google.com/share?url=http://opensourceforu.com/2017/01/gpu-powered-database-analytics-platform-query-billions-data-points/
[3]:http://pinterest.com/pin/create/button/?url=http://opensourceforu.com/2017/01/gpu-powered-database-analytics-platform-query-billions-data-points/&media=http://opensourceforu.com/wp-content/uploads/2015/03/Database-Backup1.jpg&description=This%20GPU-powered%20database%20analytics%20platform%20can%20query%20billions%20of%20data%20points%20in%20milliseconds
[4]:https://www.tumblr.com/widgets/share/tool?shareSource=legacy&canonicalUrl=&url=http%3A%2F%2Fopensourceforu.com%2F2017%2F01%2Fgpu-powered-database-analytics-platform-query-billions-data-points%2F&posttype=link&title=This+GPU-powered+database+analytics+platform+can+query+billions+of+data+points+in+milliseconds&content=
[5]:http://news.mit.edu/2017/startup-mapd-fast-big-data-mapping-0111
