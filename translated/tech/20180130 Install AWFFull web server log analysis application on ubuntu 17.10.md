在 Ubuntu 17.10 上安装 AWFFull Web 服务器日志分析应用程序
======


AWFFull 是基于 “Webalizer” 的 Web 服务器日志分析程序。AWFFull 以 HTML 格式生成使用统计信息以便用浏览器查看。结果以柱状和图形两种格式显示，这有利于解释。它提供每年、每月、每日和每小时使用统计数据，并显示网站、URL、referrer、user agent（浏览器）、用户名、搜索字符串、进入/退出页面和国家（如果一些信息不存在于处理后日志中那么就没有）。AWFFull 支持 CLF（通用日志格式）日志文件，以及由 NCSA 和其他人定义的组合日志格式，它还能只能地处理这些格式的变体。另外，AWFFull 还支持 wu-ftpd xferlog 格式的日志文件，它能够分析 ftp 服务器和 squid 代理日志。日志也可以通过 gzip 压缩。

如果检测到压缩日志文件，它将在读取时自动解压缩。压缩日志必须是  .gz 扩展名的标准 gzip 压缩。

### 对于 Webalizer 的修改

AWFFull 基于 Webalizer 的代码，并有许多大的和小的变化。包括：

o 不止原始统计数据：利用已发布的公式，提供额外的网站使用情况。

o GeoIP IP 地址能更准确地检测国家。

o 可缩放的图形

o 与 GNU gettext 集成，能够轻松翻译。目前支持 32 种语言。

o 在首页显示超过 12 个月的网站历史记录。

o 额外的页面计数跟踪和排序。

o 一些小的可视化调整，包括 Geolizer 使用在卷中使用 Kb、Mb。

o 额外的用于 URL  计数、进入和退出页面、站点的饼图

o 图形上的水平线更有意义，更易于阅读。

o User Agent 和 Referral 跟踪现在通过 PAGES 而非 HITS 进行计算。

o 现在支持 GNU 风格的长命令行选项（例如 --help）。

o 可以通过排除“什么不是”以及原始的“什么是”来选择页面。

o 对被分析站点的请求以匹配的引用 URL 显示。

o 404 错误表，并且可以生成引用 URL。

o 外部 CSS 文件可以与生成的 html 一起使用。

o POST 分析总结使得手动优化配置文件性能更简单。

o 指定的 IP 和地址可以分配给指定的国家。

o 便于使用其他工具详细分析的转储选项。

o 支持检测并处理 Lotus Domino v6 日志。

**在 Ubuntu 17.10 上安装 awffull**

> sudo apt-get install awffull

### 配置 AWFFULL

你必须在 /etc/awffull/awffull.conf 中编辑 awffull 配置文件。如果你在同一台计算机上运行多个虚拟站点，​​则可以制作多个默认配置文件的副本。

> sudo vi /etc/awffull/awffull.conf

确保有下面这几行

> LogFile /var/log/apache2/access.log.1
>  OutputDir /var/www/html/awffull

保存并退出文件

你可以使用以下命令运行 awffull

> awffull -c [your config file name]

这将在 /var/www/html/awffull 目录下创建所有必需的文件，以便你可以使用 http://serverip/awffull/

你应该看到类似于下面的页面

如果你有更多站点，你可以使用 shell 和计划任务自动化这个过程。


--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/install-awffull-web-server-log-analysis-application-on-ubuntu-17-10.html

作者：[ruchi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
