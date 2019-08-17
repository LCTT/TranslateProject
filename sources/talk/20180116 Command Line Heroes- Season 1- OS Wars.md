[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command Line Heroes: Season 1: OS Wars)
[#]: via: (https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-1)
[#]: author: (redhat https://www.redhat.com)

Command Line Heroes: Season 1: OS Wars
======
Saron Yitbarek:

有些故事如史诗般,惊险万分, 在我脑海中似乎出现了星球大战电影开头的爬行文字. 你知道的, 就像-

Voice Actor:

第一集, 操作系统大战.

Saron Yitbarek:

是的, 就像那样子.

Voice Actor:

[00:00:30]

当前形势比较紧张. Bill Gates 与 Steve Jobs 的帝国发起了一场无可避免的专有软件之战. Gates 与 IBM 结成了强大的联盟, 而 Jobs 拒绝对它的硬件和操作系统开放授权. 他们争夺统治地位的争斗在一场操作系统战争中席卷了整个银河系。与此同时, 帝王所不知道的是, 在偏远之地, 开源的反叛者们开始集聚.

Saron Yitbarek:

[00:01:00]

好吧. 这也许有点戏剧性, 但当我们谈论80年代，90年代和00年代的操作系统之争时, 这也不算言过其实. 确实曾经发生过一场史诗级的通知之战. Steve Jobs 和 Bill Gates 确实掌握着数十亿美元的命运. 掌控了操作系统, 你就掌握了绝大多数人使用计算机的方式, 我们互相通讯的方式, 我们获取信息的方式. 我可以一直罗列下去, 不过你知道我的意思. 掌握了操作系统, 你就是帝王.

[00:01:30]

我是 Saron Yitbarek, 你现在收听的是代码英雄, 一款红帽公司原创的博客节目. 你问，什么是代码英雄? 嗯, 如果你创造而不仅仅是使用, 如果你相信开发者拥有构建美好未来的能力, 如果你希望拥有一个大家都有权利表达科技如何塑造生活的世界, 那么你, 我的朋友, 就是代码英雄. 在本系列节目中, 我们将为你带来那些"白码起家(原文是from the command line up,应该是改编自from the ground up)"改变技术的程序员故事. 那么我是谁，凭什么指导你踏上这段艰苦的旅程? Saron Yitbarek是哪根葱? 嗯, 事实上我觉得我跟你差不多. 我是一名面向初学者的开发人员, 我做的任何事都依赖于开源软件. 这是我的世界. 通过在博客中讲故事,我可以跳出无聊的日常工作,看清大局. 希望它对你也一样有用.

[00:02:00]


[00:02:30]

[00:03:00]

我迫不及待地想直到，开源技术从何而来? 我的意思时, 我对 Linus Torvalds 和 Linux ® 的荣耀有一些了解, 我相信你也一样, 但是说真的, 开源并不是一开始就有的对吗? 如果我像发至内心的感激最新最棒的技术，比如 DevOps 和 containers 之类的, 我感觉我对那些早期的开发者有所亏欠，我有必要了解这些东西来自何处. 所以, 让我们暂时先不用担心内存泄露和缓冲溢出. 我们的旅程从操作系统之战开始, 这是一场波澜壮阔的桌面控制之战. 这场战争亘古未有，因为. 首先, 在计算机时代, 大公司拥有指数级的规模优势; 其次, 从未有过这么一场控制争夺战是如此变化多端. Bill Gates 和 Steve Jobs? 他们也不知道结果会如何, 但是到目前为止，这个故事进行到一半的时候, 他们所争夺的所有东西都将发声改变, 进化，最终上升到云端.

[00:03:30]

[00:04:00]

好的, 让我们回到1983年的秋季. 还有六年我才出生. 那时候的总统还是 Ronald Reagan, 美国和苏联扬言要把星球拖入核战争中. 在 Honolulu 的公民中心正在举办一年一度的苹果公司销售会议. 一群苹果公司的员工正在等待 Steve Jobs 上台. 他 28 岁，热情洋溢, 看起来非常自信. Jobs 很严肃地对着麦克风说他邀请了三个行业专家来软件进行了一次小组讨论. 然而随后发生的事情你肯定想不到. 超级俗气的80年代音乐响彻整个房间. 一堆多彩灯管照亮了舞台, 然后一个播音员的声音响起-

Voice Actor:

女士们，先生们, 现在是麦金塔软件的约会游戏.

Saron Yitbarek:

[00:04:30]

[00:05:00]

Jobs 的脸上露出一个大大的笑容，台上有三个CEO都需要轮流向他示好. 这基本上就是80年代科技界的钻石王老五. 两个软件大佬讲完话后, 然后就轮到第三个人讲话了. 仅此而已不是吗? 是得. 新面孔 Bill Gates 带着一个大大的方框眼镜遮住了半个脸. 他宣称在 1984 年, 微软的一半收入将来至于麦金塔软件. 他的这番话引来了观众热情的掌声. 但是他们不知道的是,在一个月后, Bill Gates 将会宣布发布 Windows 1.0 的计划. 你永远也猜不到 Jobs 正在跟未来苹果最大的敌人打情骂俏. 但微软和苹果即将经历科技史上最糟糕的婚礼. 他们会彼此背叛, 相互毁灭, 但又深深地、痛苦地捆绑在一起.

James Allworth:

[00:05:30]

我猜从哲学上来讲, 一个更理想化，注重用户体验高于一切, 是一个集成的组织, 而微软则更务实，更模块化-

Saron Yitbarek:

这是James Allworth。他是一位多产的科技作家，曾在苹果零售团队工作。注意他给出的苹果的定义。一个集成的组织。那种只对自己负责的公司。一个不想依赖别人的公司。这是关键。

James Allworth:

[00:06:00]

苹果是一家集成的公司,它专注于愉悦的用户体验,这意味着它希望控制整技术栈以及交付的一切内容,从硬件到操作系统,甚至运行在操作系统上的应用程序。
当新的创新,重要的创新刚刚进入市场,而你需要横跨软硬件,并且能够根据自己意愿和软件的革新来改变硬件时，这是一个优势。例如-,

[00:06:30]

Saron Yitbarek:

[00:07:00]
很多人喜欢这种整合的模式，并因此成为了苹果的铁杆粉丝。还有很多人则选择了微软。回到 Honolulu 的销售会议上。在同一场活动中，乔布斯向观众展示了他即将发布的超级碗广告。你可能已经亲眼见过这则广告了。想想 George Orwell 的1984。在这个冰冷、灰暗的世界里，在独裁者投射的目光下，没有头脑的机器人正在缓慢移动。这些机器人代表着IBM的用户们。然后，代表苹果公司的美丽而健壮的Anya Major 穿着鲜艳的衣服跑过大厅。她向着老大哥的屏幕猛地透出大锤,将它砸成一片一片的. 老大哥的咒语解除了,一个低沉的声音响起，苹果公司要开始介绍麦金塔了。

Voice Actor:

这就是为什么现实中的1984跟小说1984不一样了.

Saron Yitbarek:

[00:07:30]

是的，现在回顾这则广告，认为苹果是一个致力于解放大众的自由斗士的想法有点过分了。但这件事触动了我的神经。Ken Segal 曾在为苹果制作这则广告的广告公司工作过。在早期，他为 Steve Jobs 做了十多年的广告。

Ken Segal:

[00:08:00]

1984这则广告的风险很大。事实上，它的风险太大，以至于苹果公司在看到它的时候都不想播出它。你可能听说了 Steve 喜欢它，但苹果公司董事会的人并不喜欢它。事实上，他们很愤怒，这么多钱被花在这么一件事情上，以至于他们想解雇广告代理商。Steve 则为我们公司辩护。

Saron Yitbarek:

Jobs, 一如既往地, 慧眼识英雄.

Ken Segal:

这则广告在公司内,在业界内都引起了共鸣，成为了苹果产品的代表。无论人们那天是否有在购买电脑，它都带来了一种持续多年的影响，帮助定义了这家公司的品质。我们是叛军。我们是拿着大锤的人。

[00:08:30]

Saron Yitbarek:

因此，在争夺数十亿潜在消费者偏好的过程中，苹果公司和微软公司的帝王们正在学着把自己塑造成救世主,非凡的英雄,一种对生活方式的选择。但 Bill Gates 知道一些苹果难以理解的事情。那就是在一个相互连接的世界里，没有人，甚至是皇帝，能独自完成任务.

[00:09:00]

[00:09:30]

1985年6月25日。盖茨给当时的苹果CEO 发了一份备忘录。那是一个迷失的年代。乔布斯刚刚被逐出公司，直到1996年才回到苹果。也许正是因为乔布斯离开了，盖茨才敢写这份东西。在备忘录中，他鼓励苹果授权制造商分发他们的操作系统。我想读一下备忘录的最后部分，让你们知道这份备忘录是多么的有洞察力。盖茨写道:“如果没有其他个人电脑制造商的支持，苹果现在不可能让他们的创新技术成为标准。苹果必须开放麦金塔的架构，以获得获得快速发展和建立标准所需的支持”。换句话说，你们不要再自己玩自己的了。你们必须有与他人合作的意愿。你们必须与开发者合作.

[00:10:00]

[00:10:30]

多年后你依然可以看到这条哲学思想，当微软首席执行官 Steve Ballmer 上台做主题演讲时，他开始大喊:“开发者，开发者，开发者，开发者，开发者，开发者，开发者，开发者，开发者。” 你懂我的意思了吧。微软喜欢开发人员。虽然目前他们不打算与这些开发人员共享源代码，但是他们确实想建立起整个合作伙伴生态系统。而当 Bill Gates 建议苹果公司也这么做时(你可能已经猜到了)，这个想法就被抛到了九霄云外。他们的关系产生了间隙，五个月后，微软发布了Windows 1.0。战争开始了.

开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者, 开发者.

[00:11:00]

您正在收听的是来自红帽公司的原创播客《代码英雄》。本集是第一集，我们将回到过去，重温操作系统战争的史诗故事，我们将会找出，科技巨头之间的战争是如何为我们今天所生活的开源世界扫清道路的?

[00:11:30]

好的，让我们先来个背景故事吧。如果你已经听过了，那么请原谅我，但它很经典。当时是1979年，Steve Jobs 开车去 Palo Alto 的 Xerox Park 研究中心。那里的工程师一直在为他们所称之为的"图形用户界面"开发一系列的元素。也许你听说过。它们有菜单，滚动条，按钮，文件夹和重叠的窗口。这是对计算机界面的一个美丽的新设想。这是前所未有的。作家兼记者 Steve Levy 会谈到它的潜力。

Steven Levy:

[00:12:00]
新界面要前所未有地有好的多，这让我们无比兴奋,以前我们用的是所谓的命令行，它的让你和电脑之间的交互方式跟现实生活中的交互方式完全不同。
电脑上的鼠标和图像让你可以可以像现实生活中的交互一样实现与电脑的交互，你可以像指向现实生活中的东西一样指向电脑上的东西。这让事情变得简单多了。你无需要记住所有代码。

Saron Yitbarek:

[00:12:30]

[00:13:00]

不过，施乐的高管们并没有意识到他们正坐在金矿上。一如既往地，工程师比主管们更清楚它的价值。因此那些工程师，当被要求向 Jobs 展示所有这些东西是如何工作时，有点紧张。然而这是毕竟是高管的命令。Jobs 觉得，用他的话来说，“这个产品天才本来能够让施乐公司垄断整个行业，可是他最终会被公司的经营者毁掉，因为他们对产品的好坏没有概念”。这话有些苛刻，但是，Jobs 带着一卡车施乐高管错过的想法离开了会议。这几乎包含了他需要革新桌面计算体验的所有东西。1983年，苹果发布了 Lisa 电脑，1984年又发布了Mac电脑。这些设备的创意是抄袭自施乐公司的.

[00:13:30]

让我感兴趣的是,乔布斯对控诉他偷了图形用户界面的反应。他对此很冷静。他引用毕加索的话:“好的艺术家复制，伟大的艺术家偷窃。”他告诉一位记者，“我们总是无耻地窃取伟大的创意”。伟大的艺术家偷窃。好吧。我的意思是，我们说的并不是严格意义上的偷窃。没有人获得专有的源代码并公然将其集成到他们自己的操作系统中去。这要更温和些，更像是创意的借用。这就难控制的多了，就像 Jobs 自己即将学到的那样。传奇的软件向导、真正的代码英雄 Andy Hertzfeld 就是麦金塔开发团队的最初成员。

[00:14:00]

Andy Hertzfeld:

[00:14:30]

[00:15:00]

是的，微软是我们与麦金塔电脑的第一个软件合作伙伴。当时，我们并没有把他们当成是竞争对手。他们是苹果之外,第一家我们交付麦金塔原型的公司。我通常每周都会和微软的技术主管聊一次。他们是尝试我们所编写软件的第一个外部团队。他们给了我们非常重要的反馈，总的来说，我认为我们的关系非常好。但我也注意到，在我与技术主管的交谈中，他开始问一些系统实现方面的问题，而他本无需知道这些，我觉得，他们想要复制麦金塔电脑。我很早以前就像史蒂夫·乔布斯反馈过这件事，但在1983年秋天，这件事达到了高潮。我们发现，他们在1983年11月的COMDEX上发布了Windows，但却没有提前告诉我们. 对此史蒂夫·乔布斯勃然大怒。他认为那是一种背叛。

Saron Yitbarek:

[00:15:30]

[00:16:00]

随着新版Windows的发布，很明显，微软从苹果那里学到了苹果从施乐那里学来的所有想法。乔布斯很易怒。他的关于伟大艺术家如何偷窃的毕加索名言被别人学去了。而且恐怕盖茨也正是这么做的。据报道，当乔布斯怒斥盖茨偷了他们的东西时，盖茨回应道:“史蒂夫，我觉得这更像是我们都有一个叫施乐的富有邻居，我闯进他家偷电视机，却发现你已经偷过了”。苹果最终以窃取GUI的外观和风格为名起诉了微软。这个案子持续了好几年，但是在1993年，第九次巡回上诉法院的一名法官最终站在了微软一边。Vaughn Walker 法官宣布外观和风格不受版权保护。这是非常重要的。这一决定让苹果在无法垄断桌面计算的界面。很快，苹果短暂的领先优势消失了。以下是 Steven Levy 的观点。

Steven Levy:

[00:16:30]

[00:17:00]

他们之所以失去领先地位，不是因为微软方面窃取了知识产权，而是因为在上世纪80年代，他们无法通过更好的操作系统来巩固自己的优势。坦率地说，他们的电脑索价过高。因此微软从20世纪80年代中期开始开发Windows系统，但直到1990年开发出的Windows 3，我想，他才真正算是一个为黄金时期做好准备的版本,才真正可供大众使用。从此以后，微软能够将数以亿计的用户迁移到图形界面，而这是苹果无法做到的。虽然苹果公司有一个非常好的操作系统，但是那已经是1984年的产品了。

Saron Yitbarek:

[00:17:30]

[00:18:00]
现在微软主导着操作系统的战场。他们占据了90%的市场份额，并且针对各种各样的个人电脑进行了标准化。操作系统的未来看起来会由微软掌控。此后发生了什么?1997年,波士顿Macworld博览会上，你看到了一个几近破产的苹果。一个谦逊的多的史蒂夫·乔布斯走上舞台，开始谈论伙伴关系的重要性. 特别是他们与微软的新型合作伙伴关系。史蒂夫·乔布斯呼吁双方缓和关系，停止火拼。微软将拥有巨大的市场份额。从表面看，我们可能会认为世界和平了。但当利益如此巨大时，事情就没那么简单了。就在苹果和微软在数十年的争斗中伤痕累累、最终走向死角之际，一名21岁的芬兰计算机科学专业学生出现了。几乎是偶然地，他彻底改变了一切。

我是 Saron Yitbarek, 这里是代码英雄.

[00:18:30]
正当某些科技巨头正忙着就专有软件相互攻击时，自由软件和开源软件的新领军者如雨后春笋般涌现。其中一位优胜者就是理查德·斯托尔曼。你也许对他的工作很熟悉。他想要有自由软件和自由社会。这就像言论自由一样的自由，而不是像免费啤酒一样的免费。早在80年代，斯托尔曼就发现，除了昂贵的专有操作系统(如UNIX)外，就没有其他可行的替代品。因此他决定自己做一个。斯托尔曼的自由软件基金会发明了GNU，它的意思是"GNU's not UNIX"。它将是一个像UNIX一样的操作系统，但不包含所有UNIX代码，而且用户可以自由共享。

[00:19:00]

[00:19:30]

为了让你体会到80年代自由软件概念的重要性,从不同角度来说拥有UNIX代码的两家公司，AT&T贝尔实验室 以及 UNIX系统实验室威胁将会起诉任何看过UNIX源代码后又创建自己操作系统的人.
这些人是次一级的专利所属。用这两家公司的话来说，所有这些程序员都在“精神上受到了污染”，因为他们都见过UNIX代码。在UNIX系统实验室和Berkeley 软件设计之间的一个著名的法庭案例中，有人认为任何功能类似的系统，即使它本身没有使用UNIX代码，也归版权所有。Paul Jones当时是一名开发人员。他现在是数字图书馆ibiblio.org的主任。

Paul Jones:

[00:20:00]

他们认为，任何看过代码的人都受到了精神污染。因此几乎所有在安装有与UNIX相关操作系统的电脑上工作过的人以及任何在计算机科学部门工作的人都受到精神上的污染。因此，在USENIX的一年里，我们都a发有带有红字的白色小别针，上面写着“精神受到了污染”. 我们很喜欢带着这些别针到处走，以表达我们力挺Bell，因为我们的精神受到了污染。

[00:20:30]

Saron Yitbarek:

[00:21:00]

整个世界都被精神污染了。想要保持纯粹，保持事物的美好和专有的旧哲学正变得越来越不现实。正是在这被污染的现实中，历史上最伟大其中一个的代码英雄诞生了，他是一个芬兰男孩，名叫Linus Torvalds。如果这是《星球大战》，那么 Linus Torvalds 就是我们的卢克·天行者。他是赫尔辛基大学一名温文尔雅的研究生。有才华，但缺乏宏伟的愿景。典型的被逼上梁山的英雄。和其他年轻的英雄一样，他也感到沮丧。他想把386处理器整合到他的新电脑中。他对自己的IBM主机上运行的MS-DOS操作系统并不感冒，也负担不起UNIX软件5000美元的价格，而只有UNIX才能让他自由地编程。解决方案是Torvalds在1991年春天基于MINIX开发了一个名为Linux的操作系统内核。他自己的操作系统内核。

[00:21:30]

Steven Vaughan-Nichols:

Linus Torvalds 真的只想找点乐子.

Saron Yitbarek:

Steven Vaughan-Nichols 是 ZDNet.com 的特约编辑, 而且他从科技行业出现以来就一直在写科技行业相关的内容.

Steven Vaughan-Nichols:

[00:22:00]

[00:22:30]

当时有几个类似的操作系统。他最关心的是一个名叫MINIX的操作系统，MINIX旨在让学生学习如何构建操作系统。莱纳斯着到这些，觉得很有趣，但他想建立自己的操作系统。因此它始于赫尔辛基的一个DIY项目。一切就这样开始了，基本上就是一个大孩子在玩耍，学习如何做事。但不同之处在于，他足够聪明，足够执着，也足够友好，让所有其他人都参与进来，然后他开始把这个项目进行到底。27年后，这个项目变得比他想象的要大得多。

Saron Yitbarek:

[00:23:00]

到1991年秋季，Torvalds发布了10,000行代码，世界各地的人们开始提供注释，然后进行优化、添加和修改代码。对于今天的开发人员来说，这似乎很正常，但请记住，在那个时候，像这样的开放协作是对整个专有系统(微软、苹果和IBM在这方面做的非常好)道德上的侮辱。随后这种开放性被奉若神明。Torvalds将Linux置于GNU通用公共许可证之下。曾经保障斯托尔曼的GNU系统自由的许可证现在也将保障Linux的自由。Vaughan-Nichols解释道,迁移到incorporate GPL的重要性怎么强调都不过分,它基本上能永远保证软件的自由和开放性。

[00:23:30]

Steven Vaughan-Nichols:

In fact, by the license that it's under, which is called GPL version 2, you have to share the code if you're going to try to sell it or present it to the world, so that if you make an improvement, it's not enough just to give someone the improvement. You actually have to share with them the nuts and bolts of all those changes. Then they are adapted into Linux if they're good enough.

Saron Yitbarek:

[00:24:00]

That public approach proved massively attractive. Eric Raymond, one of the early evangelists of the movement wrote in his famous essay that, "Corporations like Microsoft and Apple have been trying to build software cathedrals, while Linux and its kind were offering a great babbling bazaar of different agendas and approaches. The bazaar was a lot more fun than the cathedral."

Stormy Peters:

I think at the time, what attracted people is that they were going to be in control of their own world.

Saron Yitbarek:

Stormy Peters is an industry analyst, and an advocate for free and open source software.

[00:24:30]

Stormy Peters:

[00:25:00]

When open source software first came out, the OS was all proprietary. You couldn't even add a printer without going through proprietary software. You couldn't add a headset. You couldn't develop a small hardware device of your own, and make it work with your laptop. You couldn't even put in a DVD and copy it, because you couldn't change the software. Even if you owned the DVD, you couldn't copy it. You had no control over this hardware/software system that you'd bought. You couldn't create anything new and bigger and better out of it. That's why an open source operating system was so important at the beginning. We needed an open source collaborative environment where we could build bigger and better things.

Saron Yitbarek:

[00:25:30]

Mind you, Linux isn't a purely egalitarian utopia. Linus Torvalds doesn't approve everything that goes into the kernel, but he does preside over its changes. He's installed a dozen or so people below him to manage different parts of the kernel. They, in turn, trust people under themselves, and so on, in a pyramid of trust. Changes might come from anywhere, but they're all judged and curated.

[00:26:00]

It is amazing, though, to think how humble, and kind of random, Linus' DIY project was to begin with. He didn't have a clue he was the Luke Skywalker figure in all this. He was just 21, and had been programming half his life. But this was the first time the silo opened up, and people started giving him feedback. Dozens, then hundreds, and thousands of contributors. With crowdsourcing like that, it doesn't take long before Linux starts growing. Really growing. It even finally gets noticed by Microsoft. Their CEO, Steve Ballmer, called Linux, and I quote, "A cancer that attaches itself in an intellectual property sense to everything it touches." Steven Levy describes where Ballmer was coming from.

Steven Levy:

[00:26:30]

Once Microsoft really solidified its monopoly, and indeed it was judged in federal court as a monopoly, anything that could be a threat to that, they reacted very strongly to. So of course, the idea that free software would be emerging, when they were charging for software, they saw as a cancer. They tried to come up with an intellectual property theory about why this was going to be bad for consumers.

Saron Yitbarek:

[00:27:00]

Linux was spreading, and Microsoft was worried. By 2006, Linux would become the second most widely used operating system after Windows, with about 5,000 developers working on it worldwide. Five thousand. Remember that memo that Bill Gates sent to Apple, the one where he's lecturing them about the importance of partnering with other people? Turns out, open source would take that idea of partnerships to a whole new level, in a way Bill Gates would have never foreseen.

[00:27:30]

[00:28:00]

We've been talking about these huge battles for the OS, but so far, the unsung heroes, the developers, haven't fully made it onto the battlefield. That changes next time, on Command Line Heroes. In episode two, part two of the OS wars, it's the rise of Linux. Businesses wake up, and realize the importance of developers. These open source rebels grow stronger, and the battlefield shifts from the desktop to the server room. There's corporate espionage, new heroes, and the unlikeliest change of heart in tech history. It all comes to a head in the concluding half of the OS wars.

[00:28:30]

To get new episodes of Command Line Heroes delivered automatically for free, make sure you hit subscribe on Apple podcasts, Spotify, Google Play, or however you get your podcasts. Over the rest of the season, we're visiting the latest battlefields, the up-for-grab territories where the next generation of Command Line Heroes are making their mark. For more info, check us out at redhat.com/commandlineheroes. I'm Saron Yitbarek. Until next time, keep on coding.


--------------------------------------------------------------------------------

via: https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-1

作者：[redhat][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.redhat.com
[b]: https://github.com/lujun9972
