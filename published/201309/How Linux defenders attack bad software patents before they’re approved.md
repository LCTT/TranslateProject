Linux Defenders怎样先发制人阻止恶意软件专利被批准
=========================================== 

**_这个小组识别危险的专利并且试着还原它们的本来面目。_**

![](http://cdn.arstechnica.net/wp-content/uploads/2013/09/linux-penguin.jpg)

尽管那些“专利蟑螂”发起影响开源软件的诉讼数目与日俱增，但还有一线希望。2011年9月签署了一部法律-《美国发明法案》，它提供了新的途径来阻止未来可能引起诉讼的过于宽泛的软件专利。

今天的 LinuxCon的一个会议中，[Linux Defenders][1] 的负责人Andrea Casillas解释了这个组织是如何利用新法律赋予的权利来对抗专利申请。Open Invention Network 的一个项目 Software Freedom Law Center，Linux 基金会以及 Linux Defenders 对每周公布的6000项专利做检查，试图识别出那些对Linux和开源的潜在威胁。然后，这个组织查找一些至少能够废止其中一部分专利申请的先例。

下一步就是协同Linux技术专家编纂防御性公共出版物，虽然它们本身不是专利，但它们描述了一项发明，并放入公开档案以阻止覆含该技术的新专利的批准。这些出版物通常有2-3页的技术描述，美国专利商标局的审查员可以在管理可能会失效的先例或者限制新专利申请的范围时阅读参考。

“我们将与作者、发明者或者开发者携手合作编写这些出版物，使它们更加有效。” Casillas 说。他一直主张 Linux 社区帮助这个小组发现危险专利并寻找先例。

防御性公共出版物是旧的策略，但它将会因为 America Ivents Act 而越来越接近公众的生活。Casillas 解释说：“这是审查人员第一次欢迎公众的互动。任何个人都可以免费递交电子版的关于先例的申请。”

Linux Defenders 已经编纂好了与来自 Microsoft，Apple和其它公司的专利申请有关的防御性公共出版物。概括来说，Casillas 说防御性公共出版物不是要去迫使某家公司放弃某一专利，而是要迫使某家公司缩小它们申请的专利包括的范围。

当被问起 Linux Defenders 能否说出因为这个过程而受限的专利申请的案例时，Casillas 和她的同事们说他们仍然在寻找评估它的有效性的方法。在6到9个月里，他们希望能找到一个工具来跟踪记录专利研究者们在复审中使用防御性公共出版物的情况。

Linux Denfenders 同时也把矛头指向已经通过的专利。但 Casillas 提醒说要推倒已经批准的专利的法律标准非常高。

###专利诉讼“能让 Red Hat扫地出门”

昨天 LinuxCon 的一个单独的会议上，Red Hat 的 Fedora 项目经理 Tom Callaway 讨论了开源的法律威胁。

Red Hat 批评了“专利蟑螂”并且采取多种措施[保护自己和用户][2]。Callaway 说不能小看这些威胁。“我不是说大话，Red Hat在我们开源产业里不是一个小公司，我们可能是最大的。一个关键专利诉讼的失利可以让 Red Hat在这行干不下去。这就是专利的重要性，也足见在业界它是多么让人闻风丧胆。”

各种可能性中，Red Hat不会被扫地出门的。它有一个保护自己及用户的在法庭上对抗专利“专利蟑螂”的良好跟踪记录。它把保障用户权益、对抗诉讼当做它的软件程序，而且已经建立起了一系列防御专利。

尽管付费的 RHEL 会员资格给了用户额外的保护，Red Hat也正在保证Fedora这个免费的系统远离法律纠纷。它是这么做的：分析所有代码，确保每段代码都使用合适的许可，有时移除或重写有嫌疑的代码。这会导致软件产生负面的结果。“我们在 Fedora 中遇到了很多问题。专利使我们不能按照我们所想要的方式去做事。”Callaway 这么说。

在最近的与 Rackspace 和 Red Hat 有关的案子里，一个叫做 Uniloc 公司想要从 Rackspace 处获得费用，因为后者使用了Red Hat的基于 Linux 的服务器。Uniloc的案子以其败诉告终。法官宣判它的专利声明无效，因为它仅描述了一个相对简单的数学操作。

但是应对这些诉讼很费钱。甚至 Red Hat 有时付专利费避免打官司。

Callaway在过分宽泛的专利面前流露出了挫败感。某些专利是“如此的模糊以至于它们可以指任何东西，”他说，“它们可以被应用到几乎任何地方，并且专利持有者打赌认定你不会去计较。”


###帮助专利审查人员识别恶意专利

Casillas告诉我们，那些过分宽泛的专利，正是 Linux Defenders 想要去阻止的。模糊的专利经常能够通过专利申请，部分原因是因为专利审查人员用在每个申请上的时间不会超过20小时。

总的时间是“相当难以置信，它考虑到这个过程所需时间长短以及这个专利发布的重要性。”他说。那20小时“包括了浏览申请，确定它按格式编辑，你的基本合法需求，而且这段时间决定着这个发明的前景。”

专利审查人员用7到8个小时搜索先例，不论是专利形式的还是其它公共可及的技术描述，她说。

通过提交防御性公共出版物，提取标签以使专利审查人员更容易找到，Linux Defenders 希望使美国专利商标局更加起到实际作用。

Casillas 说：“我们不是在增加他们的工作量，而是帮助他们一起完成这些相关出版物”


via: http://arstechnica.com/tech-policy/2013/09/how-linux-defenders-attack-software-patents-before-theyre-approved/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[boredivan][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[boredivan]:http://linux.cn/space/boredivan
[Caroline]:http://linux.cn/space/14763

[1]:http://linuxdefenders.org/
[2]:http://www.networkworld.com/news/2011/050511-red-hat-ceo-patents.html 
