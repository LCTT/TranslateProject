crowner翻译
FreeBSD 10.0 Beta 1已经可以下载测试
================================================================================
**FreeBSD 10.0 Beta 1, 一个可以运行在x86, ARM, IA-64, PowerPC, PC-98, and UltraSPARC 等架构上的操作系统, 已经发布并且可供下载测试。**

![](http://i1-news.softpedia-static.com/images/news2/FreeBSD-10-0-Beta-1-Available-for-Download-and-Testing-391246-2.png)

FreeBSD的开发者在以不可思议的速度前进，并且不断地发布一个有一个的版本. 新的测试版在有五个内测版的情况下完成，但是没有任何问题。

官方[公告][1]称，“因为在最终发现的存在于10.0-BETA1 freebsd-update(8) 套件中的问题,freebsd-update(8) 将 不被支持用于升级10.0-BETA1。请不要用freebsd-update(8) 来升级 10.0-BETA1。请注意 cvsup和CVS不被支持用于的升级src/ tree。” 。

而且, 据开发者说, ports.txz发行版没有被包含在 10.0 Beta 1 发布版中,但是它有望在发行周期中被纳入后续版本的disc1.iso中。

FreeBSD 10.0 Beta 1的亮点:

- freebsd-version,用于审核的工具,已经实现。如果你想确定客户端补丁级别，当它与'uname -r'的报告不同时这是一个很重要的工具;
- ZFS lzjb的解压表现有所改进;
- 两种新的MIPS CPU, mips24k和mips74k获得支持;
-   在jail(8)组件调用前，for 每一个jail的"jail_<jname>_*" rc.conf(5) 变量的配置是自动转换为/var/run/jail.<jname>.conf的, 因此新的jail.conf(5)语法已被使用;
- 绝大多数的ATF工具和_atf用户被移除;

发行方鼓励用户们测试发行版并报告任何发现的问题. 官方[变更目录][1] 有完整的修正和修改列表. 现在可以在Softpedia立刻下载FreeBSD 10.0 Beta 1。

请注意这是一个开发者版本请不要再任何产品端上安装。它仅被希望用于测试目的.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/FreeBSD-10-0-Beta-1-Available-for-Download-and-Testing-391246.shtml

鏈枃鐢?[LCTT](https://github.com/LCTT/TranslateProject) 鍘熷垱缈昏瘧锛孾Linux涓浗](http://linux.cn/) 鑽ｈ獕鎺ㄥ嚭

璇戣€咃細[crowner](https://github.com/璇戣€匢D) 鏍″锛歔鏍″鑰匢D](https://github.com/鏍″鑰匢D)

[1]:http://lists.freebsd.org/pipermail/freebsd-current/2013-October/045524.html
