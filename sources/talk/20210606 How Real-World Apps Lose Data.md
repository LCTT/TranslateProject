[#]: subject: (How Real-World Apps Lose Data)
[#]: via: (https://theartofmachinery.com/2021/06/06/how_apps_lose_data.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)
[#]: collector: (lujun9972)
[#]: translator: (PearFL)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

真实世界的应用程序是如何丢失数据？
======

现代应用程序开发的一大优点是，云提供商会担心硬件故障或如何设置RAID等问题。优秀的云提供商不太可能丢失你的应用数据, 所以有时我会被询问现在的备份究竟是什么呢？ 下面是一些现实世界的故事。

### 故事 #1

第一个故事来自一个数据科学项目:它基本上是一个从正在进行的研究中来收集数据的庞大而复杂的管道，然后用各种不同的方式处理以满足一些尖端模型的需要。这个面向用户的应用程序还没有启动，但是一个由数据科学家和开发人员组成的团队已经为建立这个模型和它的数据集工作了好几个月。

在项目中工作的人有他们自己的实验工作的开发环境。他们会在终端中做一些类似' export ENVIRONMENT=simonsdev '的事情，然后所有在终端上运行的软件都会在那个环境下运行，而不是在生产环境下。

该团队承受着巨大的压力，需要推出面向用户的应用程序，以便利益相关者能够从他们几个月的投资中真正看到一些成果。一个星期六，一位工程师试图赶完一些工作。他在晚上很晚的时候做完了一个实验，决定收拾东西回家。他启动了一个清理脚本来删除他的开发环境中的所有内容，但奇怪的是，这比平时花费了更长的时间。那时他意识到他已经忘记了哪个终端被配置为指向哪个环境。

### 故事 #2

第二个故事来自于一个商业网页和手机应用。后端有一个由一组工程师负责的微服务体系结构。这意味着部署需要协调，但是使用正式的发布过程和自动化简化了一些。当准备好时，新代码将被审查并合并到主代码中，并且高级开发人员常常会为每个微服务标记一个发布版本，然后这些微服务将自动部署到登台环境中。The releases in the staging environment would periodically get collected together into a meta-release that got signoff from various people (it was a compliance environment) before being automatically deployed to production.临时环境中的版本会定期收集到一个元版本中，在自动部署到生产之前，该版本会得到不同人的认可（这是一个合规环境）。

One day a developer was working on a complex feature, and the other developers working on that microservice agreed that the work-in-progress code should be committed to master with the understanding that it shouldn’t be actually released yet.有一天，一位开发人员正在开发一个复杂的功能，而其他开发该微服务的开发人员一致认为，应该致力于掌握正在进行的代码，并理解它不应实际发布。长话短说，并不是团队中的每个人都收到了消息，而是代码进入了发布管道。更糟糕的是，实验代码需要一种新的方式来表示用户配置文件数据，因此它有一个临时数据迁移，在启动到生产时运行并损坏所有用户配置文件。

### 故事 #3

第三个故事来自另一款网络应用。 This one had a much simpler architecture: most of the code was in one app, and the data was in a database. However, this app had also been written under a lot of deadline pressure. It turned out that early on in development, when radical database schema changes were common, a feature was added to detect such changes and clean up old data. This was actually useful for early development before launch, and was always meant to be a temporary feature for development environments only. Unfortunately, the code was forgotten about in the rush to build the rest of the app and get to launch. Until, of course, one day it got triggered in the production environment.

### 事后分析

With any outage postmortem, it’s easy to lose sight of the big picture and end up blaming everything on some little detail.在任何停机事后分析中，很容易忽视大局，最终将一切归咎于一些小细节。 A special case of that is finding some mistake someone made and then blaming that person. All of the engineers in these stories were actually good engineers (companies that hire SRE consultants aren’t the ones to cut corners with their permanent hires), so firing them and replacing them wouldn’t have solved any problem. Even if you have 100x developers, that 100x is still finite, so mistakes will happen with enough complexity and pressure. The big-picture solution is back ups, which help you however you lose the data (including from malware, which is a hot topic in the news lately). If you’re not okay with having zero copies of it, don’t have one copy.

故事1的结局很糟糕: there were no backups. The project was set back by nearly six months of data collection. By the way, some places only keep a single daily snapshot as a backup, and this story is a good example of how that can go wrong, too: if the data loss happened on Saturday and recovery was attempted on Monday, the one-day backup would only have an empty database from the Sunday.

故事2并不有趣, but worked out much better. Backups were available, but the data migration was reversible, too. The unfun part was that the release was done just before lunch and the fix had to be coded up while the production site was down. The main reason I’m telling this story is as a reminder that backups aren’t just about catastrophic data loss. Partial data corruption happens, too, and can be extra messy.

故事3仅仅只是一般。尽管少量数据永久丢失，但大部分数据可以从备份中恢复。团队中的每个人都对现在没有注释的极其危险的代码感到非常糟糕。我没有参与早期的开发，但我感觉很糟糕，因为恢复数据所需的时间比正常情况要长得多。通过经过良好测试的恢复过程，我认为该站点应该在总共不到 15 分钟的时间内重新上线。但是第一次恢复没有成功，我不得不调试为什么不能成功，然后重试。当一个生产站点宕机了，需要你重新启动它，每10秒就会感觉很漫长。 值得庆幸的是，涉众比某些人理解得多。他们实际上松了一口气，因为一次数分钟的数据丢失和不到一小时的停机时间本就可以使公司陷入瘫痪的灾难。

在实践中，进行了备份“工作”但恢复失败是非常常见的。很多时候，小型数据集上进行恢复测试是可以正常工作的，但在生产规模的大数据集上就会失败。当每个人都压力过大时，灾难最有可能发生，而关闭生产站点只会增加压力。在时间合适的时候测试和记录完整的恢复过程是一个非常好的主意。
--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2021/06/06/how_apps_lose_data.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[PearFL](https://github.com/PearFL)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
