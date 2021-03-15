[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 open source alternatives to GitHub)
[#]: via: (https://opensource.com/article/20/11/open-source-alternatives-github)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 种开源的 GitHub 替代品
======
通过将你的开源代码保存在开源知识库中来保持快速恢复。
![女人编程][1]

Git 是一种流行的版本控制系统，主要用于代码(维护)，但在 [其他学科][2] 中也很流行。它可以在您的计算机上本地运行以供个人使用，也可以在服务器上运行以进行协作，也可以作为托管服务运行以供公众广泛的参与。有很多自成一格的托管服务，[GitHub][3] 是最受欢迎的品牌之一。

GitHub 不是开源的。在实用方面，对大多数用户来说没有太大区别。据推测，鼓励所有人将 GitHub 上的绝大多数代码共享，因此 GitHub 的主要功能是一种公共备份服务。如果 GitHub 折叠或彻底改变其服务条款，恢复数据将相对简单，因为在 GitHub 上拥有代码的本地副本是预期的。然而，一些组织已经开始依赖 GitHub 服务提供的非 Git 部分，这使得从 GitHub 迁移变得困难。这是一个尴尬的地方，因此对于许多人和组织而言，防止供应商锁定的保障措施是一项值得做的投资。

如果这是您的工作，请查看这五个 GitHub 替代方案，所有这些替代方案都是开源的。

### 1\. GitLab

![GitLab][4]

(Seth Kenlon, [CC BY-SA 4.0][5])

GitLab 不仅仅是 GitHub 的替代品；它更像一个完整的 DevOps 平台。GitLab 几乎是软件开发公司所需的所有基础设施，因为它提供了代码和项目管理工具，问题报告，持续交付和监视。您可以在 [GitLab.com][6] 上使用 GitLab，不管有没有付费支持都可以下载代码库并在本地运行它。GitLab 有一个 Web 界面，但是所有特定的 Git 命令都能按照预期（正常）工作。

GitLab 致力于开源,不仅是在代码及其背后的组织乃至 Git 本身。该组织发布了许多业务文档，包括 [员工的入职方式][7]，[营销策略][8]以及更多。作为一个站点，GitLab 热衷于推广 Git。当您使用站点的特定功能（例如合并请求）时，如果您更喜欢在终端中工作，GitLab 的界面将解释如何使用纯 Git 解析请求。

### 2\. Gitolite

[Gitolite][9] 很可能是为服务器管理员提供 Git 知识库管理前端所需的最少量代码。与 GitHub 不同，它没有 Web 界面，没有桌面客户端，并且从用户的角度来看，没有为 Git 添加任何内容。实际上，用户并没有真正直接使用 Gitolite。无论是在终端中使用 Git 还是在 [Git Cola][10] 之类的前端客户端中使用 Git，他们都仅仅是在使用 Git。

但是，从服务器管理员的角度来看，如果您运行简单的 Git 服务器，Gitolite 可以解决您必须手动管理的所有权限和访问问题。使用 Gitolite，您只能在服务器上创建一个用户（例如，一个名为 `git` 的用户）。允许用户使用此单一登录身份来访问您的 Git 服务器，但是当他们登录时，必须通过 Gitolite 处理您的 Git 服务器。 Gitolite 可以验证用户的访问权限，管理 SSH 密钥，在访问特定存储库时验证其特权级别等等。无需创建和管理无数的 Unix 用户帐户，管理员要做的就是将用户（由其 SSH 公钥确认）列出到允许其访问的存储库中。Gitolite 处理所有事务。

Gitolite 对用户几乎是不可见的，这使 Git 管理对于服务器管理员几乎不可见。只要您不需要 Web 界面，对于所有相关人员，Gitolite 都是不二选择。

### 3\. Gitea 和 Gogs

![Gitea][11]

(Seth Kenlon, [CC BY-SA 4.0][5])

[Gogs 项目][12] 是 MIT 许可的 Git 服务器框架和 Web 用户界面。在 2016 年，一些 Gogs 用户感觉开发受阻，因为只有最初的开发人员才能对其开发存储库进行写访问，因此他们将代码分叉给 [Gitea][13]。如今，两个项目彼此独立地共存，并且从用户的角度来看，它们基本上是相同的体验。具有讽刺意味的是，两个项目都托管在 GitHub 上。

使用 Gitea 和 Gogs，您可以下载源代码并将其作为服务在您的服务器上运行。为用户提供了一个网站，用户可以在其中创建帐户，登录，创建自己的存储库，上传代码，浏览代码，文件议题和故障报告，请求代码合并，管理 SSH 密钥等等。该界面在外观上觉得与 GitLab，GitHub 或 Bitbucket 相似，因此，如果用户对在线代码管理系统有些经验，那么利用 Gitea 和 Gogs 与他们在本质上相似。

Gitea 或 Gogs 可以作为软件包安装在任何 Linux 服务器（包括 Raspberry Pi）上，也可以作为容器安装在BSD，macOS 或 Windows 上，也可以从源代码编译。它们都是跨平台的，因此它们可以在运行 Go 的任何设备上运行。阅读 Ricardo Gerardi 的有关 [使用Podman 安装 Gogs 容器][14] 文章，以获取更多信息。

### 4\. 独立社区

![Notabug][15]

(Seth Kenlon, [CC BY-SA 4.0][5])

如果您不打算进行自我托管，则可以通过在其他人的服务器上使用自我托管选项来作弊。有很多独立的站点，例如[Codeberg][16]，Nixnet，Tinfoil-hat 和 [Notabug.org][17]。有些运行 Gitea，有些运行Gogs，但结果是一样的：免费代码托管可帮助您确保工作安全和公开。这些解决方案可能不像 GitLab 或 GitHub 那样复杂，它们可能不提供按需的 Jenkins 管道和持续集成/持续开发（CI/CD）解决方案，但它们对工作来说是绝佳镜像。

也有针对特定目的的提供程序：[FSFS 支持者的 Gitea 实例][18]，[Freedesktop 项目][19] 的 Gitlab 实例和其他的 [GNOME 项目][20]。

因为这些独立的服务器是较小的社区，所以您可能还会发现社交编码在 “社交” 方面更为重要。我已经通过一家独立的 Git 提供商结交了几个在线朋友，而 GitHub 至少在社交上被证明不受欢迎。

信息很清楚：集中化的，占主导地位的，非免费的 Git 软件托管服务没有需求或优势。

### 5\. Git

Git 作为服务器是完全自力更生的，这可能会让您感到惊讶。尽管它缺少用户管理和权限设置，但 Git 与 SSH 集成，并附带一个特殊的 `git-shell` 应用程序，该应用程序专门设计为用作受限环境使用的 Git 命令。通过将用户的默认 shell 设置为 `git-shell`，可以限制他们与服务器交互时可进行哪些操作。

Git 不能提供存储库权限的工具帮助您管理每个用户有权访问的内容。为此，您将不得不依靠操作系统的用户和访问控制列表（ACL）控件回退，如果您只有少数几个用户，这些控件可能会变得乏味。对于小型项目或刚刚开始的项目，在 Linux 服务器上运行 Git 是满足协作空间需求的便捷解决方案。有关更多信息，请阅读我关于 [构建 Git 服务器][21]的文章。

### 额外的：Fossil

![Fossil UI][22]

(Klaatu, [CC BY-SA 4.0][5])

Fossil 绝不是 Git，从某种意义上讲，这是因为是 GitHub 的替代品而具有的吸引力。实际上，Fossil 是整个 Git 系统的替代品。它是一个完整的版本控制系统，例如 Git，并且在您 _创建的每个存储库中都内置_ 了错误跟踪，Wiki，论坛和文档功能。它还包含一个 Web 界面，并且完全是独立的。如果听起来一切都成真，那么您可以在 [fossil-scm.org][23] 上看到它的运行情况，因为 Fossil 的主页在 Fossil 上运行！

有关更多信息，请阅读 Klaatu 关于 [Fossil入门][24] 的文章。

### 开源意味着选择

关于 Git（ Fossil ）的最好的事情是它们是开源技术。您可以选择最适合您的解决方案。实际上，由于 Git 也是分布式的，因此您甚至可以选择 _多样的_ 解决方案。没有什么可以阻止您将代码托管在多个服务器上并在每次推送时将其写入所有服务。查看您的选择，确定最适合您的方法，然后开始工作！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/open-source-alternatives-github

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://opensource.com/article/19/4/write-git
[3]: https://github.com/
[4]: https://opensource.com/sites/default/files/uploads/gitlab.jpg (GitLab)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://gitlab.com
[7]: https://about.gitlab.com/handbook/people-group/general-onboarding/onboarding-processes
[8]: https://about.gitlab.com/handbook
[9]: https://gitolite.com/gitolite/index.html
[10]: https://opensource.com/article/20/3/git-cola
[11]: https://opensource.com/sites/default/files/uploads/gitea.jpg (Gitea)
[12]: https://gogs.io
[13]: https://gitea.io
[14]: https://www.redhat.com/sysadmin/git-gogs-podman
[15]: https://opensource.com/sites/default/files/uploads/notabug.jpg (Notabug)
[16]: https://join.codeberg.org/
[17]: https://notabug.org
[18]: https://git.fsfe.org/
[19]: https://gitlab.freedesktop.org
[20]: https://gitlab.gnome.org
[21]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[22]: https://opensource.com/sites/default/files/uploads/fossil-ui.jpg (Fossil UI)
[23]: https://www.fossil-scm.org
[24]: https://opensource.com/article/20/11/fossil
