专有 Unix 持续缩减
================================================================================
国际数据公司（IDC）的分析师在周三投寄了一篇[新闻稿][1]凸显出IBM 的 AIX 系统和 P-系列的硬件持有量已经快速下降。伴随着专有 Unix 系统下跌的同时，相关的运行着 Linux 系统的 X86 服务器销量却在崛起。IBM 已经明确指出这是一个长期趋势，所以投资了10亿美元用在基于 Power 系统的 Linux 开发。与新闻报道的 AIX 20％销售额下降的同时，我的这篇文章终于发布出来。

I've had the dubious pleasure of administering both AIX and Linux systems for the past several years, and if I could pick and choose, I would take the flexibility and ease of use of Linux and the stability of Power. In my experience, AIX is difficult to set up, and difficult to change after it is set up, but once it is up and running it just runs. A properly configured AIX server can run for years without intervention, but when that time for modification comes, which it always does, prepare for a long hard slog. By contrast, Linux has become exponentially easier to manage over the years, thanks to the contributions of thousands of developers and sysadmins, as well as the contributions of big name corporations. As reported by [Infoworld][2]:

> The Linux server market is solidly on the rise as a percentage of total server sales up to 28 percent of total revenue so any investment that can improve market share is going to be worthwhile, even as the lion's share of Linux servers continues to be commodity x86 hardware.

Intel and AMD hardware has also grown by leaps and bounds, narrowing the performance gap with Power. I'm always a bit surprised when I hear that 10GB ethernet comes standard on a new blade, or that 256 GB of RAM is not considered unusual, or that it is considered the normal course of business to order a few servers with 16 cores each. Intel servers are nearly as powerful as IBM's Power, and normally cost much less. To businesses interested in escaping "consultingware" and IBM's vendor lock in, open source software running on industry standard x86 hardware is becoming increasingly attractive. However, IBM has lowered the prices of Power systems to remain competitive.

It is telling that IBM chose to invest in Linux on Power instead of AIX. IBM could have chosen to modernize AIX and provide better interoperability with common open source tools. While IBM claims that AIX is still important, the continuing drop in Power sales along with the Linux investment is beginning to tell a different story.

IBM may not be able to turn things around for AIX, but they could prolong its life indefinitely. It would be interesting to see how the market would react if AIX was released as open source. 

--------------------------------------------------------------------------------

via: http://ostatic.com/blog/proprietary-unix-continues-to-fall

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.idc.com/getdoc.jsp?containerId=prUS24476413
[2]:http://www.infoworld.com/t/unix/ibms-losing-ground-unix-and-oracle-may-follow-232234
