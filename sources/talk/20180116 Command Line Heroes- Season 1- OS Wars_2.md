[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command Line Heroes: Season 1: OS Wars)
[#]: via: (https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-2-rise-of-linux)
[#]: author: (redhat https://www.redhat.com)

代码英雄: 第一季: 操作系统大战(第二部分 Linux 崛起)
======
Saron Yitbarek: 这玩意开着的吗? 让我们进一段史诗般的星球大战的开幕吧, 开始了.

配音: [00:00:30] 第二集:Linux®的崛起。微软帝国控制着90%的桌面用户。操作系统的全面标准化似乎是板上钉钉的事了。然而，互联网的出现将战争的焦点从桌面转向了企业，在该领域，所有商业组织都争相构建自己的服务器。与此同时，一个不太可能的英雄出现在开源反叛组织中。固执，戴着眼镜的Linus Torvalds免费发布了他的Linux系统。微软打了个趔趄-并且开始重组。

Saron Yitbarek: [00:01:00] 哦，我们书呆子就是喜欢那样。上一次我们讲到哪了?苹果和微软互相攻伐，试图在一场争夺桌面用户的战争中占据主导地位。在第一集的结尾，我们看到微软获得了大部分的市场份额。很快，由于互联网的兴起以及随之而来的开发者大军,整个市场都经历了一场地震。互联网将战场从在家庭和办公室中的个人电脑用户转移到拥有数百台服务器的大型商业客户中。

[00:01:30] 这意味着巨量资源的迁移。突然间，所有相关企业不仅被迫为服务器空间和网站建设付费，而且还必须集成软件来进行资源跟踪和数据库监控等工作。你需要很多开发人员来帮助你。至少那时候大家都是这么做的。

在操作系统之战的第二部分，我们将看到优先级的巨大转变，以及像Linus Torvalds和Richard Stallman这样的开源叛逆者是如何成功地在微软和整个软件行业的核心地带引起恐惧的。

[00:02:00] 我是 Saron Yitbarek,您现在收听的是代码英雄，一款红帽公司原创的播客节目. 每一集,我们都会给您带来“从码开始”改变技术的人的故事.

[00:02:30] 好。假设你是1991年的微软。你自我感觉良好，对吧?满怀信心。确定全球主导的地位感觉不错。你已经掌握了与其他企业合作的艺术，但是仍然将大部分开发人员、程序员和系统管理员排除在联盟之外，而他们才是真正的步兵。这是出现了个叫Linus Torvalds的芬兰极客。他和他的开源程序员团队正在开始发布Linux，其操作系统内核是由他们一起编写出来的。

[00:03:00] 坦白地说，如果你是微软公司，你并不会太在意Linux，甚至是一般意义上的开源运动，但是最终，Linux的规模变得如此之大，以至于微软不可能不注意到。Linux第一个版本出现在1991年，当时大概有10000行代码。十年后，变成了300万行代码。如果你想知道，今天则是2000万行代码。

[00:03:30] 让我们停留在90年代初一会儿。那是Linux还没有成为我们现在所知道的庞然大物。只是这个奇怪的病毒式的操作系统正在这个星球上蔓延，全世界的极客和黑客都爱上了它。那时候我还太年轻，但依然希望加入他们。在那个时候，发现Linux就如同进入了一个秘密社会一样。程序员与朋友分享Linux CD集，就像其他人分享地下音乐混音带一样。

Developer Tristram Oaten [00:03:40] 讲讲了你16岁时第一次接触Linux的故事吧。

Tristram Oaten: [00:04:00] 我和我的家人去了Red Sea上的Hurghada潜水度假。那是一个美丽的地方，强烈推荐。第一天，我喝了自来水。也许，我妈妈跟我说过不要这么做。我整个星期都病得很厉害，没有离开旅馆房间。当时我只带了一台新安装了Slackware Linux的笔记本电脑，我听说过这玩意并且正在尝试使用它。这台笔记本上没有额外的应用程序，只有8张cd。出于必要，整个星期我所做的就是去了解这个外星一般的系统。我阅读手册，摆弄着终端。我记得当时我甚至我不知道一个点(表示当前目录)和两个点(表示前一个目录)之间的区别。

[00:04:30] 我一点头绪都没有。犯过很多错误，但慢慢地，在这种强迫的孤独中，我突破了障碍，开始理解并明白命令行到底是怎么回事。假期结束时，我没有看过金字塔、尼罗河等任何埃及遗址，但我解锁了现代世界的一个奇迹。我解锁了Linux，接下来的事大家都知道了。

Saron Yitbarek: 你可以从很多人那里听到关于这个故事的不同说法。访问Linux命令行是一种革命性的体验。

David Cantrell: 它给了我源代码. 我当时的感觉是, "太神奇了."

Saron Yitbarek: 我们正在参加一个名为Flock to Fedora的2017年Linux开发者大会。

David Cantrell: ... 非常有吸引力。我觉得我对这个系统有了更多的控制力，它越来越吸引我。我想，从那时起，1995年我第一次编译Linux内核时，我就迷上了它。

Saron Yitbarek: 开发者 David Cantrell 与 Joe Brockmire.

Joe Brockmeier: 我寻遍了便宜软件最终找到一套四张CD的 Slackware Linux. 它看起来来非常令人兴奋而且很有趣，所以我把它带回家，安装在第二台电脑上，开始摆弄它，并为两件事情感到兴奋。一个是，我运行的不是Windows，另一个我Linux的开源特性。

Saron Yitbarek: [00:06:00] 某种程度上来说，对命令行的访问总是存在的。在开源真正开始流行还要早几十年前，人们(至少在开发人员中是这样)总是希望能够做到完全控制。让我们回到操作系统大战之前的那个时代，在苹果和微软他们的GUI而战之前。那时也有代码英雄。保罗·琼斯(Paul Jones)教授(在线图书馆ibiblio.org负责人)在那个古老的时代，就是一名开发人员。

Paul Jones: [00:07:00] 从本质上讲，互联网在那个时候比较少是客户端-服务器架构的，而是更多是点对点架构的。讲真，当我们说，某种VAX到VAX，某科学工作站，科学工作站。这并不意味着没有客户端与服务端的关系以及没有应用程序,但这的确意味着,最初的设计是思考如何实现点对点,它与IBM一直在做的东西相对立. IBM给你的只有哑终端,这种终端只能让你管理用户界面,却无法让你像真正的终端一样为所欲为。

Saron Yitbarek: 图形用户界面在普通用户中普及的同时，在工程师和开发人员中总是存在和一股相反的力量。早在20世纪70年代和80年代的Linux出现之前，这股力量就存在于EMAX和GNU中。有了斯托尔曼的自由软件基金会后，总有某些人想要使用命令行，但上世纪90年代的Linux的交付方式是独一无二的。

[00:07:30] Linux和其他开源软件的早期爱好者是都是先驱。我正站在他们的肩膀上。我们都是。

您现在收听的是代码英雄, 一款由红帽公司原创的播客. 这是操作系统大战的第二部分: Linux 崛起.

Steven Vaughan-Nichols: 1998年的时候, 情况发生了变化.

Saron Yitbarek: Steven Vaughan-Nichols 是zdnet.com的特约编辑，他已经写了几十年关于技术商业方面的文章了。他将向我们讲述Linux是如何慢慢变得越来越流行，直到自愿贡献者的数量远远超过了在Windows上工作的微软开发人员的数量的。不过，Linux从来没有真正关注过微软的台式机客户，这也许就是微软最开始时忽略了Linux及其开发者的原因。Linux真正大放光彩的地方是在服务器机房。当企业开始线上业务时，每个企业都需要一个独特的编程解决方案来满足其需求。

[00:08:30] WindowsNT于1993年问世，当时它已经在与其他的服务器操作系统展开竞争了，但是许多开发人员都在想，“既然我可以通过Apache构建出基于Linux的廉价系统，那我为什么要购买AIX设备或大型Windows设备呢？”关键点在于，Linux代码已经开始渗透到几乎所有在线的东西中。

Steven Vaughan-Nichols: [00:09:00] 令微软感到惊讶的是，它开始意识到，Linux实际上已经开始有一些商业应用，不是在桌面环境，而是在商业服务器上。因此，他们发起了一场运动，我们称之为FUD-恐惧、不确定和怀疑(fear,uncertainty和double).他们说，“哦，Linux这玩意，真的没有那么好。它不太可靠。你一点都不能相信它”。

Saron Yitbarek: [00:09:30] 这种软宣传式的攻击持续了一段时间。微软也不是唯一一个对Linux感到紧张的公司。这其实是整个行业在对抗这个奇怪新人的挑战。例如，任何与UNIX有利害关系的人都可能将Linux视为篡夺者。有一个案例很著名，那就是SCO组织(它发行过一种版本的UNIX)在过去10多年里发起一系列的诉讼，试图阻止Linux的传播。SCO最终失败而且破产了。与此同时，微软一直在寻找机会。他们势在必行。只不过目前还不清楚具体要怎么做。

Steven Vaughan-Nichols: [00:10:30] 让微软真正担心的是，第二年，在2000年的时候，IBM宣布,他们将于2001年投资10亿美元在Linux上。现在，IBM已经不再涉足个人电脑业务。他们还没有走出去，但他们正朝着这个方向前进，他们将Linux视为服务器和大型计算机的未来，在这一点上，剧透警告，IBM是正确的。Linux将主宰服务器世界。

Saron Yitbarek: 这已经不再仅仅是一群黑客喜欢命令行的Jedi式的控制了。金钱的投入对Linux助力极大。Linux国际的执行董事John "Mad Dog" Hall有一个故事可以解释为什么会这样。我们通过电话与他取得了联系。

John Hall: [00:11:30] 我的一个朋友名叫Dirk Holden[00:10:56]，他是德国德意志银行的一名系统管理员，他也参与了个人电脑上早期X Windows系统的图形项目中的工作。有一天我去银行拜访他，我说:“Dirk，你银行里有3000台服务器，用的都是Linux。为什么不用Microsoft NT呢?”他看着我说:“是的，我有3000台服务器，如果使用微软的Windows NT系统，我需要2999名系统管理员。”他继续说道:“而使用Linux，我只需要四个。”这真是完美的答案。

Saron Yitbarek: [00:12:00] 程序员们着迷的这些东西恰好对大公司也极具吸引力。但由于FUD的作用，一些企业对此持谨慎态度。他们听到开源，就想:"开源。这看起来不太可靠,很混乱，充满了BUG".但正如那位银行经理所指出的，金钱听过一种有趣的方式，说服人们克服困境。甚至那些需要网站的小公司也加入了Linux阵营。与一些昂贵的专有选择相比，使用一个廉价的Linux系统在成本上是无法比拟的。如果您是一家雇佣专业人员来构建网站的商店，那么您很定想让他们使用Linux。

[00:12:30] 让我们快进几年. Linux运行每个人的网站上。Linux已经征服了服务器世界，然后智能手机也随之诞生。当然，苹果和他们的iPhone占据了相当大的市场份额，而且微软也希望能进入这个市场，但令人惊讶的是，Linux也在那，已经做好准备了，迫不及待要大展拳脚。

作家兼记者 James Allworth.

James Allworth: [00:13:00] 当然还有容纳第二个竞争者的空间，那本可以是微软，但是实际上却是Android，而Andrid基本上是基于Linux的. 众所周知,Android被谷歌所收购，现在运行在世界上大部分的智能手机上，谷歌在Linux的基础上创建了Android。Linux使他们能够以零成本从一个非常复杂的操作系统开始。他们成功地实现了这一目标，最终将微软挡在了下一代设备之外，至少从操作系统的角度来看是这样。

Saron Yitbarek: [00:13:30] 天崩地裂了，很大程度上，微软有被埋没的风险。John Gossman是微软Azure团队的首席架构师。他还记得当时困扰公司的困惑。

John Gossman: [00:14:00] 像许多公司一样，微软也非常担心知识产权污染。他们认为，如果允许开发人员使用开源代码，那么很可能只是复制并粘贴一些代码到某些产品中，就会让某种病毒式的许可证生效从而引发未知的风险…，我认为，这跟公司文化有关，很多公司，包括微软，都对开源开发的意义和商业模式之间的分歧感到困惑。有一种观点认为，开源意味着你所有的软件都是免费的，人们永远不会付钱。

Saron Yitbarek: [00:14:30] 任何投资于旧的、专有软件模型的人都会觉得这里发生的一切对他们构成了威胁。当你威胁到像微软这样的大公司时，是的，他们一定会做出反应。他们推动所有这些FUD(fear,uncertainty,doubt)-恐惧，不确定性和怀疑是有道理的。当时，商业运作的方式基本上就是相互竞争。不过，如果他们是其他公司的话(If they'd been any other company,看不懂什么意思)，他们可能还会怀恨在心，抱着旧有的想法，但到了2013年，一切都变了。

[00:15:00] 微软的云计算服务Azure上线了，令人震惊的是，它从第一天开始就提供了Linux虚拟机。Steve Ballmer，这位把Linux称为癌症的首席执行官，已经离开了，代替他的是一位新的有远见的首席执行官Satya Nadella.

John Gossman: Satya 有不同的看法. 他属于另一个世代. 比Paul , Bill 和 Steve 更年轻的世代 , 他对开源有不同的看法.

Saron Yitbarek: John Gossman, 再说一次, 来自于 微软的Azure 团队.

John Gossman: [00:16:00] 大约四年前，处于实际需要，我们在Azure中添加了Linux支持。如果访问任何一家企业客户，你都会发现他们并没有试图决定是使用Windows还是使用Linux、使用.net还是使用Java TM。他们在很久以前就做出了决定——大约15年前才有这样的一些争论。现在，我见过的每一家公司都混合了Linux和Java、Windows和.net、SQL Server、Oracle和MySQL——基于专有源代码的产品和开放源代码的产品。

如果你正在运维着一个云，允许这些公司在云上运行他们的业务，那么你就不能简单地告诉他们，“你可以使用这个软件，但你不能使用那个软件。”

Saron Yitbarek: [00:16:30] 这正是 Satya Nadella 采纳的哲学思想. 2014年秋季，他站在舞台上，希望传递一个重要信息。微软爱Linux。他接着说，Azure 20%的业务量已经是Linux了，微软将始终对Linux发行版提供一流的支持。没有哪怕一丝对开源的宿怨。

为了说明这一点，在他们的背后有一个巨大的标志，上面写着:“Microsoft hearts Linux”。哇哇哇。对我们中的一些人来说，这种转变有点令人震惊，但实际上，无需如此震惊。下面是Steven Levy,一名科技记者兼作家。

Steven Levy: [00:17:30] 当你在踢足球的时候，如果草坪变滑了，那么你也许会换一种不同的鞋子。他们当初就是这么做的。他们不能否认现实而且他们之间也有有聪明人,所以他们必须意识到,这就是世界的运行方式,不管他们早些时候说了什么,即使他们对之前的言论感到尴尬,但是让他们之前关于开源多么可怕的言论影响到现在明智的决策那才真的是疯了。

Saron Yitbarek: [00:18:00] 微软低下了它高傲的头. 你可能还记得苹果公司, 经过多年的孤立无援, 最终转向与微软构建合作伙伴关系. 现在轮到微软进行180度转变了. 经过多年的与开源方法的战斗后，他们正在重塑自己。要么改变，要么死亡. Steven Vaughan-Nichols.

Steven Vaughan-Nichols: [00:18:30] 即使是像微软这样规模的公司也无法与成千上万的开源开发者竞争，这些开发者开发这包括Linux在内的其他大项目。很长时间以来他们都不愿意这么做。前微软首席执行官史蒂夫·鲍尔默（SteveBallmer）对Linux深恶痛绝。由于它的GPL许可证，让Linux称为一种癌症，但一旦鲍尔默被扫地出门，新的微软领导层说，“这就好像试图命令潮流不要过来，但潮水依然会不断涌进来。我们应该与Linux合作，而不是与之对抗。”

Saron Tiebreak: [00:19:00] 真的，在线技术历史上最大的胜利之一就是微软能够做出这样的转变，当他们最终决定这么做的时候。当然，当微软出现在开源的桌子上时，老的、铁杆Linux支持者是相当怀疑的。他们不确定自己是否能接受这些家伙，但正如沃恩-尼科尔斯所指出的，今天的微软根本不是你父母的微软。事实上, 互联网技术历史上最大的胜利之一就是让微软最终做出如此转变. 当然，当微软出现在开源桌上时，老一代的、铁杆Linux支持者是相当怀疑的。他们不确定自己是否能接受这些家伙，但正如Vaughan-Nichols 所指出的，今天的微软已经不是你父母那一代时的微软了。

Steven Vaughan-Nichols : [00:19:30] 2017年的微软既不是史蒂夫•鲍尔默(Steve Ballmer)的微软，也不是比尔•盖茨(Bill Gates)的微软。这是一家完全不同的公司，有着完全不同的方法，而且，开源软件一旦被放出，就无法被收回。开源已经吞噬了整个技术世界。从未听说过Linux的人可能对它并不了解，但是每次他们访问Facebook，他们都在运行Linux。每次执行谷歌搜索时，你都在运行Linux。

[00:20:00] 每次你用Android手机，你都在运行Linux。它确实无处不在，微软无法阻止它，我认为以为微软可以以某种方式接管它的想法，太天真了。

Saron Yitbarek: [00:20:30] 开源支持者可能一直担心微软会像混入羊群中的狼一样，但事实是，开源软件的本质保护了它无法被完全控制。没有一家公司能够拥有Linux并以某种特定的方式控制它。Greg Kroah-Hartman是Linux基金会的一名成员。

Greg Kroah-Hartman: 每个公司和个人都以自私的方式为Linux做出贡献。他们之所以这样做是因为他们想要解决他们所面临的问题，可能是硬件无法工作，或者是他们想要添加一个新功能来做其他事情，又或者想在他们的产品中使用它。这很棒，因为他们会把代码贡献回去,此后每个人都会从中受益，这样每个人都可以用到这份代码。正是因为这种自私，所有的公司，所有的人，所有的人都能从中受益。

Saron Yitbarek: [00:21:30] Microsoft has realized that in the coming cloud wars, fighting Linux would be like going to war with, well, a cloud. Linux and open source aren't the enemy, they're the atmosphere. Today, Microsoft has joined the Linux Foundation as a platinum member. They became the number one contributor to open source on GitHub. In September, 2017, they even joined the Open Source Initiative. These days, Microsoft releases a lot of its code under open licenses. Microsoft's John Gossman describes what happened when they open sourced .net. At first, they didn't really think they'd get much back.

John Gossman: [00:22:00] We didn't count on contributions from the community, and yet, three years in, over 50 per cent of the contributions to the .net framework libraries, now, are coming from outside of Microsoft. This includes big pieces of code. Samsung has contributed ARM support to .net. Intel and ARM and a couple other chip people have contributed code generation specific for their processors to the .net framework, as well as a surprising number of fixes, performance improvements , and stuff — from just individual contributors to the community.

Saron Yitbarek: Up until a few years ago, the Microsoft we have today, this open Microsoft, would have been unthinkable.

[00:23:00] I'm Saron Yitbarek, and this is Command Line Heroes. Okay, we've seen titanic battles for the love of millions of desktop users. We've seen open source software creep up behind the proprietary titans, and nab huge market share. We've seen fleets of command line heroes transform the programming landscape into the one handed down to people like me and you. Today, big business is absorbing open source software, and through it all, everybody is still borrowing from everybody.

[00:23:30] In the tech wild west, it's always been that way. Apple gets inspired by Xerox, Microsoft gets inspired by Apple, Linux gets inspired by UNIX. Evolve, borrow, constantly grow. In David and Goliath terms, open source software is no longer a David, but, you know what? It's not even Goliath, either. Open source has transcended. It's become the battlefield that others fight on. As the open source approach becomes inevitable, new wars, wars that are fought in the cloud, wars that are fought on the open source battlefield, are ramping up.

Here's author Steven Levy.

Steven Levy: [00:24:00] Basically, right now, we have four or five companies, if you count Microsoft, that in various ways are fighting to be the platform for all we do, for artificial intelligence, say. You see wars between intelligent assistants, and guess what? Apple has an intelligent assistant, Siri. Microsoft has one, Cortana. Google has the Google Assistant. Samsung has an intelligent assistant. Amazon has one, Alexa. We see these battles shifting to different areas, there. Maybe, you could say, the hottest one is would be, whose AI platform is going to control all the stuff in our lives there, and those five companies are all competing for that.

Saron Yitbarek: If you're looking for another rebel that's going to sneak up behind Facebook or Google or Amazon and blindside them the way Linux blindsided Microsoft, you might be looking a long time, because as author James Allworth points out, being a true rebel is only getting harder and harder.

James Allworth: [00:25:30] Scale's always been an advantage but the nature of scale advantages are almost ... Whereas, I think previously they were more linear in nature, now it's more exponential in nature, and so, once you start to get out in front with something like this , it becomes harder and harder for a new player to come in and catch up. I think this is true of the internet era in general, whether it's scale like that or the importance and advantages that data bestow on an organization in terms of its ability to compete. Once you get out in front, you attract more customers, and then that gives you more data and that enables you to do an even better job, and then, why on earth would you want to go with the number two player, because they're so far behind? I think it's going to be no different in cloud.

Saron Yitbarek: [00:26:00] This story began with singular heroes like Steve Jobs and Bill Gates, but the progress of technology has taken on a crowdsourced, organic feel. I think it's telling that our open source hero, Linus Torvalds, didn't even have a real plan when he first invented the Linux kernel. He was a brilliant , young developer for sure, but he was also like a single drop of water at the very front of a tidal wave. The revolution was inevitable. It's been estimated that for a proprietary company to create a Linux distribution in their old - fashioned , proprietary way, it would cost them well over $ 10 billion. That points to the power of open source.

[00:26:30] In the end, it's not something that a proprietary model is going to compete with. Successful companies have to remain open. That's the big, ultimate lesson in all this. Something else to keep in mind: W hen we're wired together, our capacity to grow and build on what we've already accomplished becomes limitless. As big as these companies get, we don't have to sit around waiting for them to give us something better. Think about the new developer who learns to code for the sheer joy of creating, the mom who decides that if nobody's going to build what she needs, then she'll build it herself.

Wherever tomorrow's great programmers come from, they're always going to have the capacity to build the next big thing, so long as there's access to the command line.

[00:27:30] That's it for our two - part tale on the OS wars that shaped our digital lives. The struggle for dominance moved from the desktop to the server room, and ultimately into the cloud. Old enemies became unlikely allies, and a crowdsourced future left everything open . Listen, I know, there are a hundred other heroes we didn't have space for in this history trip, so drop us a line. Share your story. Redhat.com/commandlineheroes. I'm listening.

We're spending the rest of the season learning what today's heroes are creating, and what battles they're going through to bring their creations to life. Come back for more tales — from the epic front lines of programming. We drop a new episode every two weeks. In a couple weeks' time, we bring you episode three: the Agile Revolution.

[00:28:00] Command Line Heroes is an original podcast from Red Hat. To get new episodes delivered automatically for free, make sure to subscribe to the show. Just search for “ Command Line Heroes ” in Apple p odcast s , Spotify, Google Play, and pretty much everywhere else you can find podcasts. Then, hit “ subscribe ” so you will be the first to know when new episodes are available.

I'm Saron Yitbarek. Thanks for listening. Keep on coding.

--------------------------------------------------------------------------------

via: https://www.redhat.com/en/command-line-heroes/season-1/os-wars-part-2-rise-of-linux

作者：[redhat][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.redhat.com
[b]: https://github.com/lujun9972
