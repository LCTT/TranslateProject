[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How key Python projects are maintained)
[#]: via: (https://opensource.com/article/20/2/python-maintained)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How key Python projects are maintained
如何维护关键的 Python 项目
======
开源 Python 项目保持平稳运行的社区幕后。
![旧款电脑和新款电脑，代表迁移到新的软件或硬件][1]

Jannis Leidel 是 [Jazzband][2] 社区的一部分。Jazzband 是一个基于 [Python][3] 项目维护责任的共享协作社区。

Jazzband 的诞生源于长期独自维护一个开源项目的压力。Jannis 是巡回乐队管理员，这意味着他负责管理任务并确保乐队中的人可以在他们想要的时候演奏。

Jazzband 并不是他的第一个开源志愿者工作——他是前 [Django][4] 核心开发人员，[Django 软件基金会][5] 董事会成员，编写了许多 Django 应用程序和 Python 项目，一直是 [pip][6] 和 [virtualenv][7] 核心开发人员和发布经理，共同创立了 [Python 软件包授权][8]，并担任 [PyPI][9] 管理员。在社区方面，他共同创立了德国 Django 协会，担任 [DjangoCon Europe][10] 2010 联合主席，在多个会议上发言，并在去年担任了[Python 软件基金会][11]主管和联席主席

### Moshe Zadka: 你是如何开始编程的？

Jannis Leidel：我在高中时作为常规德语计算机科学课程的一部分开始学习编程，在那里我涉猎了 Turbo Pascal 和 Prolog。我很快就进入了 Web 开发的世界，并使用 PHP3、[Perl5][12] 和 [MySQL][13] 编写了小型网站。后来在大学里，我在从事媒体艺术项目时再次学习编程，发现 [Ruby][14]、Perl 和 Python 特别有用。我最终坚持使用 Python，因为它的多功能性和易用性。从那时起，我很高兴能够在我的职业生涯中使用 Python 和开放网络技术（HTML/JS/CSS）。

### Zadka: 您是如何开始开源的？

Leidel：作为大学艺术项目的一部分，我需要一种与各种 Web 服务对话并与一些电子设备交互的方法，但发现我之前的 PHP 技能无法胜任这项任务。因此，我参加了有关使用 Python 编程的课程，并对学习更多有关框架如何工作产生兴趣——与库相比——因为它们进一步体现了我想了解的最佳实践。特别是，新生的 Django Web 框架对我很有吸引力，因为它支持务实的方法，并为如何开发 Web 应用程序提供了大量指导。 2007 年，我作为学生参与了 Google Summer of Code for Django，后来为 Django 及其可重用组件生态系统做出了更多贡献——不久我也成为 Django 核心开发人员。在完成学位期间，我能够利用这些技能成为一名自由职业者，并花时间在 Django 社区的许多不同部分工作。在那时，横向移动到更广泛的 Python 社区不过是很自然的。

### Zadka: 你的日常工作是什么？

Leidel：我是 Mozilla 的一名高级软件工程师，致力于为 Firefox 数据管道开发数据工具。实际上，这意味着我在更广泛的 Firefox 工程团队中从事各种内部和面向公众的基于 Web 的项目，这些项目帮助 Mozilla 员工和社区成员理解 Firefox Web 浏览器发送的遥测数据。我目前的部分重点是维护我们的数据分析和可视化平台，该平台基于开源项目 [Redash][15]，并对其做出贡献。我参与的其他项目是我们的下一代遥测系统 [Glean][16] 和一个允许您在浏览器（包括 Scientific Python 堆栈）中进行数据科学的工具 [Iodide][17]。

### Zadka: 您是如何参与 Jazzband 的？

Leidel：早在 2015 年，我就对单独维护很多人所依赖的项目感到沮丧，并看到我的许多社区同行都在为类似的问题苦苦挣扎。我不知道有什么好方法可以接触到社区中更多可能对长期维护感兴趣的人。在某些情况下，我觉得新的“社会编码”范例很少是社会性的，而且常常是孤立的，有时甚至对新老贡献者来说都是创伤。我相信我们社区中我现在无法容忍的不平等在当时更加猖獗，这使得为贡献者提供一个安全的环境变得困难——我们现在知道这对于稳定的项目维护至关重要。我想知道我们是否缺少一种更具协作性和包容性的软件开发方法。

Jazzband 项目的启动是为了降低进入维护的门槛，并简化其中一些较无聊的方面（例如，围绕 [CI][18] 的最佳实践）。 

### Zadka: 您最喜欢 Jazzband 的什么？

Leidel：我最喜欢 Jazzband 的一点是，我们确保了许多人所依赖的许多项目的维护，同时还确保任何经验水平的新贡献者都可以加入。

### Zadka: Jazzband 的“巡回乐队管理员”的工作是什么？

Leidel：当谈到 Jazzband 幕后的所有事情时，“roadie”是一个寻求协助的人。这意味着，例如，处理新项目的入职、维护处理用户管理和项目发布的 Jazzband 网站、充当安全或行为准则事件的第一响应者等等。“roadies”这个词是从音乐和活动行业借来的，指的是支持人员，他们负责在巡回演出中几乎所有需要做的事情，除了实际的艺术表演。在 Jazzband，他们在那里确保成员可以在项目上工作。这也意味着某些任务是部分或完全自动化的，这是有意义的，并且最佳实践应用于大多数 Jazzband 项目，如打包设置、文档托管或持续集成。 

### Zadka: 作为 Jazzband 的巡回乐队管理员，您工作中最具挑战性的方面是什么？

Leidel：目前，我作为"巡回乐队管理员"的工作中最具挑战性的方面是实施社区成员提出的 Jazzband 改进，而不会冒他们所依赖的工作流程的风险。换句话说，Jazzband 越大，在概念级别上扩展项目变得越困难。具有讽刺意味的是，我是目前唯一的"巡回乐队管理员"，独自处理一些任务，而 Jazzband 试图阻止其项目发生这种情况。这是 Jazzband 未来的一大担忧。

### Zadka: 对于有兴趣想知道能否加入 Jazzband 的人，您有什么想说的？

Leidel：如果您有兴趣加入一群相信协作工作比单独工作更好的人，或者如果您一直在为自己的维护负担而苦苦挣扎并且不知道如何继续，请考虑加入 Jazzband。它简化了新贡献者的入职流程，提供了一个争议框架，并自动发布到 [PyPI][19]。有许多最佳实践可以很好地降低项目无法维护的风险。

### Zadka: 您还有什么想告诉我们的读者的吗？

Leidel：我鼓励每个从事开源项目的人都考虑屏幕另一边的人。要有同理心，记住你自己的经历可能不是你同龄人的经历。了解您是全球多元化社区的成员，这要求我们始终尊重我们之间的差异。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/python-maintained

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q (and old computer and a new computer, representing migration to new software or hardware)
[2]: https://jazzband.co/
[3]: https://opensource.com/resources/python
[4]: https://opensource.com/article/18/8/django-framework
[5]: https://www.djangoproject.com/foundation/
[6]: https://opensource.com/article/19/11/python-pip-cheat-sheet
[7]: https://virtualenv.pypa.io/en/latest/
[8]: https://www.pypa.io/en/latest/
[9]: https://pypi.org/
[10]: https://djangocon.eu/
[11]: https://www.python.org/psf/
[12]: http://opensource.com/article/18/1/why-i-love-perl-5
[13]: https://opensource.com/life/16/10/all-things-open-interview-dave-stokes
[14]: http://opensource.com/business/16/4/save-development-time-and-effort-ruby
[15]: https://redash.io/
[16]: https://firefox-source-docs.mozilla.org/toolkit/components/telemetry/start/report-gecko-telemetry-in-glean.html
[17]: https://alpha.iodide.io/
[18]: https://opensource.com/article/19/12/cicd-resources
[19]: https://opensource.com/downloads/7-essential-pypi-libraries
