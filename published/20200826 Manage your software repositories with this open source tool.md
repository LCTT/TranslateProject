[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12617-1.html)
[#]: subject: (Manage your software repositories with this open source tool)
[#]: via: (https://opensource.com/article/20/8/manage-repositories-pulp)
[#]: author: (Melanie Corr https://opensource.com/users/melanie-corr)

用这个开源工具管理你的软件仓库
======

> 这篇文章介绍 Pulp，一个开源仓库管理解决方案，它的使用范围和功能在不断增长。

![](https://img.linux.net.cn/data/attachment/album/202009/15/205353hlidoullmmj44vzq.jpg)

[Foreman][2] 是一个强大的管理和自动化产品，它为 Linux 环境的管理员提供了企业级的解决方案，它适用于四个关键场景：供应管理、配置管理、补丁管理和内容管理。Foreman 中内容管理功能的一个主要组成部分是由 Pulp 项目提供的。虽然 Pulp 是这个产品的一个组成部分，但它也是一个独立的、自由开源的项目，自身也在取得巨大的进步。

让我们来看看 Pulp 项目，特别是最新版本 Pulp 3 的功能。

### 什么是 Pulp？

Pulp 是一个管理软件包仓库，并将其提供给大量的消费者的平台。你可以使用 Pulp 在不同环境中镜像、同步、上传和推广各种内容，如 RPM、Python 包、Ansible 集合、容器镜像等。如果你有几十个、几百个甚至上千个软件包，并需要更好的方式来管理它们，Pulp 可以帮助你。

最新的主要版本是 [Pulp 3][3]，它于 2019 年 12 月发布。Pulp 3 是多年来收集用户需求的结晶，并对现有的 Pulp 架构进行了全面的技术改造，以提高可靠性和灵活性。另外，它还包含了大量的新功能。

### 谁在使用 Pulp？

大多数情况下，在 Pulp 用户管理的企业软件环境中，内容的稳定性和可靠性是最重要的。Pulp 用户希望有一个平台来开发内容，而不用担心仓库可能会消失。他们希望以安全的方式在其生命周期环境的不同阶段推广内容，优化磁盘空间并扩展环境以满足新的需求。他们还需要灵活处理各种内容类型。Pulp 3 提供了这些以及更多功能。

### 在一处管理各类内容

安装 Pulp 后，你可以为你计划管理的内容类型添加[内容插件][4]，将内容镜像到本地，添加私人托管的内容，并根据你的需求混合内容。例如，如果你是 Ansible 用户，而你又不想在 Ansible Galaxy 上托管你的私有内容，你可以添加 Pulp Ansible 插件，镜像你所需要的公共 Ansible 内容，并将 Pulp 作为一个内部平台，在你的组织中管理和分发可扩展的公共和私有 Ansible 角色和集合的混合。你可以用任何内容类型执行此操作。有各种各样的内容插件可供选择，包括 RPM、Debian、Python、容器和 Ansible 等等。还有一个文件插件，你可以用它来管理 ISO 镜像等文件。

如果你没有找到你所需的内容类型插件，Pulp 3 引入了新的插件 API 和插件模板，你可以轻松创建一个属于自己的 Pulp 插件。你可以根据[插件编写指南][5]自动生成一个最小可用的插件，然后从那里开始构建。

### 高可用性

在 Pulp 3 中，从 MongoDB 到 PostgreSQL 的转变促进了性能和数据完整性的重大改进。Pulp 用户现在有了一个完全开源的技术栈，它可以提供高可用性（HA）和更好的扩展性。

### 仓库版本管理

使用 Pulp 3，你可以毫无风险地进行试验。每次你添加或删除内容时，Pulp 都会创建一个不可变的仓库版本，这样你就可以回滚到早期的版本，从而保证操作的安全性和稳定性。通过使用发布和分发，你可以公开一个仓库的多个版本，你可以将其作为回滚到早期版本的另一种方法。如要回滚，你可以简单地将你的分发指向一个旧的发布。

### 磁盘优化

任何软件开发环境的主要挑战之一是磁盘优化。如果你不断地下载包，例如，你今天需要但明天不再需要的仓库每日构建，那么磁盘空间将很快成为一个问题。Pulp 3 的设计已经考虑到了磁盘优化。当默认下载并保存所有的软件包，你也可以启用“按需”或“流式”选项。“按需”选项只下载和保存客户要求的内容，从而节省了磁盘空间。使用“流式”选项，它也会根据客户的要求进行下载，但它不会将内容保存在 Pulp 中。这对于同步内容是非常理想的，例如，从一个每日仓库同步，并让你在后期免于执行磁盘清理。

### 多种存储选项

即使进行了最好的磁盘优化，随着项目的发展，你可能需要一种方法来扩展你的部署以满足需求。除了本地文件存储，Pulp 还支持一系列的云存储选项，如 Amazon S3 和 Azure，以确保你可以扩展满足你的部署需求。

### 保护你的内容

Pulp 3 可以选择添加 [Certguard][6] 插件，该插件提供了一个支持 X.509 的 ContentGuard，它要求客户在收到 Pulp 的内容之前提交证明其对内容的权利的证书。

只要客户端的证书没有过期，且由证书颁发机构签署，并在创建时存储在 Certguard 上，任何客户端在请求时提供基于 X.509 或基于 Red Hat 订阅管理证书都将获得授权。客户端使用安全传输层（TLS）提供证书，这证明客户端不仅有证书，还有它的密钥。你可以放心地开发，知道你的内容正在受到保护。

Pulp 团队也在积极为整个 Pulp 部署一个基于角色的访问控制系统，这样管理员就可以确保正确的用户可以访问正确的环境。

### 在容器中试用 Pulp

如果你有兴趣亲自评估 Pulp 3，你可以使用 Docker 或 Podman 轻松[在容器中安装 Pulp 3][7]。Pulp 团队一直在努力简化安装过程。你也可以使用 [Ansible 剧本][8] 来自动完成 Pulp 3 的全部安装和配置。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/manage-repositories-pulp

作者：[Melanie Corr][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/melanie-corr
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fruit-orange-pomegranate-pulp-unsplash.jpg?itok=4cvODZDJ (Oranges and pomegranates)
[2]: https://opensource.com/article/17/8/system-management-foreman
[3]: https://pulpproject.org/about-pulp-3/
[4]: https://pulpproject.org/content-plugins/
[5]: https://docs.pulpproject.org/plugins/plugin-writer/index.html
[6]: https://pulp-certguard.readthedocs.io/en/latest/
[7]: https://pulpproject.org/pulp-in-one-container/
[8]: https://pulp-installer.readthedocs.io/en/latest/
