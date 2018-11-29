6 个托管 git 仓库的地方
======
> GitHub 被收购导致一些用户去寻找这个流行的代码仓库的替代品。这里有一些你可以考虑一下。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL)

也许你是少数一些没有注意到的人之一，就在之前，[微软收购了 GitHub][1]。两家公司达成了共识。微软在近些年已经变成了开源的有力支持者，而 GitHub 从成立起，就已经成为了大量的开源项目的实际代码库。

然而，最近发生的这次收购可能会带给你一些苦恼。毕竟公司的收购让你意识到了你的开源代码放在了一个商业平台上。可能你现在还没准备好迁移到其他的平台上去，但是至少这可以给你提供一些可选项。让我们找找网上现在都有哪些可用的平台。

### 选择之一： GitHub

严格来说，这是一个合格的选项。[GitHub][2] 历史上没有什么失信的地方，而且微软后来也一直笑对开源。把你的项目继续放在 GitHub 上，保持观望没有什么不可以。它现在依然是最大的软件开发的网络社区，同时还有许多对于问题追踪、代码审查、持续集成、通用的代码管理等很有用的工具。而且它还是基于 Git 的，这是每个人都喜欢的开源版本控制系统。你的代码还是你的代码。如果没有出现什么问题，那保持原状是没错的。

### 选择之二： GitLab

[GitLab][3] 是考虑替代代码库平台时的主要竞争者。它是完全开源的。你可以像在 GitHub 一样把你的代码托管在 GitLab，但你也可以选择在你自己的服务器上自行托管自己的 GitLab 实例，并完全控制谁可以访问那里的所有内容以及如何访问和管理。GitLab 与 GitHub 功能几乎相同，有些人甚至可能会说它的持续集成和测试工具更优越。尽管 GitLab 上的开发者社区肯定比 GitHub 上的开发者社区要小，但这并没有什么。你可能会在那里的人群中找到更多志同道合的开发者。

### 选择之三： Bitbucket

[Bitbucket][4] 已经存在很多年了。在某些方面，它可以作为 GitHub 未来的一面镜子。Bitbucket 八年前被一家大公司（Atlassian）收购，并且已经经历了一些变化。它仍然是一个像 GitHub 这样的商业平台，但它远不是一个创业公司，而且从组织上说它的基础相当稳定。Bitbucket 具有 GitHub 和 GitLab 上的大部分功能，以及它自己的一些新功能，如对 [Mercurial][5] 仓库的原生支持。

### 选择之四： SourceForge

[SourceForge][6] 是开源代码库的鼻祖。如果你曾经有一个开源项目，Sourceforge 就是那个托管你的代码并向其他人分享你的发布版本的地方。它迁移到 Git 版本控制用了一段时间，它有一些商业收购和再次收购的历史，以及一些对某些开源项目糟糕的捆绑决策。也就是说，SourceForge 从那时起似乎已经恢复，该网站仍然是一个有着不少开源项目的地方。然而，很多人仍然感到有点受伤，而且有些人并不是很支持它的平台货币化的各种尝试，所以一定要睁大眼睛。

### 选择之五： 自己管理

如果你想自己掌握自己项目的命运（除了你自己没人可以指责你），那么一切都由自己来做可能对你来说是最佳的选择。无论对于大项目还是小项目，都是好的选择。Git 是开源的，所以自己托管也很容易。如果你想要问题追踪和代码审查功能，你可以运行一个 GitLab 或者 [Phabricator][7] 的实例。对于持续集成，你可以设置自己的 [Jenkins][8] 自动化服务实例。是的，你需要对自己的基础架构开销和相关的安全要求负责。但是，这个设置过程并不是很困难。所以如果你不想自己的代码被其他人的平台所吞没，这就是一种很好的方法。 

### 选择之六：以上全部

以下是所有这些的美妙之处：尽管这些平台上有一些专有的选项，但它们仍然建立在坚实的开源技术之上。而且不仅仅是开源，而是明确设计为分布在大型网络（如互联网）上的多个节点上。你不需要只使用一个。你可以使用一对……或者全部。使用 GitLab 将你自己的设施作为保证的基础，并在 GitHub 和 Bitbucket 上安装克隆存储库，以进行问题跟踪和持续集成。将你的主代码库保留在 GitHub 上，但是出于你自己的考虑，可以在 GitLab 上安装“备份”克隆。

关键在于你可以选择。我们能有这么多选择，都是得益于那些非常有用而强大的项目之上的开源许可证。未来一片光明。 

当然，在这个列表中我肯定忽略了一些开源平台。方便的话请补充给我们。你是否使用了多个平台？哪个是你最喜欢的？你都可以在这里说出来！


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/github-alternatives

作者：[Jason van Gumster][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mairin
[1]: https://www.theverge.com/2018/6/4/17422788/microsoft-github-acquisition-official-deal
[2]: https://github.com/
[3]: https://gitlab.com
[4]: https://bitbucket.org
[5]: https://www.mercurial-scm.org/wiki/Repository
[6]: https://sourceforge.net
[7]: https://phacility.com/phabricator/
[8]: https://jenkins.io
