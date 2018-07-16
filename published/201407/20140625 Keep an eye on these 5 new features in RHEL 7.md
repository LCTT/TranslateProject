RHEL 7值得注意的5个新特性
================================================================================
> RHEL 7 支持Docker容器，systemd，兼容微软的身份管理和支持高达500TB的XFS文件系统。

![](http://www.infoworld.com/sites/infoworld.com/files/media/image/140.jpg)

在前一个主版本发布3年之后，经过至少6个月的[公开测试][1]，RHEL（Red Hat Enterprise Linux）版本7终于发布了。这次更新表明了红帽子公司对于在RHEL中添加最新的以企业和数据为中心的特性的兴趣。这里列举了其中5个最吸引人眼球的新特性。

### 1. Docker ###

RHEL 7中最大的新特性就是[紧密集成][2]了广受欢迎的应用程序虚拟化技术[Docker][3]。随着[Docker 1.0发布][4]，把它集成到RHEL 7里正是恰逢其时。

用Docker包装的应用程序可以独立于操作系统，所以它们可以在操作系统之间移植并且正常运行。RHEL 7打算尽可能高效地使用Docker，以防止应用程序竞争资源或者为使用哪种运行时环境而困惑。

从RHEL的Docker路线图上的长期计划表来看，这可能会超越操作系统本身，发展成一系列的Docker容器，它可以支持用最小的开销部署一个系统。这个被称为"[Atomic项目][5]"的计划还处于早期阶段，红帽公司准备首先将它部署在他的Fedora Linux发行版，仅仅当做对前沿技术的测试。

### 2. Systemd ###

引入systemd进程管理器可能引起系统管理员和Linux专家之间激烈的争论。systemd就被开发用于替代自专用Unix出现以来就在使用的init系统，它使得启动过程中装载服务更加高效。

因为systemd可能会带来一些不适，红帽公司没有马上在RHEL上使用systemd。早在2010发布的Fedora版本15就已经包含了systemd作为默认项目，这给了红帽公司一次很好的了解systemd在真实世界的运行的经验。同样，systemd也没有孤立地加入RHEL 7，而是作为这个OS大计划的一部分。例如，红帽公司希望通过使用systemd加强对RHEL 7中Docker容器的支持。

### 3. 默认使用 XFS ###

第3个主要的改变是使XFS成为RHEL默认的文件系统，尽管这可能不那么引人瞩目。

最初由Silicon Graphics International（硅谷图形公司）创建的XFS在Linux系统上用做生产环境已经很长时间了。在RHEL 7上它将支持高达500TB的文件系统。RHEL 6默认使用ext4，尽管它有XFS选项。红帽子的竞争对手Suse Linux [也支持XFS][6]，尽管它安装时[默认使用ext3][7]。

非常不幸的是，没有真正的方法可以将RHEL目前使用的其他文件系统，比如ext4或者btrfs移植到XFS。只能备份然后重建（来进行移植）。

### 4. 兼容微软的身份管理 ###

就算是那些不是微软系统粉丝的管理员也对微软目录服务保持一定的尊重。RHEL 7添加了两个关键的特性以优化处理微软目录服务（AD）的方式。跨域认证现在可以在RHEL 7和微软目录服务之间建立，所以目录服务用户可以直接访问Linux侧的资源，不需要再进行一次登录。RHEL 7另一个目录服务相关的附加特性，是基于DNS信息自动发现和加入目录服务（或者其他红帽子认证服务）。

### 5. 性能监控（PCP：Performance Co-Pilot） ###

进行性能调整的时候看不到实时数据就像是开着一辆挡风玻璃被刷上了油漆的车，所以RHEL 7添加了一个新的性能监控系统PCP([Performance Co-Pilot][8])，PCP最初由Silicon Graphics International（硅谷图形）[创建][9]，但是现在它是RHEL 7的一部分。除了监控和记录系统状态，PCP还为其他子系统提供获取数据的API和工具集，比如正如你猜到的，刚刚介绍的systemd。

遵循这个思路，另一个次要的附加特性：新的性能配置文件。RHEL 6已经有符合特殊应用场景的调整RHEL的配置文件。RHEL 7不仅默认有一个新的性能最大化的配置文件，而且包含另一个新的平衡性能表现和能源消耗的配置文件。

-------------------------------------------------------------------------------

via:http://www.infoworld.com/t/linux/keep-eye-these-5-new-features-in-rhel-7-244023 

译者：[love\_daisy\_love](https://github.com/CNprober) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.infoworld.com/t/linux/red-hat-enterprise-linux-7-beta-now-available-232520
[2]:http://www.infoworld.com/t/application-virtualization/red-hat-fast-tracks-docker-apps-enterprise-linux-238122
[3]:http://www.infoworld.com/t/application-virtualization/docker-unleashed-app-portability-gets-boost-231716
[4]:http://www.infoworld.com/d/application-development/review-docker-10-ready-prime-time-243935
[5]:http://www.projectatomic.io/
[6]:https://www.suse.com/products/server/technical-information/
[7]:https://www.suse.com/products/server/technical-information/
[8]:http://developerblog.redhat.com/2013/11/19/exploratory-performance-pcp/
[9]:http://oss.sgi.com/projects/pcp/index.html