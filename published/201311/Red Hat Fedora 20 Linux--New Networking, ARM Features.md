Fedora 20：新的网络配置功能、支持 ARM 设备
================================================================================
为了修复一些 bug 从而增强系统稳定性，在连着跳票几周后，最新的 [Fedora Linux][1] 终于要在12月份出来了。Fedora 是一款为 [RHEL][2] 做软件测试用的开源操作系统（即 Red Hat 公司会将那些在 Fedora 系统运行稳定的软件版本吸收到 RHEL 系统中 —— 译者注），这次更新将会带来什么样的变化呢？让我们来看一下。

![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2013/11/grayscale.jpg)

早在10月末，Fedora 项目就宣布 Fedora 20 正式版要延迟一周发布（Fedora 项目计划在每年的4月和10月发布新的版本，但几乎每次都在跳票，所以见怪不怪了 —— 译者的吐槽）。在11月1号，Fedora 项目又宣布将 Fedora 20 推迟一周。而[现在的计划][3]再次变成11月12日发布 Beta 版，12月17日发布正式版。

这个三连跳不禁又要让 Fedora 用户伤心一阵子了，但开发者说不断的修改发布计划，是为了让 Fedora 以更完美的姿态出现在大众眼前。（Fedora 这种追求完美的策略，与 [Canonical][4] 旗下的 [Ubuntu][5] 追求效率的策略形成鲜明的对比。Ubuntu 更愿意按计划发布新版本，这有助于它抢占 Linux 市场。）

抛下进度不提，Fedora 用户还是可以对这次最新最棒的版本更新抱有很大期望的。比如为了将桌面轻量化，Fedora 20 不再默认安装一些软件，像 syslog 和 sendmail。

NetworkManager 增加了一些很有用的功能，比如支持网桥和网卡绑定，在以前，要实现这两个酷酷的功能，需要通过复杂的命令行操作。在布署复杂的网络环境，特别是在云计算和软件定义网络（SDN）中，现在的 Fedora 对用户来说更有吸引力了。

Fedora 20 的目标是完全支持 ARM 设备（特别是 ARM7hl），这个目标能让它在移动终端和一些新兴硬件产品占有一席之地。

这些改进能让 Fedora 20 成为本季度最引人注目的 Linux 桌面发行版 —— 特别是在上月发布的 Unbuntu 13.10 的衬托下。Ubuntu 13.10 为桌面用户带来[极少的更新][6]。（它更多的是针对[服务器和云的更新][7]。）

由于 Red Hat 公司会从 Fedora 中挑选稳定可靠的软件版本并吸收到 RHEL 中，所以 Fedora 社区里会有很多高端用户。而对于社区中的这些用户来说，本次更新也是有重要意义的。他们应该在12月（如果不再跳票）就可以拿到 Fedora 20 正式版了，并且会期待着 Red Hat 公司什么时候能将这些新特性加入到 RHEL 中。

--------------------------------------------------------------------------------

via: http://thevarguy.com/open-source-application-software-companies/red-hat-fedora-20-linux-new-networking-arm-features

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://fedoraproject.org/
[2]:http://redhat.com/
[3]:http://fedoraproject.org/wiki/Releases/20/Schedule
[4]:http://canonical.com/
[5]:http://ubuntu.com/
[6]:http://thevarguy.com/ubuntu/canonicals-ubuntu-linux-1310-brings-few-changes-desktop
[7]:http://thevarguy.com/ubuntu/ubuntu-1310-openstack-havana-support-cloud-server-updates
