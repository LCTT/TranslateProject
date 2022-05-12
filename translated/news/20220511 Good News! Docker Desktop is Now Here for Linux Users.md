[#]: subject: "Good News! Docker Desktop is Now Here for Linux Users"
[#]: via: "https://news.itsfoss.com/docker-desktop-linux/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

好消息！Docker Desktop 现已支持 Linux
======
你现在可以在 Linux 上使用 Docker Desktop 无缝地创建容器了！它可用于 Debian、Ubuntu 和 Fedora，并对 Arch  Linux 提供实验性支持。

![Docker][1]

Docker Desktop 是容器化应用程序的最简单的方法。有了它，你就不需要预先设置平台相关环境。

你只需要安装 Docker Desktop，就可以开始了。Docker Desktop 附带了许多容器工具，如 Kubernetes、Docker Compose、BuildKit 和漏洞扫描工具。

此前，它可用于 Windows 和 macOS，但不支持 Linux 平台。所以，Linux 用户只好直接与 docker 引擎交互，以创建/测试他们的 docker 容器。

终于，现在所有 Linux 用户也可以通过 Docker Desktop 来方便地使用 Docker 了。

### Linux 版的 Docker Desktop 来了

在 Docker 团队关于未来开发/改进的公共路线图中，Linux 版的 [Docker Desktop][2] 是呼声最高的。

有了 Linux 版的 Docker Desktop，你终于可以不费吹灰之力地得到跨平台的 Docker 体验。

我在这里列出其中一些亮点。现在，作为一名使用 Linux 桌面的开发者，你可以：

* 使用 Docker <ruby>扩展<rt>Extension</rt></ruby> 访问新功能
* 与 Kubernetes 无缝集成
* 轻松地管理和组织 <ruby>数据卷<rt>volumes</rt></ruby>、<ruby>容器<rt>containers</rt></ruby> 和 <ruby>镜像<rt>images</rt></ruby>

### 在 Linux 上安装 Docker Desktop

值得注意的是，目前（在 Linux 上）安装 Docker Desktop 并不会很容易，但也不会十分复杂。

Docker 团队计划尽快改进安装和更新过程。

截至目前，你可以得到官方支持的 Ubuntu、Debian 和 Fedora 的 deb 或 rpm 包。支持 Arch Linux 的软件包还未开发完成，但已经可以下载来测试了。

如果你的桌面环境不是 GNOME 的话，你还需要安装 GNOME 终端。

在 Linux 上安装 Docker Desktop 对系统也有整体要求，包括：

* 64 位 Ubuntu 22.04 LTS、Ubuntu 21.10、Fedora 35、Fedora 36 或 Debian 11。
* 支持 KVM 虚拟化
* QEMU 5.2 或更新版本
* Systemd 系统守护工具
* GNOME 或 KDE 桌面环境
* 4GB 的内存

至于安装步骤，你可以参照文档中的 [官方说明][3] 进行。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/docker-desktop-linux/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/docker-desktop-available-on-linux.jpg
[2]: https://www.docker.com/products/docker-desktop/
[3]: https://docs.docker.com/desktop/linux/install/
