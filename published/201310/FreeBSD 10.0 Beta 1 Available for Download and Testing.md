FreeBSD 10.0 Beta 1已经可以下载测试
================================================================================
**FreeBSD 10.0 Beta 1, 一个可以运行在x86, ARM, IA-64, PowerPC, PC-98, and UltraSPARC 等架构上的操作系统, 已经发布并且可供下载测试。**

![](http://i1-news.softpedia-static.com/images/news2/FreeBSD-10-0-Beta-1-Available-for-Download-and-Testing-391246-2.png)

FreeBSD的开发者在以不可思议的速度前进，并且不断地发布一个又一个的新版本. 新的测试版在有五个内测版的情况下完成，但是没有任何问题。

官方[公告][1]称，“因为在最后一刻发现10.0-BETA1 freebsd-update(8) 中存在问题，freebsd-update(8) 不支持10.0-BETA1的升级。所以请不要用freebsd-update(8) 来升级 10.0-BETA1。请注意 cvsup和CVS不支持用于的src/tree方式的升级。” 

而且, 据开发者说, ports.txz发行版没有被包含在 10.0 Beta 1 发布版中,但是它有望在发行周期中被纳入后续版本的disc1.iso中。

###FreeBSD 10.0 Beta 1的亮点:

- freebsd-version，一个用于审核的工具，已经完成。如果你想确定客户端补丁级别，这是一个很重要的工具，它与'uname -r'的报告是不同的；
- ZFS lzjb的解压性能有所改进；
- 支持了两种新的MIPS CPU：mips24k和mips74k；
- 每个jail配置的"jail_<jname>_*" rc.conf(5) 变量的配置被自动转换到/var/run/jail。<jname>.conf在jail(8)之前调用, 因此采用了新的jail.conf(5)语法；
- 绝大多数的ATF工具和_atf用户被移除;

发行方鼓励用户们测试发行版并报告任何发现的问题。官方[变更目录][1]有完整的修正和修改列表。现在可以在Softpedia立刻下载FreeBSD 10.0 Beta 1。

请注意这是一个开发者版本请不要再任何产品端上安装。它仅被希望用于测试目的。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/FreeBSD-10-0-Beta-1-Available-for-Download-and-Testing-391246.shtml

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[crowner](https://github.com/crowner) 校对：[wxy](https://github.com/wxy)

[1]:http://lists.freebsd.org/pipermail/freebsd-current/2013-October/045524.html
