病毒过后，系统管理员投向了 Linux
=======================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/OPENHERE_blue.png?itok=3eqp-7gT)

我开源事业的第一笔，是我在 2001 年作为一名兼职系统管理员，为大学工作的时候。成为了那个以教学为目的，不仅仅在大学中，还在学术界的其他领域建立商业案例研究的小组的一份子。

随着团队的发展，渐渐地开始需要一个由文件服务、intranet 应用，域登录等功能构建而成的健壮的局域网。 我们的 IT 基础设施主要由跑着 Windows 98 的计算机组成，这些计算机对于大学的 IT 实验室来说已经太老了，就重新分配给了我们部门。

### 初探 Linux

一天，作为大学IT采购计划的一部分，我们部门收到了一台 IBM 服务器。 我们计划将其用作 Internet 网关，域控制站，文件服务器和备份服务器，以及 intranet 应用程序主机。

拆封后，我们注意到它附带了红帽 Linux 的 CD。 我们的 22 人团队（包括我）对 Linux 一无所知。 经过几天的研究，我找到了一位朋友的朋友，一位以 Linux RTOS （Linux 的实时操作系统领域）编程为生的人，求助他如何安装。

光看着那朋友用 CD 驱动器载入第一张安装 CD 并进入 Anaconda 安装系统，我的头都晕了。 大约一个小时，我们完成了基本的安装，但仍然没有可用的 internet 连接。

又花了一个小时的折腾才使我们连接到互联网，但仍没有域登录或 Internet 网关功能。 经过一个周末的折腾，我们可以让我们的 Windows 98 机器作为 Linux PC 的代理，终于构出了一个正常工作的共享互联环境。 但域登录还需要一段时间。

我们用龟速的电话调制解调器下载了 [Samba][1]，并手动配置它作为域控制站。文件服务也通过 NFS Kernel Server 开启了，随后为 Windows 98 的网络邻居创建了用户目录并进行了必要的调整和配置。

这个设置完美运行了一段时间，直到最终我们决定开始使用 Intranet 应用管理时间表和一些别的东西。 这个时候，我已经离开了该组织，并把大部分系统管理员的东西交给了接替我的人。

### 再遇 Linux

2004 年，我又重新装回了 Linux。我的妻子经营的一份独立员工安置业务，使用来自 Monster.com 等服务的数据来打通客户与求职者的交流渠道。

作为我们两人中的计算机好点的那个，在计算机和互联网出故障的时候，维修就成了我的分内之事。我们还需要用许多工具尝试，从堆积如山的简历中筛选出她每天必须看的。

Windows [BSoD][2]（蓝屏） 早已司空见惯，但只要我们的付费数据是安全的，那就还算可以容忍。为此我将不得不每周花几个小时去做备份。

一天，我们的电脑中了毒，并且通过简单的方法无法清除。我们并不了解磁盘上的数据发生了些什么。当磁盘彻底挂掉后，我们插入了一周前的辅助备份磁盘，但是一周后它也挂了。我们的第二个备份直接拒绝启动。是时候寻求专业帮助了，所以我们把电脑送到一家靠谱的维修店。两天以后，我们被告知一些恶意软件或病毒已经将某些种类的文件擦除殆尽，其中包括我们的付费数据。

这是对我妻子的商业计划的一个巨大的打击，同时意味着丢失合同并耽误了账单。我曾短期出国工作，并在台湾的 [Computex 2004][3] 购买了我的第一台笔记本电脑。 预装的是 Windows XP，但我还是想换成 Linux。 我知道 Linux 已经为桌面端做好了准备，[Mandrake Linux][4] （曼德拉草） 是一个很不错的选择。 我第一次安装就很顺利。所有工作都执行的非常漂亮。我使用 [OpenOffice][5] 来满足我写作，演示文稿和电子表格的需求。

我们为我们的计算机买了新的硬盘驱动器，并为其安装了 Mandrake Linux。用 OpenOffice 替换了 Microsoft Office。 我们依靠 Web 邮件来满足邮件需求，并在 2004 年的 11 月迎来了 [Mozilla Firefox][6]。我的妻子马上从中看到了好处，因为没有崩溃或病毒/恶意软件感染！更重要的是，我们告别了困扰 Windows 98 和 XP 的频繁崩溃问题。 她一直使用这个发行版。

而我，开始尝试其他的发行版。 我爱上了 distro-hopping （LCTT 译注：指在不同版本的 Linux 发行版之间频繁切换的 Linux 用户）和第一时间尝试新发行版的感觉。我也经常会在 Apache 和 NGINX 上尝试和测试 Web 应用程序，如 Drupal、Joomla 和 WordPress。现在我们 2006 年出生的儿子，在 Linux 下成长。 也对 Tux Paint，Gcompris 和 SMPlayer 非常满意。

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/3/my-linux-story-soumya-sarkar

作者：[Soumya Sarkar][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

[a]: https://opensource.com/users/ssarkarhyd
[1]: https://www.samba.org/
[2]: https://en.wikipedia.org/wiki/Blue_Screen_of_Death
[3]: https://en.wikipedia.org/wiki/Computex_Taipei
[4]: https://en.wikipedia.org/wiki/Mandriva_Linux
[5]: http://www.openoffice.org/
[6]: https://www.mozilla.org/en-US/firefox/new/
