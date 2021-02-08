[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11375-1.html)
[#]: subject: (Microsoft brings IBM iron to Azure for on-premises migrations)
[#]: via: (https://www.networkworld.com/article/3438904/microsoft-brings-ibm-iron-to-azure-for-on-premises-migrations.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Skytap 和微软将 IBM 机器搬到了 Azure
======

> 微软再次证明了其摒弃了“非我发明”这一态度来支持客户。

![](https://images.idgesg.net/images/article/2019/05/cso_microsoft_azure_backups_cloud_computing_binary_data_transfer_by_just_super_gettyimages-1003878434_3x2_2400x1600-100796537-large.jpg)

当微软将 Azure 作为其 Windows 服务器操作系统的云计算版本发布时，它并没有使其成为仅支持 Windows 系统的版本，它还支持 Linux 系统，并且在短短几年内[其 Linux 实例的数量现在已经超过了Windows 实例的数量][1]。

很高兴看到微软终于摆脱了这种长期以来非常有害的“非我发明”态度，该公司的最新举动确实令人惊讶。

微软与一家名为 Skytap 的公司合作，以在 Azure 云服务上提供 IBM Power9 实例，可以在 Azure 云内运行基于 Power 的系统，该系统将与其已有的 Xeon 和 Epyc 实例一同作为 Azure 的虚拟机（VM）。

Skytap 是一家有趣的公司。它由华盛顿大学的三位教授创立，专门研究本地遗留硬件的云迁移，如 IBM System I 或 Sparc 的云迁移。该公司在西雅图拥有一个数据中心，以 IBM 的硬件运行 IBM 的 PowerVM 管理程序，并且对在美国和英格兰的 IBM 数据中心提供主机托管。

该公司的座右铭是快速迁移，然后按照自己的节奏进行现代化。因此，它专注于帮助一些企业将遗留系统迁移到云，然后实现应用程序的现代化，这也是它与微软合作的目的。Azure 将通过为企业提供平台来提高传统应用程序的价值，而无需花费巨额费用重写一个新平台。

Skytap 提供了预览，可以看到使用 Skytap 上的 DB2 提升和扩展原有的 IBM i 应用程序以及通过 Azure 的物联网中心进行扩展时可能发生的情况。该应用程序无缝衔接新旧架构，并证明了不需要完全重写可靠的 IBM i 应用程序即可从现代云功能中受益。

### 迁移到 Azure

根据协议，微软将把 IBM 的 Power S922 服务器部署在一个未声明的 Azure 区域。这些机器可以运行 PowerVM 管理程序，这些管理程序支持老式 IBM 操作系统以及 Linux 系统。

Skytap 首席执行官<ruby>布拉德·希克<rt>Brad Schick</rt></ruby>在一份声明中说道：“通过先替换旧技术来迁移上云既耗时又冒险。……Skytap 的愿景一直是通过一些小小的改变和较低的风险实现企业系统到云平台的迁移。与微软合作，我们将为各种遗留应用程序迁移到 Azure 提供本地支持，包括那些在 IBM i、AIX 和 Power Linux 上运行的程序。这将使企业能够通过使用 Azure 服务进行现代化来延长传统系统的寿命并增加其价值。”

随着基于 Power 应用程序的现代化，Skytap 随后将引入 DevOps CI/CD 工具链来加快软件的交付。迁移到 Azure 的 Skytap 上后，客户将能够集成 Azure DevOps，以及 Power 的 CI/CD 工具链，例如 Eradani 和 UrbanCode。

这些听起来像是迈出了第一步，但这意味着以后将会实现更多，尤其是在应用程序迁移方面。如果它仅在一个 Azure 区域中，听起来好像它们正在对该项目进行测试和验证，并可能在今年晚些时候或明年进行扩展。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438904/microsoft-brings-ibm-iron-to-azure-for-on-premises-migrations.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/Morisun029)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.openwall.com/lists/oss-security/2019/06/27/7
[2]: https://www.networkworld.com/article/3119362/hybrid-cloud/how-to-make-hybrid-cloud-work.html#tk.nww-fsb
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
