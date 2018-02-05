Fedora 26 助力云、服务器、工作站系统
============================================================


[Fedora 项目][4] 7 月份宣布推出 Fedora 26, 它是全面开放源代码的 Fedora 操作系统的最新版本。

![Fedora 26 Powers Up Cloud, Server, Workstation Systems](http://www.linuxinsider.com/ai/631127/fedora.jpg)

Fedora Linux 是 Red Hat Enterprise Linux（RHEL）的社区版本。Fedora 26 包含一组基础包，形成针对不同用户的三个不同版本的基础。

Fedora <ruby>原子主机版<rt>Atomic Host Edition</rt></ruby> 是用于运行基于容器的工作的操作系统。Fedora <ruby>服务器版<rt>Server</rt></ruby>将 Fedora Server OS 安装在硬盘驱动器上。Fedora <ruby>工作站版<rt>Workstation</rt></ruby>是一款用于笔记本电脑和台式机的用户友好操作系统，它适用于广泛的用户 - 从业余爱好者和学生到企业环境中的专业人士。

所有这三个版本都有共同的基础和一些共同的优点。所有 Fedora 版本每年发行两次。

Fedora 项目是创新和新功能的测试基地。Fedora 项目负责人 Matthew Miller 说，有些特性将在即将发布的 RHEL 版本中实现。

他告诉 LinuxInsider：“Fedora 并没有直接参与这些产品化决策。Fedora 提供了许多想法和技术，它是 Red Hat Enterprise Linux 客户参与并提供反馈的好地方。”

### 强力的软件包

Fedora 开发人员更新和改进了所有三个版本的软件包。他们在 Fedora 26 中进行了许多错误修复和性能调整，以便在 Fedora 的用例中提供更好的用户体验。

这些安装包包括以下改进：

*   更新的编译器和语言，包括 GCC 7、Go 1.8、Python 3.6 和 Ruby 2.4；
*   DNF 2.0 是 Fedora 下一代包管理系统的最新版本，它与 Yum 的向后兼容性得到改善；
*   Anaconda 安装程序新的存储配置界面，可从设备和分区进行自下而上的配置；
*   Fedora Media Writer 更新，使用户可以为基于 ARM 的设备（如 Raspberry Pi）创建可启动 SD 卡。

[Endpoint Technologies Associates][5] 的总裁 Roger L. Kay 指出，云工具对于使用云的用户必不可少，尤其是程序员。

他对 LinuxInsider 表示：“Kubernetes 对于在混合云中编程感兴趣的程序员来说是至关重要的，这可能是目前业界更重要的发展之一。云，无论是公有云、私有云还是混合云 - 都是企业计算未来的关键。”

### Fedora 26 原子主机亮相

Linux 容器和容器编排引擎一直在普及。Fedora 26 原子主机提供了一个最小占用的操作系统，专门用于在裸机到云端的环境中运行基于容器的工作任务。

Fedora 26 原子主机更新大概每两周发布一次，这个时间表可以让用户及时跟上游创新。

Fedora 26 原子主机可用于 Amazon EC2 。OpenStack、Vagrant 镜像和标准安装程序 ISO 镜像可在 [Fedora 项目][6]网站上找到。

最小化的 Fedora 原子的容器镜像也在 Fedora 26 上首次亮相。

### 云托管

最新版本为 Fedora 26 原子主机提供了新功能和特性：

* 容器化的 Kubernetes 作为内置的 Kubernetes 二进制文件的替代品，使用户更容易地运行不同版本的容器编排引擎；
* 最新版本的 rpm-ostree，其中包括支持直接 RPM 安装，重新加载命令和清理命令;
* 系统容器，它提供了一种在容器中的 Fedora 原子主机上安装系统基础设施软件（如网络或 Kubernetes）的方法；
* 更新版本的 Docker、Atomic和 Cockpit，用于增强容器构建，系统支持和负载监控。

根据 Fedora 项目的 Miller 所言，容器化的 Kubernetes 对于 Fedora 原子主机来说是重要的，有两个重要原因。

他解释说：“首先，它可以让我们从基础镜像中删除它，减小大小和复杂度。第二，在容器中提供它可以轻松地在不同版本中切换，而不会破环基础，或者为尚未准备好进行改变的人造成麻烦。”

### 服务器端服务

Fedora 26 服务器版为数据中心运营提供了一个灵活的多角色平台。它还允许用户自定义此版本的 Fedora 操作系统以满足其独特需求。

Fedora 26 服务器版的新功能包括 FreeIPA 4.5，它可以改进容器中运行的安全信息管理解决方案，以及 SSSD 文件缓存，以加快用户和组查询的速度。

Fedora 26 服务器版月底将增加称为 “Boltron” 的 Fedora 模块化技术预览。作为模块化操作系统，Boltron 使不同版本的不同应用程序能够在同一个系统上运行，这实质上允许将前沿运行时与稳定的数据库配合使用。

### 打磨工作站版

对于一般用户的新工具和功能之一是更新的 GNOME 桌面功能。开发将获得增强的生产力工具。

Fedora 26 工作站版附带 GNOME 3.24 和众多更新的功能调整。夜光根据时间细微地改变屏幕颜色，以减少对睡眠模式的影响。[LibreOffice][7] 5.3 是开源办公生产力套件的最新更新。

GNOME 3.24 提供了 Builder 和 Flatpak 的成熟版本，它为开发人员提供了更好的应用程序开发工具，它可以方便地访问各种系统，包括 Rust 和 Meson。

### 不只是为了开发

根据 [Azul Systems][8] 的首席执行官 Scott Sellers 的说法，更新的云工具将纳入针对企业用户的 Linux 发行版中。

他告诉 LinuxInsider：“云是新兴公司以及地球上一些最大的企业的主要开发和生产平台。”

Sellers说：“鉴于 Fedora 社区的前沿性质，我们预计在任何 Fedora 版本中都会强烈关注云技术，Fedora 26 不会不令人失望。”

他指出，Fedora 开发人员和用户社区的另一个特点就是 Fedora 团队在模块化方面所做的工作。

Sellers 说：“我们将密切关注这些实验功能。”

### 支持的升级方式

Sellers 说 Fedora 的用户超过其他 Linux 发行版的用户，很多都有兴趣升级到 Fedora 26，即使他们不是重度云端用户。

他说：“这个发行版的主要优点之一就是能提前看到先进的生产级别技术，这些最终将被整合到 RHEL 中。Fedora 26 的早期评论表明它非常稳定，修复了许多错误以及提升了性能。”

Fedora 的 Miller 指出，有兴趣从早期 Fedora 版本升级的用户可能比擦除现有系统安装 Fedora 26 更容易。Fedora 一次维护两个版本，中间还有一个月的重叠。

他说：“所以，如果你在用 Fedora 24，你应该在下个月升级。幸运的 Fedora 25 用户可以随时升级，这是 Fedora 快速滚动版本的优势之一。”

### 更快的发布

用户可以安排自己升级，而不是在发行版制作出来时进行升级。

也就是说，Fedora 23 或更早版本的用户应该尽快升级。社区不再为这些版本发布安全更新

--------------------------------------------------------------------------------

作者简介：

Jack M. Germain 自 2003 年以来一直是 ECT 新闻网记者。他的主要重点领域是企业IT、Linux、和开源技术。他撰写了许多关于 Linux 发行版和其他开源软件的评论。发邮件联系 Jack


---------------

via: http://www.linuxinsider.com/story/84674.html

作者：[Jack M. Germain][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:jack.germain@newsroom.ectnews.comm
[1]:http://www.linuxinsider.com/story/84674.html?rss=1#
[2]:http://www.linuxinsider.com/perl/mailit/?id=84674
[3]:http://www.linuxinsider.com/story/84674.html?rss=1
[4]:https://getfedora.org/
[5]:http://www.ndpta.com/
[6]:https://getfedora.org/
[7]:http://www.libreoffice.org/
[8]:https://www.azul.com/
[9]:http://www.linuxinsider.com/story/84674.html?rss=1
[10]:http://www.linuxinsider.com/story/84674.html?rss=1
