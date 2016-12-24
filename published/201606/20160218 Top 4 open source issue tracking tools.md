4 个顶级的开源问题跟踪管理工具
========================================

生活充满了bug。

无论怎样小心计划，无论花多少时间去设计，在执行阶段实际执行时，任何工程都会有未知的问题。也无妨。也许对于任何一个组织的最佳弹性衡量不是他们如何一切都按计划运行地处理事情，而是，当出现磕磕碰碰时他们如何驾驭。

对任何一个项目管理流程来说，特别是在软件开发领域，都需要一个关键工具——问题跟踪管理系统。其基本功能很简单：可以对bug进行查看、追踪，并以协作的方式解决bug，有了它，我们更容易跟随整个过程的进展。除了基本功能，还有很多专注于满足特定需求的选项及功能，使用场景不仅限于软件开发。你可能已经熟悉某些托管版本的工具，像 [GitHub Issues](https://guides.github.com/features/issues/)或者[Launchpad](https://launchpad.net/)，其中一些工具已经有了自己的开源社区。

接下来，这四个bug问题跟踪管理软件的极佳备选，全部开源、易于下载，自己就可以部署。先说好，我们可能没有办法在这里列出每一个问题跟踪工具；相反，我们列出这四个，原因基于是其丰富的功能和项目背后的社区规模。当然，肯定还有其他类似软件，如果你喜欢的没有列在这里，如果你有一个好的理由，一定要让我们知道，在下面的评论中使它脱颖而出吧。

## Redmine

[Redmine](http://www.redmine.org/) 是一个很流行的追踪管理工具，基于Ruby on Rails构建，可以追溯到2006年。很多方面类似于Trac（另一个我们的最爱），Redmine可以管理多个项目，整合了多种版本控制系统。除了基本问题追踪，Redmine也提供论坛，wiki，时间跟踪工具，同时，它还具有生成甘特图表（Gantt charts）和日历的能力，用来跟踪项目的进展。

Redmine的设置相当灵活，支持多种数据库后端和几十种语言，还是可定制的，可以向问题（issue）、用户、工程等添加自定义字段。通过社区创建的插件和主题它可以进一步定制。

如果你想试一试，一个[在线演示](http://demo.redmine.org/)可提供使用。Redmine采用[GPL版本2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)许可证；开源代码可以在工程的[svn仓库](https://svn.redmine.org/redmine)或在[GitHub](https://github.com/redmine/redmine)镜像上找到。

![](https://opensource.com/sites/default/files/images/business-uploads/issues-redmine.png)

## Bugzilla

[Bugzilla](https://www.bugzilla.org/)是另一个流行的具备问题跟踪能力的开发工具。从名字您可能已经猜到了，Bugzilla最初是[Mozilla基金会](https://www.mozilla.org/en-US/)创建的，用来跟踪当时称为网景通信套件中的bug。为了更好的可读性，它从原来的Tcl移植到Perl，Bugzilla是一个比较老，但却广泛采用的问题跟踪系统，它被用在许多著名的开源项目如GNOME、KDE，以及Linux内核本身。

从通知到重复bug检测再到搜索共享，Bugzilla拥有许多高级工具，是一个功能更丰富的选项。Bugzilla拥有一套高级搜索系统以及全面的报表工具，具有生成图表和自动化按计划生成报告的能力。像Redmine一样，Bugzilla是可扩展和可定制的，除了字段本身，还能针对bug创建自定义工作流。它也支持多种后端数据库，和自带的多语言支持。

Bugzilla采用[Mozilla公共许可证](https://en.wikipedia.org/wiki/Mozilla_Public_License)，你可以读取他们的[未来路线图](https://www.bugzilla.org/status/roadmap.html)还有在官网尝试一个[示例服务](https://landfill.bugzilla.org/)

![](https://opensource.com/sites/default/files/images/business-uploads/issues-bugzilla.png)

## Trac

[Trac](http://trac.edgewall.org/browser)自称是基于web的极简主义软件工程管理软件，这里请不要混淆极简主义与缺乏功能。

由python编写的Trac，将其漏洞跟踪能力与它的wiki系统和版本控制系统轻度整合。项目管理能力突出，如生成里程碑和路线图，一个可定制的报表系统，大事记，支持多资源库，内置的垃圾邮件过滤，还可以使用很多通用语言。如其他我们已经看到的漏洞追踪软件，有很多插件可进一步扩展其基本特性。

Trac以[改进的BSD许可协议](http://trac.edgewall.org/wiki/TracLicense)开源，虽然更老的版本发布在GPL下。你可以在一个[自托管仓库](http://trac.edgewall.org/browser)预览Trac的源码或者查看他们的[路线图](http://trac.edgewall.org/wiki/TracRoadmap)对未来的规划。

![](https://opensource.com/sites/default/files/images/business-uploads/issues-trac.png)

## Mantis

[Mantis](https://www.mantisbt.org/)是这次合集中我们将看到的最后一个工具，基于PHP，且有16年历史。作为另一个支持多种不同版本控制系统和事件驱动通知系统的bug跟踪管理软件，Mantis有一个与其他工具类似的功能设置。虽然它不本身包含wiki，但它整合了很多流行的wiki平台且本地化到多种语言。

Mantis使用[GPL版本2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)开源许可证书；你可以在[GitHub](https://github.com/mantisbt/mantisbt)浏览他的源代码或查看自托管[路线图](https://www.mantisbt.org/bugs/roadmap_page.php?project=mantisbt&version=1.3.x)对未来的规划。一个示例，你可以查看他们的内部[漏洞跟踪](https://www.mantisbt.org/bugs/my_view_page.php)。

![](https://opensource.com/sites/default/files/images/business-uploads/issues-mantis.png)

正如我们指出的，这四个不是唯一的选项。想要探索更多？[Apache Bloodhound](https://issues.apache.org/bloodhound/)，[Fossil](http://fossil-scm.org/index.html/doc/trunk/www/index.wiki)，[The Bug Genie](http://www.thebuggenie.com/)，还有很多可替换品都有自己的忠实追随者，每个都有不同的优点和缺点。另外，一些工具在我们[项目管理](https://opensource.com/business/15/1/top-project-management-tools-2015)摘要有问题跟踪功能。所以，哪个是你首选的跟踪和碾压bug的工具？


------------------------------------------------------------------------------

via: https://opensource.com/business/16/2/top-issue-support-and-bug-tracking-tools

作者：[Jason Baker][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[Mr小眼儿](https://github.com/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
