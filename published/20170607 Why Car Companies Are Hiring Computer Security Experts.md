为什么车企纷纷招聘计算机安全专家
============================================================

![](https://static01.nyt.com/images/2017/06/08/business/08BITS-GURUS1/08BITS-GURUS1-superJumbo.jpg)

来自 CloudFlare 公司的网络安全专家 Marc Rogers（左）和来自 Lookout 的 Kevin Mahaffey 能够通过直接连接在汽车上的笔记本电脑控制特斯拉汽车进行许多操作。图为他们在 CloudFlare 的大厅里的的熔岩灯前的合影，这些熔岩灯被用来生成密匙。（纽约时报 CreditChristie Hemm Klok 拍摄）

大约在七年前，伊朗的几位顶级核科学家经历过一系列形式类似的暗杀：凶手的摩托车接近他们乘坐的汽车，把磁性炸弹吸附在汽车上，然后逃离并引爆炸弹。

安全专家们警告人们，再过 7 年，凶手们不再需要摩托车或磁性炸弹。他们所需要的只是一台笔记本电脑和发送给无人驾驶汽车的一段代码——让汽车坠桥、被货车撞扁或者在高速公路上突然抛锚。

汽车制造商眼中的无人驾驶汽车。在黑客眼中只是一台可以达到时速 100 公里的计算机。

网络安全公司 CloudFlare 的首席安全研究员<ruby>马克·罗杰斯<rt>Marc Rogers</rt></ruby>说：“它们已经不再是汽车了。它们是装在车轮上的数据中心。从外界接收的每一条数据都可以作为黑客的攻击载体。“

两年前，两名“白帽”黑客（寻找系统漏洞并修复它们的研究员，而不是利用漏洞来犯罪的<ruby>破坏者<rt>Cracker</rt></ruby>）成功地在数里之外用电脑获得了一辆 Jeep Cherokee 的控制权。他们控制汽车撞击一个放置在高速公路中央的假人（在场景设定中是一位紧张的记者），直接终止了假人的一生。

黑客 Chris Valasek 和 Charlie Miller（现在是 Uber 和滴滴的安全研究人员）发现了一条 [由 Jeep 娱乐系统通向仪表板的电路][10]。他们利用这条线路控制了车辆转向、刹车和变速——他们在高速公路上撞击假人所需的一切。

Miller 先生上周日在 Twitter 上写道：“汽车被黑客入侵成为头条新闻，但是人们要清楚，没有谁的汽车被坏人入侵过。 这些只是研究人员的测试。”

尽管如此，Miller 和 Valasek 的研究使 Jeep 汽车的制造商<ruby>菲亚特克莱斯勒<rt>Fiat Chrysler</rt></ruby>付出了巨大的代价，因为这个安全漏洞，菲亚特克莱斯勒被迫召回了 140 万辆汽车。

毫无疑问，后来通用汽车首席执行官<ruby>玛丽·巴拉<rt>Mary Barra</rt></ruby>把网络安全作为公司的首要任务。现在，计算机网络安全领域的人才在汽车制造商和高科技公司推进的无人驾驶汽车项目中的需求量很大。

优步 、特斯拉、苹果和中国的滴滴一直在积极招聘像 Miller 先生和 Valasek 先生这样的白帽黑客，传统的网络安全公司和学术界也有这样的趋势。

去年，特斯拉挖走了苹果 iOS 操作系统的安全经理 Aaron Sigel。优步挖走了 Facebook 的白帽黑客 Chris Gates。Miller 先生在发现 Jeep 的漏洞后就职于优步，然后被滴滴挖走。计算机安全领域已经有数十名优秀的工程师加入无人驾驶汽车项目研究的行列。

Miller 先生说，他离开了优步的一部分原因是滴滴给了他更自由的工作空间。

Miller 星期六在 Twitter 上写道：“汽车制造商对待网络攻击的威胁似乎更加严肃，但我仍然希望有更大的透明度。”

像许多大型科技公司一样，特斯拉和菲亚特克莱斯勒也开始给那些发现并提交漏洞的黑客们提供奖励。通用汽车公司也做了类似的事情，但批评人士认为通用汽车公司的计划与科技公司们提供的计划相比诚意不足，迄今为止还收效甚微。

在 Miller 和 Valasek 发现 Jeep 漏洞的一年后，他们又向人们演示了所有其他可能危害乘客安全的方式，包括劫持车辆的速度控制系统，猛打方向盘或在高速行驶下拉动手刹——这一切都是由汽车外的电脑操作的。（在测试中使用的汽车最后掉进路边的沟渠，他们只能寻求当地拖车公司的帮助）

虽然他们必须在 Jeep 车上才能做到这一切，但这也证明了入侵的可能性。

在 Jeep 被入侵之前，华盛顿大学和加利福尼亚大学圣地亚哥分校的[安全研究人员][12]第一个通过蓝牙远程控制轿车并控制其刹车。研究人员警告汽车公司：汽车联网程度越高，被入侵的可能性就越大。

2015 年，安全研究人员们发现了入侵高度软件化的特斯拉 Model S 的途径。Rogers 先生和网络安全公司 Lookout 的首席技术官<ruby>凯文·马哈菲<rt>Kevin Mahaffey</rt></ruby>找到了一种通过直接连接在汽车上的笔记本电脑控制特斯拉汽车的方法。

一年后，来自中国腾讯的一支团队做了更进一步的尝试。他们入侵了一辆行驶中的特斯拉 Model S 并控制了其刹车器达12 米远。和 Jeep 不同，特斯拉可以通过远程安装补丁来修复那些可能被黑的安全漏洞。

以上所有的例子中，入侵者都是无恶意的白帽黑客或者安全研究人员，但是给无人驾驶汽车制造商的教训是惨重的。

黑客入侵汽车的动机是无穷的。在得知 Rogers 先生和 Mahaffey 先生对特斯拉 Model S 的研究之后，一位中国 app 开发者和他们联系、询问他们是否愿意分享或者出售他们发现的漏洞。（这位 app 开发者正在寻找后门，试图在特斯拉的仪表盘上偷偷安装 app）

尽管犯罪分子们一直在积极开发、购买、使用能够破解汽车的关键通信数据的工具，但目前还没有证据能够表明犯罪分子们已经找到连接汽车的后门。

但随着越来越多的无人驾驶和半自动驾驶的汽车驶入公路，它们将成为更有价值的目标。安全专家警告道：无人驾驶汽车面临着更复杂、更多面的入侵风险，每一辆新无人驾驶汽车的加入，都使这个系统变得更复杂，而复杂性不可避免地带来脆弱性。

20 年前，平均每辆汽车有 100 万行代码，通用汽车公司的 2010 [雪佛兰 Volt][13] 有大约 1000 万行代码——比一架 [F-35 战斗机][14]的代码还要多。

如今， 平均每辆汽车至少有 1 亿行代码。无人驾驶汽车公司预计不久以后它们将有 2 亿行代码。当你停下来考虑：平均每 1000 行代码有 15 到 50 个缺陷，那么潜在的可利用缺陷就会以很快的速度增加。

“计算机最大的安全威胁仅仅是数据被删除，但无人驾驶汽车一旦出现安全事故，失去的却是乘客的生命。”一家致力于解决汽车安全问题的以色列初创公司 Karamba Security 的联合创始人 David Barzilai 说。

安全专家说道：要想真正保障无人驾驶汽车的安全，汽车制造商必须想办法避免所有可能产生的漏洞——即使漏洞不可避免。其中最大的挑战，是汽车制造商和软件开发商们之间的缺乏合作经验。

网络安全公司 Lookout 的 Mahaffey 先生说：“新的革命已经出现，我们不能固步自封，应该寻求新的思维。我们需要像发明出安全气囊那样的人来解决安全漏洞，但我们现在还没有看到行业内有人做出改变。”

Mahaffey 先生说：“在这场无人驾驶汽车的竞争中，那些最注重软件的公司将会成为最后的赢家。”

--------------------------------------------------------------------------------

via: https://www.nytimes.com/2017/06/07/technology/why-car-companies-are-hiring-computer-security-experts.html

作者：[NICOLE PERLROTH][a]
译者：[XiatianSummer](https://github.com/XiatianSummer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.nytimes.com/by/nicole-perlroth
[1]:https://www.nytimes.com/2016/06/09/technology/software-as-weaponry-in-a-computer-connected-world.html
[2]:https://www.nytimes.com/2015/08/29/technology/uber-hires-two-engineers-who-showed-cars-could-be-hacked.html
[3]:https://www.nytimes.com/2015/08/11/opinion/zeynep-tufekci-why-smart-objects-may-be-a-dumb-idea.html
[4]:https://www.nytimes.com/by/nicole-perlroth
[5]:https://www.nytimes.com/column/bits
[6]:https://www.nytimes.com/2017/06/07/technology/why-car-companies-are-hiring-computer-security-experts.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#story-continues-1
[7]:http://www.nytimes.com/newsletters/sample/bits?pgtype=subscriptionspage&version=business&contentId=TU&eventName=sample&module=newsletter-sign-up
[8]:https://www.nytimes.com/privacy
[9]:https://www.nytimes.com/help/index.html
[10]:https://bits.blogs.nytimes.com/2015/07/21/security-researchers-find-a-way-to-hack-cars/
[11]:http://www.nytimes.com/topic/company/tesla-motors-inc?inline=nyt-org
[12]:http://www.autosec.org/pubs/cars-usenixsec2011.pdf
[13]:http://autos.nytimes.com/2011/Chevrolet/Volt/238/4117/329463/researchOverview.aspx?inline=nyt-classifier
[14]:http://topics.nytimes.com/top/reference/timestopics/subjects/m/military_aircraft/f35_airplane/index.html?inline=nyt-classifier
[15]:https://www.nytimes.com/2017/06/07/technology/why-car-companies-are-hiring-computer-security-experts.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#story-continues-3
