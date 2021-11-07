[#]: subject: "After Moving From FreeBSD to Void Linux, Project Trident Finally Discontinues"
[#]: via: "https://news.itsfoss.com/project-trident-discontinues/"
[#]: author: "John Paul https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: "zd200572"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

从FreeBSD迁移到Void Linux后，Trident项目最终停止了
======

令人遗憾,[Trident项目][1]团队宣布他们将结束他们的Linux发行版的开发。

### 故事时间!!!

对于没有听说过个项目的人，让我来讲点关于它的一点记忆。早在2005年，Kris Moore推出了[PC-BSD][2]，作为一个建立FreeBSD桌面的简单方法。第二年，[iXsystems][3]收购了它. 2016年9月，这个项目改名为TrueOS。这个项目也变成FreeBSD现有分支的滚动版本。两年后，TrueOS[宣布][4]他们将专注商业和服务器市场，取消其操作系统的桌面版本。桌面元件[剥离][5]到一个新项目：Trident。

有一段时间，Trident开发团队尽力在FreeBSD之上打造一个良好的桌面体验。可是，由于[FreeBSD的问题][6]，包括“硬件兼容性，通信标准，或包可用性一直限制Trident项目的用户”，他们决定将其建立在其他基础之上。他们的解决方案是在2019年，基于[Void Linux][7]重新构建项目。 那时，看起来Trident项目的未来已经确定了。然后2020年来了。

![Trident项目桌面][8]

### 项目的终止

10月29号，Trident项目团队发布了如下[声明][9]：

> 我们无比遗憾地宣布Trident项目将从2021年11月1号起进入“夕阳”阶段，并将于2022年3月关掉商店。项目核心团队共同做出了这个决定。由于过去两年中生活、工件和家庭等的事情和变故；我们个人的优先事项也发生了改变。
>
> 我们将保持Trident项目包存储库和网站的运行，直到2022年3月1日的终止服务期，但是我们强烈推荐用户在即将到来的新年假期中开始寻找其他桌面系统替代。
>
> 感谢大家的支持和鼓励！过去几年中，项目得以良好运转，我们也非常高兴这些年来结识了你们中的许多人。

### Lumina项目继续

一般认为PC-BSD/TrueOS/Trident项目的传奇故事是一个在用的桌面环境。2012年, [Ken Moore][10] (Kris的弟弟)开始开发一个基于Qt的桌面环境[Lumina][11]。2014年，它成为PC-BSD的默认桌面环境，并一直保持到Trident项目。Lumina不同于其他桌面环境，因为它的设计与操作系统无关。其他桌面系统像KDE和GNOME具有Linux特定代码，难以移植到BSD。

![Lumina桌面环境][8]

今年6月，Ken把[Lumina的领导权][12]交给了Trident期日开发者[JT Pennington][13] (又名[BSDNow][14]).

[声明][12]指出:

> 经过长达7年的工作，我决定是时候让其他人接手Lumina桌面项目的开发了。这是个难以置信的任务，推动我进入之前从未考虑过的发展领域。可是，由于工作和生活的变化，我为Lumina开发新功能的时间基本没有了，特别是即将在明年或者晚些时候到来的Qt5->Qt6升级。通过把火炬传递给JT (GitHub昵称q5sys)，我希望这个项目能获得更及时的更新，利好每个人。
>
> 感谢大家，我希望Lumina桌面项目继续成功!!

### 最后的想法

我一直对Trident项目抱有很高的期望。与我们介绍的许多发行版相比，它很小巧。他们不只是有一两个新工具的Arch或Ubuntu的翻版。不只如此，他们还努力改进一个与他们理念相同的发行版。可是，生活的变故会发生，即使是我们中最好的人。我祝愿Ken，JT和其他人，以及他们花费了很多时间的项目。希望，我们未来能从他们身上看到更多。

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/project-trident-discontinues/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/zd200572)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://project-trident.org/
[2]: https://en.wikipedia.org/wiki/TrueOS
[3]: http://ixsystems.com/
[4]: https://itsfoss.com/trueos-plan-change/
[5]: https://itsfoss.com/project-trident-interview/
[6]: https://project-trident.org/post/os_migration/
[7]: https://voidlinux.org/
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://project-trident.org/post/2021-10-29_sunset/
[10]: https://github.com/beanpole135
[11]: https://lumina-desktop.org/
[12]: https://lumina-desktop.org/post/2021-06-23/
[13]: https://github.com/q5sys
[14]: https://www.bsdnow.tv/
