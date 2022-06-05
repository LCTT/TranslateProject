[#]: subject: "OOP Before OOP with Simula"
[#]: via: "https://twobithistory.org/2019/01/31/simula.html"
[#]: author: "Two-Bit History https://twobithistory.org"
[#]: collector: "lujun9972"
[#]: translator: "aREversez"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Simula 诞生之前的面向对象程序设计
======

想象一下，你坐在河边，河岸上如茵绿草，不远处湍急河流；午后的阳光慵懒惬意，使人陷入冥想哲思，不觉开始思考眼前的河流是否真实存在。诚然，几米外确实有河水奔流而下。不过，我们所称为“河流”的存在究竟是什么呢？毕竟，河水奔流不息，一直处于变化之中。似乎，“河流”这个词无法指代任何固定不变的事物。

2009 年，Clojure 的创始人 <ruby>里奇·希基<rt>Rich Hickey</rt></ruby> 发表了[一场精彩的演讲][1]，探讨了为什么上文那样的哲学发问会给面向对象程序设计带来难题。他认为，人们看待计算机程序中的对象与看待河流的逻辑是一样的：对象是固定不变的。可实际上，许多对象或者说全部对象都无时无刻不处于变化之中。所以，这种逻辑并不正确，我们无法区分在不同状态下同一对象实例的不同之处。程序中没有时间的概念。人们只是单纯地用着同一个名字，以期在引用对象时，对象能够处于预期的状态中。这样，我们也就难免会遇到 <ruby>故障<rt>bugs</rt></ruby>。

希基总结道，这一难题的应对办法就是人们应该将世界模拟成对固定数据的 _过程_ 的集合，而不是变化着的对象的集合。换句话说，我们应把每个对象看作一条“河流”，因果相连。总结说来，你应该使用 Clojure 等函数式语言。

![][2] _作者在远足途中思考面向对象程序设计的本体论问题。_

自从希基发表演讲之后，人们对函数式编程语言的兴趣不断提升，主流的面向对象编程语言也大多都采用了函数式编程语言。尽管如此，大多数程序员依旧沿用自己的老一套，继续将对象实例化，不断改变其状态。这些人长此以往，很难做到用不同的视角看待编程。

我曾经想写一篇关于 Simula 的文章，大概会写到我们今天所熟知的面向对象的理念是何时又是如何应用到程序语言之中的。但是，我觉得写当初的 Simula 与如今的面向对象程序设计的 _迥然不同之处_，会更有趣一些，这我敢打包票。毕竟，我们现在熟知的面向对象程序设计在当时还未完全成型。Simula 有两个主要版本：Simula I 和 Simula 67。Simula 67 为世界带来了 <ruby>类<rt>class</rt></ruby>、 <ruby>类的继承<rt>class hierarchy</rt></ruby> 以及 <ruby>虚拟方法<rt>virtual method</rt></ruby>；围绕其他的设想，Simula I 首次测试了如何能够将数据和过程捆绑起来。Simula I 的模型不是希基提出的函数式模型，不过这一模型关注的是随时间展开的 _过程_，而非相互交互的有着隐藏状态的对象。如果 Simula 67 采用了 Simula I 的理念，那么我们如今所知的面向对象程序设计可能会大有不同——这类偶然性启示我们，不要想着现在的程序设计范式会一直占据主导地位。

### 从 Simula 0 到 Simula 67

Simula 是由 <ruby>克里斯汀·尼加德<rt>Kristen Nygaard</rt></ruby> 和 <ruby>奥利-王五·达尔<rt>Ole-Johan Dahl</rt></ruby> 两位挪威人开发出来的。

20世纪50年代末，尼加德受雇于挪威防务科学研究中心，该研究中心附属于挪威军方。在那里，他负责设计蒙特卡洛模拟方法，用于核反应堆设计与操作研究。最初，那些模拟实验完全通过人工开展；后来，实验在 Ferranti Mercury 电脑[1][3] 上编入程序运行。尼加德随后发现，将这些模拟实验输入电脑需要一种更有效的方式。

尼加德设计的这种模拟实验就是人们所知的“离散事件模型”，模拟记录了一系列事件随着时间改变系统状态的过程。但是问题的关键在于模拟可以从一个事件跳跃到另一个事件中，因为事件是离散的，事件之间的系统不存在任何变化。根据尼加德和达尔在 1966 年发表的一篇关于 Simula 的论文，这种模型被迅速应用于“神经网络、通信系统、交通流量、生产系统、管理系统、社会系统等”[2][4] 领域的分析。因此，尼加德认为，其他人描述模拟实验时，可能也需要更高层级的模型。于是他开始物色人才，帮助他完成他称之为“模拟语言”或者“蒙特卡洛编译器”的项目[3][5]。

达尔当时也受雇于挪威防务科学研究中心，专攻语言设计，此时也加入了尼加德的项目。在接下来一年左右的时间，尼加德和达尔携手开发了 Simula 0 语言。[4][6] 这一语言的早期版本仅仅是在 ALGOL 60 基础上进行的较小拓展，当时也只是打算将其用作预处理程序而已。Simula 0 远不及后来的编程语言复杂，其基本语言结构是“<ruby>站<rt>stations</rt></ruby>”与“<ruby>乘客<rt>customers</rt></ruby>”，这些结构可以用于针对具体某些离散事件网络建立模型。通过模拟飞机起飞的过程，尼加德和达尔给出了一个例子。[5][7] 但是尼加德和达尔最后想出了一个更加通用的语言结构，可以同时表示“站”和“乘客”，也可以为更广泛的模拟建立模型。这就是后来 Simula 的第一个主要版本，它改变了 Simula 作为 ALGOL 专属包的定位，使其转变为通用编程语言。

Simula I 没有“<ruby>站<rt>stations</rt></ruby>”和“<ruby>乘客<rt>customers</rt></ruby>”的语言结构，但它可以通过使用“进程”再现这些结构。一个进程包含大量数据属性，这些属性与作为进程 _操作规程_ 的单个行为相联系。你可能会把进程当作是只有单个方法的对象，比如 `run()`。不过，这种类比并不全面，因为每个进程的操作规程都可以随时暂停、随时恢复，因为这种操作规程属于协同程序的一种。Simula I 程序会将系统建立为一套进程的模型，在概念上这些进程并行运行。实际上，一个时间点上能称为“当前进程”的只有一个进程。但是，一旦某个进程暂停运行，那么下一个进程就会自动接替它的位置。开展模拟实验时，Simula 会预留出一份 “<ruby>事件通知<rt>event notices</rt></ruby>” 的时间线，跟踪记录每个进程恢复的时间。为了恢复暂停运行的进程，Simula 需要记录多个 <ruby>调用栈<rt>call stacks</rt></ruby> 的情况。这就意味着 Simula 无法再作为 ALGOL 的预处理程序了，因为 ALGOL 只有一个 <ruby>调用栈<rt>call stacks</rt></ruby>。于是，尼加德和达尔下定决心，开始编写自己的编译器。

尼加德和达尔在介绍该系统的论文中，借助图示，通过模拟一个可用机器数量有限的工厂，阐明了其用法。[6][8] 在该案例中，进程就好比订单：通过寻找可用的机器，订单得以发出；如果没有可用的机器，订单就会搁置；而一旦有机器空出来，订单就会执行下去。这种订单流程的概念被用以例证若干种不同的订单实例，不过这些实例并未调用任何方法。这类程序的主体仅仅是创建进程，并使其运行。

历史上第一个 Simula I 编译器发布于 1965 年。尼加德和达尔在离开挪威防务科学研究中心之后，就进入了挪威计算机中心工作，Simula I 也是在这里日渐流行起来的。当时，Simula I 在 UNIVAC 公司的计算机和Burroughs 公司的 B5500 计算机上均可执行。[7][9] 尼加德和达尔两人与一家名为 ASEA 的瑞典公司达成了咨询协议，运用 Simula 模拟加工车间。但是，尼加德和达尔随后就意识到 Simula 也可以写一些和模拟完全不搭边的程序。

奥斯陆大学教授 <ruby>斯坦因·克罗达尔<rt>Stein Krogdahl</rt></ruby> 曾写过关于 Simula 的发展史，称“真正能够促使新开发的通用语言快速发展的催化剂”就是[一篇题为<ruby>《记录处理》<rt>Record Handling</rt></ruby>的论文][10]，作者是英国计算机科学家 <ruby>查尔斯·安东尼·理查德·霍尔<rt>C.A.R. Hoare</rt></ruby>。[8][11] 假如你现在读霍尔的这篇论文，你就不会怀疑这句话。当人们谈及面向对象语言的发展史时，如果没有提起霍尔的大名，那绝对是不可能的。以下内容摘自霍尔的《记录处理》一文：

> 该方案设想，在程序执行期间，计算机内部存在任意若干条记录，每条记录都代表着程序员在过去、现在或未来所需的某个对象。程序对现有记录的数量保持动态控制，并可以根据当前任务的要求创建新的记录或删除现有记录。

> 计算机中的每条记录都必须属于数量有限但互不重合的记录类型中的一类；程序员可以根据需要声明尽可能多的记录类型，并借助标识符为各个类型命名。记录类型的命名可能是普通词汇，比如“牛”、“桌子”以及“房子”，同时，归属于这些类型的记录分别代表一头“牛”、一张“桌子”以及一座“房子”。

霍尔在这片论文中并未提到子类的概念，但是达尔非常感谢霍尔，是他引导了两人发现了这一概念。[9][12] 尼加德和达尔注意到 Simula I 的进程通常具有相同的元素，所以引入父类来执行共同元素就会非常方便。这也强化了“进程”这一概念本身可以用作父类的可能性，也就是说，并非每种类型都必须用作只有单个操作规程的进程。这就是 Simula 语言迈向通用化的第二次飞跃，此时，Simula 67 真正成为了通用编程语言。正是如此变化让尼加德和达尔萌生了给 Simula 改名的想法，想让人们意识到 Simula 不仅仅可以用作模拟。[10][13] 不过，考虑到 “Simula”这个名字的知名度已经很高了，另取名字恐怕会带来不小的麻烦。

1967年，尼加德和达尔与 <ruby>控制数据公司<rt>Control Data</rt></ruby> 签署协议，着手开发Simula 的新版本：Simula 67。同年六月份的一场会议中，来自 <ruby>控制数据公司<rt>Control Data</rt></ruby>、奥斯陆大学以及挪威计算机中心的代表与尼加德和达尔两人会面，意在为这门新语言制定标准与规范。最终，会议发布了 [《Simula 67 通用基础语言》][14]，确定了该语言的发展方向。

Simula 67 编译器的开发由若干家供应商负责。<ruby>Simula 用户协会<rt>The Association of Simula Users</rt></ruby>（ASU）也随后成立，并于每年举办年会。不久，Simula 67 的用户就遍及了23个国家。[11][15]

### 21 世纪的 Simula 语言

人们至今还记得 Simula，是因为后来那些取代它的编程语言都受到了它的巨大影响。到了今天，你很难找到还在使用 Simula 写程序的人，但是这并不意味着 Simula 已经从这个世界上消失了。得益于 [GNU cim][16]，人们在今天依然能够编写和运行 Simula 程序。

cim 编译器遵循 1986 年修订后的 Simula 标准，基本上也就是 Simula 67 版本。你可以用它编写类、子类以及虚拟方法，就像是在使用 Simula 67 一样。所以，用 Python 或 Ruby 轻松写出短短几行面向对象的程序，你照样也可以用 cim 写出来：

```

    ! dogs.sim ;
    Begin
        Class Dog;
            ! The cim compiler requires virtual procedures to be fully specified ;
            Virtual: Procedure bark Is Procedure bark;;
        Begin
            Procedure bark;
            Begin
                OutText("Woof!");
                OutImage;           ! Outputs a newline ;
            End;
        End;

        Dog Class Chihuahua;        ! Chihuahua is "prefixed" by Dog ;
        Begin
            Procedure bark;
            Begin
                OutText("Yap yap yap yap yap yap");
                OutImage;
            End;
        End;

        Ref (Dog) d;
        d :- new Chihuahua;         ! :- is the reference assignment operator ;
        d.bark;
    End;

```

你可以按照下面代码执行程序的编译与运行：

```

    $ cim dogs.sim
    Compiling dogs.sim:
    gcc -g -O2 -c dogs.c
    gcc -g -O2 -o dogs dogs.o -L/usr/local/lib -lcim
    $ ./dogs
    Yap yap yap yap yap yap

```

（你可能会注意到，cim 先将 Simula 语言编译为 C 语言，然后传递给 C 语言编译器。）

这就是 1967 年的面向对象程序设计，除了语法方面的不同，和 2019 年的面向对象程序设计并无本质区别。如果你同意我的这一观点，你也就懂得了为什么人们会认为 Simula 在历史上是那么的重要。

不过，我更想介绍一下 Simula I 的核心概念——进程模型。Simula 67保留了进程模型，不过只有在使用 <ruby>`进程`类<rt>Process class</rt></ruby> 和 <ruby>`模拟`块<rt>Simulation block</rt></ruby> 的时候才能调用。

为了表现出进程是如何运行的，我决定对下述场景进行模拟。想象一下，有这么一座村庄，村庄的旁边有条小河边，小河里有很多的鱼。但是，村里多的村民却只有一条鱼竿。有些村民胃口很大，每隔一个小时就饿了。他们一饿，就会拿着鱼竿去钓鱼。如果一位村民正在等鱼竿，另一位村民自然也用不了。这样一来，村民们就会为了钓鱼排起长长的队伍。假如村民要等五、六分钟才能钓到一条鱼，那么这样等下去，村民们的身体状况就会变得越来越差。再假如，一位村民已经到了骨瘦如柴的地步，最后他可能就会饿死。

这个例子多少有些奇怪，虽然我也不说不出来为什么我脑袋里最先想到的是这样的故事，但是就这样吧。我们把村民们当作 Simula 的各个进程，观察在一天的模拟时间内有着四个村民的村庄里会发生什么。

完整程序可以通过此处 [GitHub Gist][17] 的链接获取。

我把输出结果的最后几行放在了下面。我们来看看一天里最后几个小时发生了什么：

```

    1299.45: 王五饿了，要了鱼竿。
    1299.45: 王五正在钓鱼。
    1311.39: 王五钓到了一条鱼。
    1328.96: 赵六饿了，要了鱼竿。
    1328.96: 赵六正在钓鱼。
    1331.25: 李四饿了，要了鱼竿。
    1340.44: 赵六钓到了一条鱼。
    1340.44: 李四饿着肚子等着鱼竿。
    1340.44: 李四在等鱼竿的时候饿死了。
    1369.21: 王五饿了，要了鱼竿。
    1369.21: 王五正在钓鱼。
    1379.33: 王五钓到了一条鱼。
    1409.59: 赵六饿了，要了鱼竿。
    1409.59: 赵六正在钓鱼。
    1419.98: 赵六钓到了一条鱼。
    1427.53: 王五饿了，要了鱼竿。
    1427.53: 王五正在钓鱼。
    1437.52: 王五钓到了一条鱼。

```

李四最后饿死了，但是他比张三要长寿，因为张三还没到上午7点就死了。赵六和王五现在一定过得很好，因为需要鱼竿的就只剩下他们两个了。

这里，我要说明，这个程序最重要的部分只是创建了进程（四个村民），并让它们运行下去。各个进程操作对象（鱼竿）的方式与我们今天对对象的操作方式相同。但是程序的主体部分并没有调用任何方法，也没有修改进程的任何属性。进程本身具有内部状态，但是这种内部状态的改变只有进程自身才能做到。

在这个程序中，仍然有一些字段发生了变化，这类程序设计无法直接解决纯函数式编程所能解决的问题。但是正如克罗达尔所注意到的那样，“这一机制引导进行模拟的程序员为底层系统建立模型，生成一系列进程，每个进程表示了系统内的自然事件顺序。”[12][18] 先把影响其他对象的nouns 对象和 actors 对象放在一边，我们先来想一想运行中的进程。我们可以将程序的总控制权交予 Simula 的事件通知系统，克罗达尔称其为 <ruby>“时间管理器”<rt>time manager</rt><ruby>。因此，尽管我们仍然在适当地改变进程，但是没有任何进程可以假设其他进程的状态。每个进程只能间接地与其他进程进行交互。

这种模式如何用以编写编译器、HTTP 服务器以及其他内容，尚且无法确定。（另外，如果你在 Unity 游戏引擎上编写过游戏，就会发现两者十分相似。）不得不承认，尽管我们有了“时间管理器”，我们还是无法实现希基在解释有必要搞清楚程序中的时间概念时所提出的设想。（我认为，希基想要的类似于 [<ruby>阿达·洛芙莱斯<rt>Ada Lovelace</rt></ruby> 用于区分一个变量随时间变化产生的不同数值的上标符号][19]。）尽管如此，我们可以发现，面向对象程序设计前期的设计方式与我们今天所习惯的面向对象程序设计并非完全一致，我觉得这一点很有意思。我们可能会理所当然地认为，面向对象程序设计的方式千篇一律，即程序就是对事件的一长串记录：某个对象以特定顺序对其他对象产生作用。Simula I 的进程系统表明，面向对象程序设计的方式不止一种。仔细想一下，函数式语言或许是更好的设计方式，但是 Simula I 的发展告诉我们，现代面向对象程序设计被取代也很正常。

_如果你喜欢这篇文章，欢迎关注推特 [@TwoBitHistory][20]，也可通过 [RSS feed][21] 订阅，获取最新文章（每四周更新一篇）。_

_TwoBitHistory 文章回顾……_

> 嗨，大家好！很遗憾，我最近没有时间写新文章，但是我刚刚更新了我的 RSS 记录，整合了目前为止我私下对一些关键人物的采访，比如 Ramanathan Guha 和 Dan Libby。<https://t.co/WYPhvpTGqB>
>
> — TwoBitHistory (@TwoBitHistory) [December 18, 2018][22]

  1. Jan Rune Holmevik, “The History of Simula,” accessed January 31, 2019, <http://campus.hesge.ch/daehne/2004-2005/langages/simula.htm>. [↩︎][23]

  2. Ole-Johan Dahl and Kristen Nygaard, “SIMULA—An ALGOL-Based Simulation Langauge,” Communications of the ACM 9, no. 9 (September 1966): 671, accessed January 31, 2019, [http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.95.384&amp;rep=rep1&amp;type=pdf][24]. [↩︎][25]

  3. Stein Krogdahl, “The Birth of Simula,” 2, accessed January 31, 2019, <http://heim.ifi.uio.no/~steinkr/papers/HiNC1-webversion-simula.pdf>. [↩︎][26]

  4. ibid. [↩︎][27]

  5. Ole-Johan Dahl and Kristen Nygaard, “The Development of the Simula Languages,” ACM SIGPLAN Notices 13, no. 8 (August 1978): 248, accessed January 31, 2019, <https://hannemyr.com/cache/knojd_acm78.pdf>. [↩︎][28]

  6. Dahl and Nygaard (1966), 676. [↩︎][29]

  7. Dahl and Nygaard (1978), 257. [↩︎][30]

  8. Krogdahl, 3. [↩︎][31]

  9. Ole-Johan Dahl, “The Birth of Object-Orientation: The Simula Languages,” 3, accessed January 31, 2019, <http://www.olejohandahl.info/old/birth-of-oo.pdf>. [↩︎][32]

  10. Dahl and Nygaard (1978), 265. [↩︎][33]

  11. Holmevik. [↩︎][34]

  12. Krogdahl, 4. [↩︎][35]




--------------------------------------------------------------------------------

via: https://twobithistory.org/2019/01/31/simula.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[aREversez](https://github.com/aREversez)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://www.infoq.com/presentations/Are-We-There-Yet-Rich-Hickey
[2]: https://twobithistory.org/images/river.jpg
[3]: tmp.2ZIthXB4S6#fn:1
[4]: tmp.2ZIthXB4S6#fn:2
[5]: tmp.2ZIthXB4S6#fn:3
[6]: tmp.2ZIthXB4S6#fn:4
[7]: tmp.2ZIthXB4S6#fn:5
[8]: tmp.2ZIthXB4S6#fn:6
[9]: tmp.2ZIthXB4S6#fn:7
[10]: https://archive.computerhistory.org/resources/text/algol/ACM_Algol_bulletin/1061032/p39-hoare.pdf
[11]: tmp.2ZIthXB4S6#fn:8
[12]: tmp.2ZIthXB4S6#fn:9
[13]: tmp.2ZIthXB4S6#fn:10
[14]: http://web.eah-jena.de/~kleine/history/languages/Simula-CommonBaseLanguage.pdf
[15]: tmp.2ZIthXB4S6#fn:11
[16]: https://www.gnu.org/software/cim/
[17]: https://gist.github.com/sinclairtarget/6364cd521010d28ee24dd41ab3d61a96
[18]: tmp.2ZIthXB4S6#fn:12
[19]: https://twobithistory.org/2018/08/18/ada-lovelace-note-g.html
[20]: https://twitter.com/TwoBitHistory
[21]: https://twobithistory.org/feed.xml
[22]: https://twitter.com/TwoBitHistory/status/1075075139543449600?ref_src=twsrc%5Etfw
[23]: tmp.2ZIthXB4S6#fnref:1
[24]: http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.95.384&rep=rep1&type=pdf
[25]: tmp.2ZIthXB4S6#fnref:2
[26]: tmp.2ZIthXB4S6#fnref:3
[27]: tmp.2ZIthXB4S6#fnref:4
[28]: tmp.2ZIthXB4S6#fnref:5
[29]: tmp.2ZIthXB4S6#fnref:6
[30]: tmp.2ZIthXB4S6#fnref:7
[31]: tmp.2ZIthXB4S6#fnref:8
[32]: tmp.2ZIthXB4S6#fnref:9
[33]: tmp.2ZIthXB4S6#fnref:10
[34]: tmp.2ZIthXB4S6#fnref:11
[35]: tmp.2ZIthXB4S6#fnref:12
