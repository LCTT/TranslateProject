什么是 Linux 服务器以及你的业务为什么需要它？
=====

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR)
IT 组织力求通过提高生产力和提供更快速的服务来提供商业价值，同时保持足够的灵活性，将云，容器和配置自动化等创新融入其中。现代的工作负载，无论是裸机，虚拟机，容器，还是私有云或公共云，都预计是可移植且可扩展的。支持所有的这些需要一个现代且安全的平台。

通往创新最直接的途径并不总是一条直线。随着私有云和公共云，多种体系架构和虚拟化的日益普及，当今的数据中心就像一个球一样，基础设施的选择各不相同，从而带来了维度和深度。就像飞行员依赖空中交通管制员提供持续更新一样，数字化转型之旅应该由像 Linux 这样可信赖的操作系统来指导，以提供持续更新的技术，以及对云，容器和配置自动化等创新的最有效和安全的访问。

Linux 是一个家族，它围绕 Linux 内核构建的免费开源软件操作系统。最初开发的基于 Intel x86 架构的个人电脑，此后比起任何其他操作系统，Linux 被移植到更多的平台上。得益于基于 Linux 内核的 Android 操作系统在智能手机上的主导地位，Linux 拥有所有通用操作系统中最大的安装基数。Linux 也是服务器和大型计算机等“大型机”系统的主要操作系统，也是 [TOP500][1] 超级计算机上唯一使用的操作系统。

为了利用这一功能，许多企业公司已经采用具有高性能的 Linux 开源操作系统的服务器。这些旨在处理最苛刻的业务应用程序要求，如网络和系统管理，数据库管理和 Web 服务。Linux 服务器通常选择其他服务器操作系统(to 校正者：这句话望细心理解)，以保证它们的稳定性，安全性和灵活性。领先的 Linux 服务器操作系统包括 [Debian][2], [Ubuntu Server][3], [CentOS][4], [Slackware][5]和[Gentoo][6]。

在企业级工作负载中，你应该考虑企业级 Linux 服务器上的哪些功能和优势？首先，通过对 Linux 和 Windows 管理员都熟悉的接口，内置的安全控制和可管理的扩展使你可以专注于业务增长，而不是对安全漏洞和昂贵的管理配置错误担心。你选择的 Linux 服务器应提供安全技术和认证，并保持增强以抵御入侵，保护你的数据，并满足一个开放源代码项目或特定系统供应商的合规性。它应该：

  * 使用集中式身份管理和[安全增强型 Linux][7]（SELinux），强制访问控制（MAC）等集成控制功能来**安全地交付资源**。这是[通用的标准][8] 和 [FIPS 140-2 认证][9]。并且第一个 Linux 容器框架支持是通用的标准认证。（to 校正：这段话不怎么通顺）

  * **自动执行法规遵从和安全配置修复** 应贯穿于你的系统和容器。通过像 OpenSCAP 的图像扫描，它应该检查，补救漏洞和配置安全基准，包括针对 [PCI-DSS][12], [DISA STIG][13] 等的[国家清单程序][11]内容。另外，它应该在整个混合环境中集中和扩展配置修复。

  * **持续接收漏洞安全更新**，从上游社区或特定的系统供应商，如有可能，可在下一工作日补救并提供所有关键问题，以最大限度地降低业务影响。

作为混合数据中心的基础，Linux 服务器应提供平台可管理性和与传统管理和自动化基础设施的灵活集成。与非付费的 Linux 基础设施相比，这将节省 IT 员工的时间并减少意外停机的情况。它应该：

  * 通过内置功能 **加速整个数据中心的映像构建，部署和补丁管理**，并丰富系统生命周期管理，配置和增强的修补等等。

  * 通过一个 **简单易用的 web 界面管理单个系统**，包括存储，网络，容器，服务等等。

  * 通过使用 [Ansible][14], [Chef][15], [Salt][16], [Puppet][17] 等原生配置管理工具，可以跨异构多个环境实现 **自动化一致性和合规性**，并通过系统角色减少脚本返工。

  * 通过就地升级 **简化平台更新**，消除机器迁移和应用程序重建的麻烦。

  * 通过使用预测分析工具自动识别和修复异常情况及其根本原因，在技术问题影响业务运营之前 **解决技术问题**。

Linux 服务器正在在全球范围内推动创新。作为一个企业工作负载的平台，Linux 服务器应该为运行当下和未来业务的应用程序提供稳定，安全和性能驱动的基础。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/what-linux-server

作者：[Daniel Oh][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/daniel-oh
[1]:https://en.wikipedia.org/wiki/TOP500
[2]:https://www.debian.org/
[3]:https://www.ubuntu.com/download/server
[4]:https://www.centos.org/
[5]:http://www.slackware.com/
[6]:https://www.gentoo.org/
[7]:https://en.wikipedia.org/wiki/Security-Enhanced_Linux
[8]:https://en.wikipedia.org/wiki/Common_Criteria
[9]:https://en.wikipedia.org/wiki/FIPS_140-2
[10]:https://www.open-scap.org/
[11]:https://www.nist.gov/programs-projects/national-checklist-program
[12]:https://www.pcisecuritystandards.org/pci_security/
[13]:https://iase.disa.mil/stigs/Pages/index.aspx
[14]:https://www.ansible.com/
[15]:https://www.chef.io/chef/
[16]:https://saltstack.com/salt-open-source/
[17]:https://puppet.com/
