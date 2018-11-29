Lisp 是怎么成为上帝的编程语言的
======

当程序员们谈论各类编程语言的相对优势时，他们通常会采用相当平淡的措词，就好像这些语言是一条工具带上的各种工具似的 —— 有适合写操作系统的，也有适合把其它程序黏在一起来完成特殊工作的。这种讨论方式非常合理；不同语言的能力不同。不声明特定用途就声称某门语言比其他语言更优秀只能导致侮辱性的无用争论。

但有一门语言似乎受到和用途无关的特殊尊敬：那就是 Lisp。即使是恨不得给每个说出形如“某某语言比其他所有语言都好”这类话的人都来一拳的键盘远征军们，也会承认 Lisp 处于另一个层次。 Lisp 超越了用于评判其他语言的实用主义标准，因为普通程序员并不使用 Lisp 编写实用的程序 —— 而且，多半他们永远也不会这么做。然而，人们对 Lisp 的敬意是如此深厚，甚至于到了这门语言会时而被加上神话属性的程度。

大家都喜欢的网络漫画合集 xkcd 就至少在两组漫画中如此描绘过 Lisp：[其中一组漫画][1]中，某人得到了某种 Lisp 启示，而这好像使他理解了宇宙的基本构架。

![](https://imgs.xkcd.com/comics/lisp.jpg)

在[另一组漫画][2]中，一个穿着长袍的老程序员给他的徒弟递了一沓圆括号，说这是“文明时代的优雅武器”，暗示着 Lisp 就像原力那样拥有各式各样的神秘力量。

![](https://imgs.xkcd.com/comics/lisp_cycles.png)

另一个绝佳例子是 Bob Kanefsky 的滑稽剧插曲，《上帝就在人间》。这部剧叫做《永恒之火》，撰写于 1990 年代中期；剧中描述了上帝必然是使用 Lisp 创造世界的种种原因。完整的歌词可以在 [GNU 幽默合集][3]中找到，如下是一段摘抄：

> 因为上帝用祂的 Lisp 代码

> 让树叶充满绿意。

> 分形的花儿和递归的根：

> 我见过的奇技淫巧之中没什么比这更可爱。

> 当我对着雪花深思时，

> 从未见过两片相同的，

> 我知道，上帝偏爱那一门

> 名字是四个字母的语言。

（LCTT 译注：参见 “四个字母”，参见：[四字神名](https://zh.wikipedia.org/wiki/%E5%9B%9B%E5%AD%97%E7%A5%9E%E5%90%8D)，致谢 [no1xsyzy](https://github.com/LCTT/TranslateProject/issues/11320)）

以下这句话我实在不好在人前说；不过，我还是觉得，这样一种 “Lisp 是奥术魔法”的文化模因实在是有史以来最奇异、最迷人的东西。Lisp 是象牙塔的产物，是人工智能研究的工具；因此，它对于编程界的俗人而言总是陌生的，甚至是带有神秘色彩的。然而，当今的程序员们[开始怂恿彼此，“在你死掉之前至少试一试 Lisp”][4]，就像这是一种令人恍惚入迷的致幻剂似的。尽管 Lisp 是广泛使用的编程语言中第二古老的（只比 Fortran 年轻一岁）[^1] ，程序员们也仍旧在互相怂恿。想象一下，如果你的工作是为某种组织或者团队推广一门新的编程语言的话，忽悠大家让他们相信你的新语言拥有神力难道不是绝佳的策略吗？—— 但你如何能够做到这一点呢？或者，换句话说，一门编程语言究竟是如何变成人们口中“隐晦知识的载体”的呢？

Lisp 究竟是怎么成为这样的？

![Byte 杂志封面,1979年八月。][5] 

*Byte 杂志封面，1979年八月。*

### 理论 A ：公理般的语言

Lisp 的创造者<ruby>约翰·麦卡锡<rt>John McCarthy</rt></ruby>最初并没有想过把 Lisp 做成优雅、精炼的计算法则结晶。然而，在一两次运气使然的深谋远虑和一系列优化之后，Lisp 的确变成了那样的东西。 <ruby>保罗·格雷厄姆<rt>Paul Graham</rt></ruby>（我们一会儿之后才会聊到他）曾经这么写道， 麦卡锡通过 Lisp “为编程作出的贡献就像是欧几里得对几何学所做的贡献一般” [^2]。人们可能会在 Lisp 中看出更加隐晦的含义 —— 因为麦卡锡创造 Lisp 时使用的要素实在是过于基础，基础到连弄明白他到底是创造了这门语言、还是发现了这门语言，都是一件难事。

最初， 麦卡锡产生要造一门语言的想法，是在 1956 年的<ruby>达特茅斯人工智能夏季研究项目<rt>Darthmouth Summer Research Project on Artificial Intelligence</rt></ruby>上。夏季研究项目是个持续数周的学术会议，直到现在也仍旧在举行；它是此类会议之中最早开始举办的会议之一。 麦卡锡当初还是个达特茅斯的数学助教，而“<ruby>人工智能<rt>artificial intelligence</rt></ruby>（AI）”这个词事实上就是他建议举办该会议时发明的 [^3]。在整个会议期间大概有十人参加 [^4]。他们之中包括了<ruby>艾伦·纽厄尔<rt>Allen Newell</rt></ruby>和<ruby>赫伯特·西蒙<rt>Herbert Simon</rt></ruby>，两名隶属于<ruby>兰德公司<rt>RAND Corporation</rt></ruby>和<ruby>卡内基梅隆大学<rt>Carnegie Mellon</rt></ruby>的学者。这两人不久之前设计了一门语言，叫做 IPL。

当时，纽厄尔和西蒙正试图制作一套能够在命题演算中生成证明的系统。两人意识到，用电脑的原生指令集编写这套系统会非常困难；于是他们决定创造一门语言——他们的原话是“<ruby>伪代码<rt>pseudo-code</rt></ruby>”，这样，他们就能更加轻松自然地表达这台“<ruby>逻辑理论机器<rt>Logic Theory Machine</rt></ruby>”的底层逻辑了 [^5]。这门语言叫做 IPL，即“<ruby>信息处理语言<rt>Information Processing Language</rt></ruby>”；比起我们现在认知中的编程语言，它更像是一种高层次的汇编语言方言。 纽厄尔和西蒙提到，当时人们开发的其它“伪代码”都抓着标准数学符号不放 —— 也许他们指的是 Fortran [^6]；与此不同的是，他们的语言使用成组的符号方程来表示命题演算中的语句。通常，用 IPL 写出来的程序会调用一系列的汇编语言宏，以此在这些符号方程列表中对表达式进行变换和求值。

麦卡锡认为，一门实用的编程语言应该像 Fortran 那样使用代数表达式；因此，他并不怎么喜欢 IPL [^7]。然而，他也认为，在给人工智能领域的一些问题建模时，符号列表会是非常好用的工具 —— 而且在那些涉及演绎的问题上尤其有用。麦卡锡的渴望最终被诉诸行动；他要创造一门代数的列表处理语言 —— 这门语言会像 Fortran 一样使用代数表达式，但拥有和 IPL 一样的符号列表处理能力。

当然，今日的 Lisp 可不像 Fortran。在会议之后的几年中，麦卡锡关于“理想的列表处理语言”的见解似乎在逐渐演化。到 1957 年，他的想法发生了改变。他那时候正在用 Fortran 编写一个能下国际象棋的程序；越是长时间地使用 Fortran ，麦卡锡就越确信其设计中存在不当之处，而最大的问题就是尴尬的 `IF` 声明 [^8]。为此，他发明了一个替代品，即条件表达式 `true`；这个表达式会在给定的测试通过时返回子表达式 `A` ，而在测试未通过时返回子表达式 `B` ，*而且*，它只会对返回的子表达式进行求值。在 1958 年夏天，当麦卡锡设计一个能够求导的程序时，他意识到，他发明的 `true` 条件表达式让编写递归函数这件事变得更加简单自然了 [^9]。也是这个求导问题让麦卡锡创造了 `maplist` 函数；这个函数会将其它函数作为参数并将之作用于指定列表的所有元素 [^10]。在给项数多得叫人抓狂的多项式求导时，它尤其有用。

然而，以上的所有这些，在 Fortran 中都是没有的；因此，在 1958 年的秋天，麦卡锡请来了一群学生来实现 Lisp。因为他那时已经成了一名麻省理工助教，所以，这些学生可都是麻省理工的学生。当麦卡锡和学生们最终将他的主意变为能运行的代码时，这门语言得到了进一步的简化。这之中最大的改变涉及了 Lisp 的语法本身。最初，麦卡锡在设计语言时，曾经试图加入所谓的 “M 表达式”；这是一层语法糖，能让 Lisp 的语法变得类似于 Fortran。虽然 M 表达式可以被翻译为 S 表达式 —— 基础的、“用圆括号括起来的列表”，也就是 Lisp 最著名的特征 —— 但 S 表达式事实上是一种给机器看的低阶表达方法。唯一的问题是，麦卡锡用方括号标记 M 表达式，但他的团队在麻省理工使用的 IBM 026 键盘打孔机的键盘上根本没有方括号 [^11]。于是 Lisp 团队坚定不移地使用着 S 表达式，不仅用它们表示数据列表，也拿它们来表达函数的应用。麦卡锡和他的学生们还作了另外几样改进，包括将数学符号前置；他们也修改了内存模型，这样 Lisp 实质上就只有一种数据类型了 [^12]。

到 1960 年，麦卡锡发表了他关于 Lisp 的著名论文，《用符号方程表示的递归函数及它们的机器计算》。那时候，Lisp 已经被极大地精简，而这让麦卡锡意识到，他的作品其实是“一套优雅的数学系统”，而非普通的编程语言 [^13]。他后来这么写道，对 Lisp 的许多简化使其“成了一种描述可计算函数的方式，而且它比图灵机或者一般情况下用于递归函数理论的递归定义更加简洁” [^14]。在他的论文中，他不仅使用 Lisp 作为编程语言，也将它当作一套用于研究递归函数行为方式的表达方法。

通过“从一小撮规则中逐步实现出 Lisp”的方式，麦卡锡将这门语言介绍给了他的读者。后来，保罗·格雷厄姆在短文《<ruby>[Lisp 之根][6]<rt>The Roots of Lisp</rt></ruby>》中用更易读的语言回顾了麦卡锡的步骤。格雷厄姆只用了七种原始运算符、两种函数写法，以及使用原始运算符定义的六个稍微高级一点的函数来解释 Lisp。毫无疑问，Lisp 的这种只需使用极少量的基本规则就能完整说明的特点加深了其神秘色彩。格雷厄姆称麦卡锡的论文为“使计算公理化”的一种尝试 [^15]。我认为，在思考 Lisp 的魅力从何而来时，这是一个极好的切入点。其它编程语言都有明显的人工构造痕迹，表现为 `While`，`typedef`，`public static void` 这样的关键词；而 Lisp 的设计却简直像是纯粹计算逻辑的鬼斧神工。Lisp 的这一性质，以及它和晦涩难懂的“递归函数理论”的密切关系，使它具备了获得如今声望的充分理由。

### 理论 B：属于未来的机器

Lisp 诞生二十年后，它成了著名的《<ruby>[黑客词典][7]<rt>Hacker’s Dictionary</rt></ruby>》中所说的，人工智能研究的“母语”。Lisp 在此之前传播迅速，多半是托了语法规律的福 —— 不管在怎么样的电脑上，实现 Lisp 都是一件相对简单直白的事。而学者们之后坚持使用它乃是因为 Lisp 在处理符号表达式这方面有巨大的优势；在那个时代，人工智能很大程度上就意味着符号，于是这一点就显得十分重要。在许多重要的人工智能项目中都能见到 Lisp 的身影。这些项目包括了 [SHRDLU 自然语言程序][8]、[Macsyma 代数系统][9] 和 [ACL2 逻辑系统][10]。

然而，在 1970 年代中期，人工智能研究者们的电脑算力开始不够用了。PDP-10 就是一个典型。这个型号在人工智能学界曾经极受欢迎；但面对这些用 Lisp 写的 AI 程序，它的 18 位地址空间一天比一天显得吃紧 [^16]。许多的 AI 程序在设计上可以与人互动。要让这些既极度要求硬件性能、又有互动功能的程序在分时系统上优秀发挥，是很有挑战性的。麻省理工的<ruby>彼得·杜奇<rt>Peter Deutsch</rt></ruby>给出了解决方案：那就是针对 Lisp 程序来特别设计电脑。就像是我那[关于 Chaosnet 的上一篇文章][11]所说的那样，这些<ruby>Lisp 计算机<rt>Lisp machines</rt></ruby>会给每个用户都专门分配一个为 Lisp 特别优化的处理器。到后来，考虑到硬核 Lisp 程序员的需求，这些计算机甚至还配备上了完全由 Lisp 编写的开发环境。在当时那样一个小型机时代已至尾声而微型机的繁盛尚未完全到来的尴尬时期，Lisp 计算机就是编程精英们的“高性能个人电脑”。

有那么一会儿，Lisp 计算机被当成是未来趋势。好几家公司雨后春笋般出现，追着赶着要把这项技术商业化。其中最成功的一家叫做 Symbolics，由麻省理工 AI 实验室的前成员创立。上世纪八十年代，这家公司生产了所谓的 3600 系列计算机，它们当时在 AI 领域和需要高性能计算的产业中应用极广。3600 系列配备了大屏幕、位图显示、鼠标接口，以及[强大的图形与动画软件][12]。它们都是惊人的机器，能让惊人的程序运行起来。例如，之前在推特上跟我聊过的机器人研究者 Bob Culley，就能用一台 1985 年生产的 Symbolics 3650 写出带有图形演示的寻路算法。他向我解释说，在 1980 年代，位图显示和面向对象编程（能够通过 [Flavors 扩展][13]在 Lisp 计算机上使用）都刚刚出现。Symbolics 站在时代的最前沿。

![Bob Culley 的寻路程序。][14]

*Bob Culley 的寻路程序。*

而以上这一切导致 Symbolics 的计算机奇贵无比。在 1983 年，一台 Symbolics 3600 能卖 111,000 美金 [^16]。所以，绝大部分人只可能远远地赞叹 Lisp 计算机的威力和操作员们用 Lisp 编写程序的奇妙技术。不止他们赞叹，从 1979 年到 1980 年代末，Byte 杂志曾经多次提到过 Lisp 和 Lisp 计算机。在 1979 年八月发行的、关于 Lisp 的一期特别杂志中，杂志编辑激情洋溢地写道，麻省理工正在开发的计算机配备了“大坨大坨的内存”和“先进的操作系统” [^17]；他觉得，这些 Lisp 计算机的前途是如此光明，以至于它们的面世会让 1978 和 1977 年 —— 诞生了 Apple II、Commodore PET 和 TRS-80 的两年 —— 显得黯淡无光。五年之后，在 1985 年，一名 Byte 杂志撰稿人描述了为“复杂精巧、性能强悍的 Symbolics 3670”编写 Lisp 程序的体验，并力劝读者学习 Lisp，称其为“绝大数人工智能工作者的语言选择”，和将来的通用编程语言 [^18]。

我问过<ruby>保罗·麦克琼斯<rt>Paul McJones</rt></ruby>（他在<ruby>山景城<rt>Mountain View<rt></ruby>的<ruby>计算机历史博物馆<rt>Computer History Museum</rt></ruby>做了许多 Lisp 的[保护工作][15]），人们是什么时候开始将 Lisp 当作高维生物的赠礼一样谈论的呢？他说，这门语言自有的性质毋庸置疑地促进了这种现象的产生；然而，他也说，Lisp 上世纪六七十年代在人工智能领域得到的广泛应用，很有可能也起到了作用。当 1980 年代到来、Lisp 计算机进入市场时，象牙塔外的某些人由此接触到了 Lisp 的能力，于是传说开始滋生。时至今日，很少有人还记得 Lisp 计算机和 Symbolics 公司；但 Lisp 得以在八十年代一直保持神秘，很大程度上要归功于它们。 

### 理论 C：学习编程

1985 年，两位麻省理工的教授，<ruby>哈尔·阿伯尔森<rt>Harold "Hal" Abelson</rt></ruby>和<ruby>杰拉尔德·瑟斯曼<rt>Gerald Sussman</rt></ruby>，外加瑟斯曼的妻子<ruby>朱莉·瑟斯曼<rt>Julie Sussman</rt></ruby>，出版了一本叫做《<ruby>计算机程序的构造和解释<rt>Structure and Interpretation of Computer Programs</rt></ruby>》的教科书。这本书用 Scheme（一种 Lisp 方言）向读者们示范了如何编程。它被用于教授麻省理工入门编程课程长达二十年之久。出于直觉，我认为 SICP（这本书的名字通常缩写为 SICP）倍增了 Lisp 的“神秘要素”。SICP 使用 Lisp 描绘了深邃得几乎可以称之为哲学的编程理念。这些理念非常普适，可以用任意一种编程语言展现；但 SICP 的作者们选择了 Lisp。结果，这本阴阳怪气、卓越不凡、吸引了好几代程序员（还成了一种[奇特的模因][16]）的著作臭名远扬之后，Lisp 的声望也顺带被提升了。Lisp 已不仅仅是一如既往的“麦卡锡的优雅表达方式”；它现在还成了“向你传授编程的不传之秘的语言”。

SICP 究竟有多奇怪这一点值得好好说；因为我认为，时至今日，这本书的古怪之处和 Lisp 的古怪之处是相辅相成的。书的封面就透着一股古怪。那上面画着一位朝着桌子走去，准备要施法的巫师或者炼金术士。他的一只手里抓着一副测径仪 —— 或者圆规，另一只手上拿着个球，上书“eval”和“apply”。他对面的女人指着桌子；在背景中，希腊字母 λ （lambda）漂浮在半空，释放出光芒。

![SICP 封面上的画作][17] 

*SICP 封面上的画作。*

说真的，这上面画的究竟是怎么一回事？为什么桌子会长着动物的腿？为什么这个女人指着桌子？墨水瓶又是干什么用的？我们是不是该说，这位巫师已经破译了宇宙的隐藏奥秘，而所有这些奥秘就蕴含在 eval/apply 循环和 Lambda 演算之中？看似就是如此。单单是这张图片，就一定对人们如今谈论 Lisp 的方式产生了难以计量的影响。

然而，这本书的内容通常并不比封面正常多少。SICP 跟你读过的所有计算机科学教科书都不同。在引言中，作者们表示，这本书不只教你怎么用 Lisp 编程 —— 它是关于“现象的三个焦点：人的心智、复数的计算机程序，和计算机”的作品 [^19]。在之后，他们对此进行了解释，描述了他们对如下观点的坚信：编程不该被当作是一种计算机科学的训练，而应该是“<ruby>程序性认识论<rt>procedural epistemology</rt></ruby>”的一种新表达方式 [^20]。程序是将那些偶然被送入计算机的思想组织起来的全新方法。这本书的第一章简明地介绍了 Lisp，但是之后的绝大部分都在讲述更加抽象的概念。其中包括了对不同编程范式的讨论，对于面向对象系统中“时间”和“一致性”的讨论；在书中的某一处，还有关于通信的基本限制可能会如何带来同步问题的讨论 —— 而这些基本限制在通信中就像是光速不变在相对论中一样关键 [^21]。都是些高深难懂的东西。

以上这些并不是说这是本糟糕的书；这本书其实棒极了。在我读过的所有作品中，这本书对于重要的编程理念的讨论是最为深刻的；那些理念我琢磨了很久，却一直无力用文字去表达。一本入门编程教科书能如此迅速地开始描述面向对象编程的根本缺陷，和函数式语言“将可变状态降到最少”的优点，实在是一件让人印象深刻的事。而这种描述之后变为了另一种震撼人心的讨论：某种（可能类似于今日的 [RxJS][18] 的）流范式能如何同时具备两者的优秀特性。SICP 用和当初麦卡锡的 Lisp 论文相似的方式提纯出了高级程序设计的精华。你读完这本书之后，会立即想要将它推荐给你的程序员朋友们；如果他们找到这本书，看到了封面，但最终没有阅读的话，他们就只会记住长着动物腿的桌子上方那神秘的、根本的、给予魔法师特殊能力的、写着 eval/apply 的东西。话说回来，书上这两人的鞋子也让我印象颇深。

然而，SICP 最重要的影响恐怕是，它将 Lisp 由一门怪语言提升成了必要的教学工具。在 SICP 面世之前，人们互相推荐 Lisp，以学习这门语言为提升编程技巧的途径。1979 年的 Byte 杂志 Lisp 特刊印证了这一事实。之前提到的那位编辑不仅就麻省理工的新 Lisp 计算机大书特书，还说，Lisp 这门语言值得一学，因为它“代表了分析问题的另一种视角” [^22]。但 SICP 并未只把 Lisp 作为其它语言的陪衬来使用；SICP 将其作为*入门*语言。这就暗含了一种论点，那就是，Lisp 是最能把握计算机编程基础的语言。可以认为，如今的程序员们彼此怂恿“在死掉之前至少试试 Lisp”的时候，他们很大程度上是因为 SICP 才这么说的。毕竟，编程语言 [Brainfuck][19] 想必同样也提供了“分析问题的另一种视角”；但人们学习 Lisp 而非学习 Brainfuck，那是因为他们知道，前者的那种 Lisp 视角在二十年中都被看作是极其有用的，有用到麻省理工在给他们的本科生教其它语言之前，必然会先教 Lisp。

### Lisp 的回归

在 SICP 出版的同一年，<ruby>本贾尼·斯特劳斯特卢普<rt>Bjarne Stroustrup</rt></ruby>发布了 C++ 语言的首个版本，它将面向对象编程带到了大众面前。几年之后，Lisp 计算机的市场崩盘，AI 寒冬开始了。在下一个十年的变革中， C++ 和后来的 Java 成了前途无量的语言，而 Lisp 被冷落，无人问津。

理所当然地，确定人们对 Lisp 重新燃起热情的具体时间并不可能；但这多半是保罗·格雷厄姆发表他那几篇声称 Lisp 是首选入门语言的短文之后的事了。保罗·格雷厄姆是 Y-Combinator 的联合创始人和《Hacker News》的创始者，他这几篇短文有很大的影响力。例如，在短文《<ruby>[胜于平庸][20]<rt>Beating the Averages</rt></ruby>》中，他声称 Lisp 宏使 Lisp 比其它语言更强。他说，因为他在自己创办的公司 Viaweb 中使用 Lisp，他得以比竞争对手更快地推出新功能。至少，[一部分程序员][21]被说服了。然而，庞大的主流程序员群体并未换用 Lisp。

实际上出现的情况是，Lisp 并未流行，但越来越多 Lisp 式的特性被加入到广受欢迎的语言中。Python 有了列表推导式。C# 有了 Linq。Ruby……嗯，[Ruby 是 Lisp 的一种][22]。就如格雷厄姆之前在 2001 年提到的那样，“在一系列常用语言中所体现出的‘默认语言’正越发朝着 Lisp 的方向演化” [^23]。尽管其它语言变得越来越像 Lisp，Lisp 本身仍然保留了其作为“很少人了解但是大家都该学的神秘语言”的特殊声望。在 1980 年，Lisp 的诞生二十周年纪念日上，麦卡锡写道，Lisp 之所以能够存活这么久，是因为它具备“编程语言领域中的某种近似局部最优” [^24]。这句话并未充分地表明 Lisp 的真正影响力。Lisp 能够存活超过半个世纪之久，并非因为程序员们一年年地勉强承认它就是最好的编程工具；事实上，即使绝大多数程序员根本不用它，它还是存活了下来。多亏了它的起源和它的人工智能研究用途，说不定还要多亏 SICP 的遗产，Lisp 一直都那么让人着迷。在我们能够想象上帝用其它新的编程语言创造世界之前，Lisp 都不会走下神坛。

--------------------------------------------------------------------------------

[^1]: John McCarthy, “History of Lisp”, 14, Stanford University, February 12, 1979, accessed October 14, 2018, http://jmc.stanford.edu/articles/lisp/lisp.pdf

[^2]: Paul Graham, “The Roots of Lisp”, 1, January 18, 2002, accessed October 14, 2018, http://languagelog.ldc.upenn.edu/myl/llog/jmc.pdf. 

[^3]: Martin Childs, “John McCarthy: Computer scientist known as the father of AI”, The Independent, November 1, 2011, accessed on October 14, 2018, https://www.independent.co.uk/news/obituaries/john-mccarthy-computer-scientist-known-as-the-father-of-ai-6255307.html. 

[^4]: Lisp Bulletin History. http://www.artinfo-musinfo.org/scans/lb/lb3f.pdf 

[^5]: Allen Newell and Herbert Simon, “Current Developments in Complex Information Processing,” 19, May 1, 1956, accessed on October 14, 2018, http://bitsavers.org/pdf/rand/ipl/P-850_Current_Developments_In_Complex_Information_Processing_May56.pdf. 

[^6]: ibid. 

[^7]: Herbert Stoyan, “Lisp History”, 43, Lisp Bulletin #3, December 1979, accessed on October 14, 2018, http://www.artinfo-musinfo.org/scans/lb/lb3f.pdf 

[^8]: McCarthy, “History of Lisp”, 5. 

[^9]: ibid. 

[^10]: McCarthy “History of Lisp”, 6. 

[^11]: Stoyan, “Lisp History”, 45 

[^12]: McCarthy, “History of Lisp”, 8. 

[^13]: McCarthy, “History of Lisp”, 2. 

[^14]: McCarthy, “History of Lisp”, 8. 

[^15]: Graham, “The Roots of Lisp”, 11. 

[^16]: Guy Steele and Richard Gabriel, “The Evolution of Lisp”, 22, History of Programming Languages 2, 1993, accessed on October 14, 2018, http://www.dreamsongs.com/Files/HOPL2-Uncut.pdf.  2

[^17]: Carl Helmers, “Editorial”, Byte Magazine, 154, August 1979, accessed on October 14, 2018, https://archive.org/details/byte-magazine-1979-08/page/n153. 

[^18]: Patrick Winston, “The Lisp Revolution”, 209, April 1985, accessed on October 14, 2018, https://archive.org/details/byte-magazine-1985-04/page/n207. 

[^19]: Harold Abelson, Gerald Jay. Sussman, and Julie Sussman, Structure and Interpretation of Computer Programs (Cambridge, Mass: MIT Press, 2010), xiii. 

[^20]: Abelson, xxiii. 

[^21]: Abelson, 428. 

[^22]: Helmers, 7. 

[^23]: Paul Graham, “What Made Lisp Different”, December 2001, accessed on October 14, 2018, http://www.paulgraham.com/diff.html. 

[^24]: John McCarthy, “Lisp—Notes on its past and future”, 3, Stanford University, 1980, accessed on October 14, 2018, http://jmc.stanford.edu/articles/lisp20th/lisp20th.pdf. 

via: https://twobithistory.org/2018/10/14/lisp.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[Northurland](https://github.com/Northurland)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://xkcd.com/224/
[2]: https://xkcd.com/297/
[3]: https://www.gnu.org/fun/jokes/eternal-flame.en.html
[4]: https://www.reddit.com/r/ProgrammerHumor/comments/5c14o6/xkcd_lisp/d9szjnc/
[5]: https://twobithistory.org/images/byte_lisp.jpg
[6]: http://languagelog.ldc.upenn.edu/myl/llog/jmc.pdf
[7]: https://en.wikipedia.org/wiki/Jargon_File
[8]: https://hci.stanford.edu/winograd/shrdlu/
[9]: https://en.wikipedia.org/wiki/Macsyma
[10]: https://en.wikipedia.org/wiki/ACL2
[11]: https://twobithistory.org/2018/09/30/chaosnet.html
[12]: https://youtu.be/gV5obrYaogU?t=201
[13]: https://en.wikipedia.org/wiki/Flavors_(programming_language)
[14]: https://twobithistory.org/images/symbolics.jpg
[15]: http://www.softwarepreservation.org/projects/LISP/
[16]: https://knowyourmeme.com/forums/meme-research/topics/47038-structure-and-interpretation-of-computer-programs-hugeass-image-dump-for-evidence
[17]: https://twobithistory.org/images/sicp.jpg
[18]: https://rxjs-dev.firebaseapp.com/
[19]: https://en.wikipedia.org/wiki/Brainfuck
[20]: http://www.paulgraham.com/avg.html
[21]: https://web.archive.org/web/20061004035628/http://wiki.alu.org/Chris-Perkins
[22]: http://www.randomhacks.net/2005/12/03/why-ruby-is-an-acceptable-lisp/
