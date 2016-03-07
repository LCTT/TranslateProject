排名前4的开源漏洞追踪工具
========================================

生活充满了漏洞。

无论怎样小心计划，无论花多少时间去设计，在执行阶段当轮胎压在路上，任何工程都会有未知的问题。也无妨。也许对于任何一个组织的最佳弹性衡量不是他们如何一切都按计划运行地处理事情，而是，当出现磕磕碰碰时他们处理速度。

一个任意工程管理流程的关键工具，特别是在软件开发领域，是一个问题追踪系统。基础很简单；允许漏洞在合作的方式被打开，追踪，和解决，同时很容易跟随进展。除了基本功能，还有很多专注于满足特定需求的选择，和使用案例，包括软件开发和更多。你可能熟悉托管版本的这些工具，像 [GitHub Issues](https://guides.github.com/features/issues/)或者[Launchpad](https://launchpad.net/)，这些是他们自己开放的资源。

让我们看一看四个管理漏洞和问题的优秀选择，全部开源代码、易于下载和自我托管。要清楚，我们可能没有办法在这里列出每一个问题跟踪工具；然而，这有四个我们偏爱的，基于功能丰富和项目背后的社区项目的规模。还有其他，可以肯定的是，如果你有一个好的理由你喜欢的没有列在这里,一定要让我们知道这是你最喜欢的工具,在下面的评论中使它脱颖而出。

## Redmine

[Redmine](http://www.redmine.org/) 是一个流行的漏洞追踪工具建立在Ruby on Rails和可以追溯到2006年。很多类似于Trac，另一方面我们最爱的是，Redmine可以管理多个项目然后整合了多种版本控制系统。除了基本问题追踪，Redmine也提供论坛，wiki，时间跟踪工具，和生成甘特图和日历的能力来跟踪项目的进展。

Redmine的设置相当灵活，支持多种数据库后端和几十种语言，还是可定制的，可以添加自定义字段到问题，用户，工程和更多。通过社区创建的插件和主题它可以进一步定制。

如果你想试一试，一个[在线演示](http://demo.redmine.org/)可提供使用。Redmine在开源[GPL版本2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)下许可；开源代码可以在工程的[svn仓库](https://svn.redmine.org/redmine)或在[GitHub](https://github.com/redmine/redmine)镜像上找到。

![](https://opensource.com/sites/default/files/images/business-uploads/issues-redmine.png)

## Bugzilla

[Bugzilla](https://www.bugzilla.org/)是另一个流行的有漏洞追踪功能的开发工具。从名字您可能已经猜到了，Bugzilla最初是[Mozilla基金会](https://www.mozilla.org/en-US/)创建，用来跟踪当时称为网景通信套件开发漏洞的。为了更好的通过性从原来的Tcl移植到Perl路径，Bugzilla是一个比较老的和更广泛采用的问题跟踪系统，因为它用在许多著名的开源项目如GNOME，KDE，Linux内核本身。

拥有一些先进的工具，从通知到共享搜索重复的漏洞检测，Bugzilla是一个功能更丰富的选项。Bugzilla有高级搜索系统与全面的报表工具，生成图表和自动化计划报告的能力。像Redmine，Bugzilla是可扩展和可定制的，两者在字段本身像能创建自定义漏洞工作流一样。它也支持多种后端数据库，和自带的多语言支持。

Bugzilla在[Mozilla公共许可证](https://en.wikipedia.org/wiki/Mozilla_Public_License)下许可，你可以读取他们[未来路线图](https://www.bugzilla.org/status/roadmap.html)还有在官网尝试一个[示例服务](https://landfill.bugzilla.org/)

![](https://opensource.com/sites/default/files/images/business-uploads/issues-bugzilla.png)

## Trac

[Trac](http://trac.edgewall.org/browser)自称是使用简单的方法基于web的软件工程管理软件，但不要混淆极简主义与缺乏功能。

python编写，Trac紧密结合它的漏洞跟踪与它的wiki系统和你选择的版本控制系统。项目管理能力突出，如生成的里程碑和路线图，一个可定制的报表系统，大事记，支持多资源库，内置的垃圾邮件过滤，还可以使用很多一般的语言。如其他漏洞追踪软件我们已经看到，有很多插件可进一步扩展其基本特性。

Trac是在改进的[BSD许可](http://trac.edgewall.org/wiki/TracLicense)下获得开放源码许可，虽然更老的版本发布在GPL下。你可以在一个[自托管仓库](http://trac.edgewall.org/browser)预览Trac的源码或者查看他们的[路线图](http://trac.edgewall.org/wiki/TracRoadmap)对未来的规划。

![](https://opensource.com/sites/default/files/images/business-uploads/issues-trac.png)

## Mantis

[Mantis](https://www.mantisbt.org/)是这次收集中我们将看的最后一个工具，一个基于PHP且有16年历史的漏洞跟踪工具。另外漏洞跟踪支持多种不同的版本控制系统和一个事件驱动的通知系统，Mantis有一个与其他工具类似的功能设置。虽然它不本身包含一个wiki，它整合很多流行的wiki平台且本地化到多种语言。

Mantis在[GPL版本2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)下获得开源许可证书；你可以在[GitHub](https://github.com/mantisbt/mantisbt)浏览他的源代码或查看自托管[路线图](https://www.mantisbt.org/bugs/roadmap_page.php?project=mantisbt&version=1.3.x)对未来的规划。一个示例，你可以查看他们的内部[漏洞跟踪](https://www.mantisbt.org/bugs/my_view_page.php)。

![](https://opensource.com/sites/default/files/images/business-uploads/issues-mantis.png)

正如我们指出的，这四个不是唯一的选项。想要探索更多？[Apache Bloodhound](https://issues.apache.org/bloodhound/)，[Fossil](http://fossil-scm.org/index.html/doc/trunk/www/index.wiki)，[The Bug Genie](http://www.thebuggenie.com/)，还有很多可替换品都有专注的追随者，每个都有不同的优点和缺点。另外，一些工具在我们[项目管理](https://opensource.com/business/15/1/top-project-management-tools-2015)摘要有问题跟踪功能。所以，哪个是你首选的跟踪和挤压漏洞的工具？


------------------------------------------------------------------------------

via: https://opensource.com/business/16/2/top-issue-support-and-bug-tracking-tools

作者：[Jason Baker][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
