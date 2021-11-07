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

对于没有听说过个项目的人，让我来讲点关于它的一点记忆。回到2005年，Kris Moore引入了[PC-BSD][2]作为一个建立FreeBSD桌面的简单方法。第二年，它被接受为[iXsystems][3]. 2016年9月，这个项目改名为TrueOS。这个项目也变成FreeBSD现有分支的滚动发行版。两年后，TrueOS[宣布][4]他们将专注商业和服务器市场，建立自己的操作系统。桌面元素[剥离][5]到一个新项目：Trident。

一段时间以来，Trident开发团队竭力在FreeBSD之上建立一个良好的桌面体验。可是，由于[FreeBSD的问题][6]，包括“硬件兼容性，通信标准，或软件包的可得性一直限制Trident项目的用户”，他们决定在其他底层上继续。他们的解决方案是在2019年，基于[Void Linux][7]重新构建了项目。 那段时间，看起来Trident项目的未来已经确定了。然后2020发生了。

![Trident项目桌面][8]

### 项目的终止

10月29号，Trident项目团队发布了如下[声明][9]：

> 我们无比遗憾地宣布Trident项目将从2021年11月1号起进入“夕阳”阶段，2022年3月将关掉商店。项目核心共同做出了这个决定。由于过去两年中生活、工件和家庭等的事情和变故；我们每个人的优先级也发生了改变。
>
> 我们将保持Trident项目的包和网站运行，直到2022年3月1日的终止服务期，但是我们强烈推荐用户在即将到来的新年假期中开始寻找其他桌面系统替代。
>
> 感谢你们所有的支持和鼓励！过去几年中，项目得以良好运转，我们也尽情享受这个过程。

### Lumina项目继续

一般认为PC-BSD/TrueOS/Trident项目的传奇故事是一个在用的桌面环境。2012年, [Ken Moore][10] (Kris’的弟弟)开始为一个基于Qt的桌面环境[Lumina][11]工作。2014年，它成为了PC-BSD的默认桌面环境，并一直将这种状态保持到Trident项目。Lumina代表不同于其他桌面环境，因为它被设计成操作系统不可知论的。其他桌面系统像KDE和GNOME有Linux特定代码，难以移植到BSD。

![Lumina桌面环境][8]

June of this year, Ken [handed the reigns of Lumina][12] to a fellow Project Trident developer [JT Pennington][13] (also of [BSDNow][14] fame).

The [announcement][12] states:

> After more than 7 years of work, I have decided that it is time to let others take over the development of the Lumina Desktop project going forward. It has been an incredible task which has pushed me into areas of development that I had never previously considered. However, with work and life changes, my time for developing new functionality for Lumina has become nearly non-existent, particularly for the Qt5 -&gt; Qt6 change that will be coming within the next year or so. By passing the torch over to JT (q5sys on GitHub), I am hoping that the project might receive more timely updates, for the benefit of everyone.
>
> Thank you all, and I hope for the continued success of the Lumina Desktop project!!

### Final Thoughts

I always had high hopes for Project Trident. They were small compared to many of the distros that we cover. They weren’t just a reskin of Arch or Ubuntu with one or two new tools. Not only that, but they were working to improve a distro (Void) that shared their ideals. However, life happens, even to the best of us. I wish Ken, JT and the others well as they sunset a project that they have spent many hours working on. Hopefully, we’ll be seeing more from them in the future.

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
