[#]: collector: (lujun9972)
[#]: translator: (bestony)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (lawyer The MIT License, Line by Line)
[#]: via: (https://writing.kemitchell.com/2016/09/21/MIT-License-Line-by-Line.html)
[#]: author: (Kyle E. Mitchell https://kemitchell.com/)

逐行解读 MIT 许可证
======

[MIT 许可证][1] 是世界上最流行的开源软件许可证。以下是它的逐行解读。

#### 阅读协议

如果你涉及到开源软件，并且没有花时间从头到尾的阅读整个许可证（它只有 171 个单词），你现在就需要这样去做。尤其是当许可证不是你日常的工作内容时。把任何看起来不对劲或不清楚的地方记下来，然后继续阅读。我会把每一个单词再重复一遍，并按顺序分块，加入上下文和注释。但最重要的还是要牢记整体。

> The MIT License (MIT)
>
> Copyright (c) <year> <copyright holders>
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
> The Software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the Software.

许可证可以分为五段，按照逻辑划分如下：

  * **头部**
    * **许可证标题** : “MIT 许可证”
    * **版权说明** : “Copyright (c) …”
  * **许可证授权** : “特此批准 …”
    * **授权范围** : “… 处理软件 …”
    * **条件** : “… 服从了 …”
      * **归属和通知** : “上述 … 应当被包含在内 …”
      * **免责声明** : “软件按照“原状”提供 …”
      * **责任限制** : “在任何情况下 …”


接下来详细看看

#### 头部

##### 许可证头部

> The MIT License (MIT)

“MIT 许可证“不是单一的许可证，而是一系列从麻省理工学院为将要发布的语言准备的许可证衍生的许可证。多年来，无论是对于使用它的原始项目，还是作为其他项目的模型，他都经历了许多变化。Fedora 项目维护了一个纯文本的[麻省理工学院许可证其他版本]的页面，如同泡在甲醛中的解剖标本一般，平淡的追溯了无序的演变。

幸运的是，[OSI（开放源码倡议）][3] 和 [Software Package Data eXchange（软件数据包交换）]团体已经将一种通用的 MIT 式的许可证形式标准化为”MIT 许可证“。而 OSI 则采用了 SPDX 标准化的[字符串标志符][5]，并将其中的 ”MIT“ 明确的指向标准化形式的”MIT 许可证“

即使你在 “LICENSE” 文件中包含 “MIT 许可证”或 “SPDX:MIT“ ,任何负责的审查员仍会将文本与标准格式进行比较，以确保安全。尽管自称为“MIT 许可证”的各种许可证形式只在细微的细节上有所不同，但“MIT 许可证”的松散性吸引了一些作者加入麻烦的“定制”。典型的糟糕、不好的例子是[JSON 许可证][6]，一个 MIT 家族的许可证被加上了“这个软件应该被应用于好的，而不是恶的”。这件事情可能是“非常克罗克福特”的（译者注，JSON 格式和 JSON.org 的作者）。这绝对是一件麻烦事，也许这个笑话应该只是在律师身上，但它一直延伸到银行业。

这个故事的寓意是：“MIT 许可证”本身就是模棱两可的。大家可能很清楚你的意思，但你只需要把标准的 MIT 许可证文本复制到你的项目中，就可以节省每个人的时间。如果使用元数据（如包管理器中的元数据文件）来制定 “MIT 许可证”，请确保 “LICENSE” 文件和任何头部的注释都适用标准的许可证文本。所有的这些都可以[自动化完成][7]。


##### 版权说明

> Copyright (c) <year> <copyright holders>


在 1976 年《版权法》颁布之前，美国的版权法要求采取具体的行动，即所谓的“手续”来确保创意作品的版权。如果你不遵守这些手续，你起诉他人未经授权使用你的作品的权力就会受到限制，往往完全丧失权力，其中一项手续就是 "通知"。在你的作品上打上记号，以其他方式让市场知道你拥有版权 ©是一个标准符号，用于标记受版权保护的作品，以发出版权通知。ASCII 字符集没有©符号，但`Copyright (c)`可以表达同样的意思。

1976 年的版权法“执行”了国际《伯尔尼公约》的许多要求， 取消了确保版权的手续。至少在美国，著作权人在起诉侵权之前，仍然需要对自己的版权作品进行登记，如果在侵权行为开始之前进行登记，可能会获得更高的赔偿。但在实践中，很多人在对某个人提起诉讼之前，都会先注册版权。你并不会因为没有在上面贴上告示、注册、向国会图书馆寄送副本等而失去版权。

即使版权声明不像过去那样绝对必要，但它们仍然有很多用处。说明作品的创作年份和版权属于谁，可以让人知道作品的版权何时到期，从而使作品进入公共领域。作者或作者们的身份也很有用。美国法律对个人作者和"公司"作者的版权条款的计算方式不同。特别是在商业用途中，公司在使用已知竞争对手的软件时，可能也要三思而行，即使许可条款给予了非常慷慨的许可。如果你希望别人看到你的作品并想从你这里获得许可，版权声明可以很好地起到归属作用。

至于"版权持有人"。并非所有标准形式的许可证都有写明这一点的空间。最新的许可证形式，如[Apache 2.0][8]和[GPL 3.0][9]，公布了 "LICENSE" 文本，这些文本是要逐字复制的，并在其他地方加上标题注释和单独的文件，以表明谁拥有版权和给予许可证。这些办法巧妙地阻止了对 "标准"文本的意外或故意的修改。这还使自动许可证识别更加可靠。

麻省理工学院的许可证是从为机构发布代码而写的语言演变而来。对于机构发布的代码，只有一个明确的 "版权持有人"，即发布代码的机构。其他机构则抄袭了这些许可证，用他们自己的名字代替 "MIT"，最终形成了我们现在的通用形式。这一过程同样适用于该时代的其他简短机构许可证，特别是加州大学伯克利分校的[最初的四条款 BSD 许可证][10]，现在用于[三条款][11]和[两条款][12]变体，以及麻省理工学院的变体 — 互联网系统联盟的[ISC 许可证][13]。

在每一种情况下，该机构都根据版权所有权规则将自己列为版权持有人，这些规则称为“[雇佣作品][14]”规则，这些规则赋予雇主和客户对其雇员和承包商代表其从事的某些工作的版权所有权。这些规则通常不适用于自愿提交代码的分布式协作者。这给项目统筹型基金会（如 Apache 基金会和 Eclipse 基金会）带来了一个问题，它们接受来自更多不同贡献者的贡献。到目前为止，通常的基础方法是使用一个房产型许可证，它规定了一个版权持有者，如[Apache 2.0][8] 和 [EPL 1.0][15] — 并由贡献者许可协议 [Apache CLAs][16] 以及 [Eclipse CLAs][17] 支持，以从贡献者中收集权利。在像 GPL 这样的 "copyleft" 许可证下，将版权所有权收集在一个地方就更加重要了，因为 GPL 依靠版权所有者来执行许可证条件，以促进软件自由的价值。

如今，没有任何机构或业务统筹的大量项目都使用 MIT 风格的许可条款。 SPDX 和 OSI 通过标准化不涉及特定实体或机构版权持有人的 MIT 和 ISC 之类的许可证形式，为这些用例提供了帮助。有了这些许可证，项目作者的普遍做法是在许可证的版权声明中很早就填上自己的名字...也许还会在这里和那里填上年份。至少根据美国的版权法，由此产生的版权通知并不能说明全部情况。

某个软件的原始所有者保留其工作的所有权。但是，尽管 MIT 风格的许可条款赋予了他人开发和更改软件的权利，创造了法律所谓的“衍生作品”，但它们并没有赋予原始作者他人的贡献的所有权。相反，每个贡献者都以他们使用现有代码为起点进行的任何[甚至是少量创造][18]的作品来拥有版权。

这些项目中的大多数也对获得贡献者许可协议的想法犹豫不决，更不用说签署的版权转让了。这既幼稚又可以理解。尽管一些较新的开源开发人员假设在 GitHub 上发送 Pull Request “自动”根据项目现有许可证的条款授权分发贡献，但美国法律不承认任何此类规则。默认而强大的版本保护是不允许许可的。

更新：GitHub 后来修改了全站的服务条款，包括试图改变这一默认值，至少在 GitHub.com 上是这样。我在[另一篇][19]中写了一些对这一发展的并非都是正面的看法。

为了填补法律上有效的、有据可查的贡献权利授予与完全没有文件线索之间的差距，一些项目采用了[开发者原创证书][20]，这是贡献者在 Git 提交中使用 "Signed-Off-By" 元数据标签暗示的标准声明。 开发人员原创证书是在臭名昭著的 SCO 诉讼之后，为 Linux 内核开发而开发的，该诉讼称 Linux 的大部分代码源自 SCO 拥有的 Unix 作为来源。作为创建显示 Linux 的每一行都来自贡献者的书面记录的一种方法，开发人员原创证书功能很好。尽管开发人员原产地证书不是许可证，但它确实提供了许多充分的证据，表明提交代码的人希望项目分发其代码，并让其他人根据内核现有的许可证条款使用该代码。内核还维护着一个机器可读的 “CREDITS” 文件，列出了具有名称，隶属关系，贡献区域和其他元数据的贡献者。我已经做了[一些][21][实验][22]针对不使用内核开发流程的项目进行了调整。

#### 许可证授权

> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”),

MIT 许可证的实质是许可证（你猜对了）。一般来说，许可证是一个人或法律实体"许可人"给予另一个人"被许可人"做一些法律允许他们起诉的事情的许可。MIT 许可证是一种不起诉的承诺。

法律有时将许可证与给予许可证的承诺区分开来。如果有人违背了提供许可证的承诺，你可以起诉他们违背了承诺，但你最终可能得不到许可证。“特此”是律师们永远摆脱不了的一个老生常谈的词。这里使用它来显示许可证文本本身提供了许可证，而不仅仅是许可证的承诺。这是合法的[IIFE][23]。

尽管许多许可证都授予特定的命名许可证持有人许可，但 MIT 许可证是“公共许可证”。 公共许可证授予所有人（包括整个公众）许可。 这是开源许可中的三大创意之一。 MIT 许可证通过“向任何获得……软件副本的人”授予许可证来体现这一思想。 稍后我们将看到，获得此许可证还有一个条件，即确保其他人也可以了解他们的许可。

在美国式法律文件中，带引号大写的附加语（定义）是赋予术语特定含义的标准方式。当法院看到文件中其他地方使用了一个已定义的大写术语时，法院将可靠地回顾定义中的术语。

##### 授权范围

> to deal in the Software without restriction,

从被许可人的角度来看，这是 MIT 许可证中最重要的七个字。关键的法律问题是被起诉侵犯版权和被起诉侵犯专利。无论是版权法还是专利法都没有将 "to deal in" 作为一个术语，它在法庭上没有特定的含义。因此，任何法院在裁决许可人和被许可人之间的纠纷时，都会问双方对这种语言的含义和理解。法院将看到的是，该措辞有意宽泛和开放。它使被许可人强烈反对许可人的任何主张，即他们没有许可被许可人使用该软件做特定的事情，即使在授予许可时双方都没有明显想到。

> including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,

任何一篇法律文章都不是完美的，“意义上完全确定”或明确无误的。小心那些装作不一样的人。这是 MIT 许可证中最不完美的部分。主要有三个问题：

首先，“包括但不限于”是一种法律反模式。它有多种衍生：

  * 包括但不限于

  * 包括但不限于前述条文的一般性

  * 包括但不限于

  * 很多，很多毫无意义的变化

所有这些都有一个共同的目标，但都未能可靠地实现。从根本上说，使用它们的起草者也会尽量试探着去做。在MIT许可证中，这意味着引入“软件交易”的具体例子 — “使用、复制、修改”等等，但不意味着被许可方的行为必须与给出的例子类似，才能算作“交易”。问题是，如果你最终需要法庭来审查和解释许可证的条款，法庭将把它的工作看作是找出这些语言的含义。如果法院需要决定“交易”的含义，它不能“看不到”这些例子，即使你告诉它。我认为“不受限制的软件交易”本身对被许可方更好，也更短。

其次，作为 “deal in” 例子的动词是一个大杂烩。有些在版权法或专利法下有特定的含义，有些几乎有或根本没有：


  * 使用出现在 [美国法典第 35 篇, 第 271(a)节][24], 专利法列出了专利权人可以在未经许可的情况下起诉他人的行为。

  * 拷贝出现在 [美国法典第 17 篇, 第 106 节][25], 版权法列出了版权所有人可以在未经许可的情况下起诉他人的行为。

  * 修改既不出现在版权法中，也不出现在专利法中。它可能最接近版权法下的“准备衍生作品”，但也可能涉及改进或其他衍生发明。

  * 无论是在版权法还是专利法中，合并都没有出现。“合并”在版权方面有特定的含义，但这显然不是本文的意图。相反，法院可能会根据其在行业中的含义来解读“合并”，如“合并法典”。

  * 无论是在版权法还是专利法中，都没有公布。由于“软件”是正在出版的东西，根据[版权法][25]，它可能最接近于“发行”。该法令还包括“公开”表演和展示作品的权利，但这些权利只适用于特定类型的受版权保护的作品，如戏剧、录音和电影。

  * 分发出现在[版权法][25]中。

  * 分许可是知识产权法的总称。再许可权是指授予他人自己的许可，进行您所许可的部分或全部活动的权利。实际上，MIT 许可证的分许可证权利实际上在开放源代码许可证中并不常见。希瑟·米克（Heather Meeker）所说的规范是“直接许可”方法，在这种方法中，每个获得该软件及其许可条款副本的人都直接从所有者那里获得许可。任何可能根据 MIT 许可证获得分许可证的人都可能会得到一份许可证副本，告诉他们他们也有直接许可证。


  * 卖书是个混血儿。它接近于[专利法][24]中的“要约出售”和“出售”，但指的是“复制品”，一种版权概念。在版权方面，它似乎接近于“分发”，但[版权法][25]没有提到销售。

  * 允许向其提供软件的人员这样做似乎是多余的“分许可”。这也是不必要的，因为获得拷贝的人也可以直接获得许可证。

最后，由于这种法律、行业、一般知识产权和一般使用条款的混杂，并不清楚《麻省理工学院许可证》是否包括专利许可。一般性语言 "交易 "和一些例子动词，尤其是 "使用"，都指向了尽管是一个非常不明确的许可的专利许可。许可证来自于版权人，而版权人可能对软件中的发明拥有或不拥有专利权，以及大多数的例子动词和 "软件" 本身的定义，都强烈地指向版权许可证。诸如[Apache 2.0][8]之类的较新的开放源代码许可分别特别地处理了版权，专利甚至商标。

##### 三个许可条件

> subject to the following conditions:

总有一个陷阱！麻省理工有三个！

如果你不遵守麻省理工学院许可证的条件，你就得不到许可证提供的许可。因此，如果不按照条件所说的去做，至少在理论上会让你面临一场诉讼，很可能是一场版权诉讼。

开源软件的第二个好主意是，利用软件对被许可人的价值来激发对条件的遵守，即使被许可人不为许可支付任何费用。 最后一个想法，在《麻省理工学院许可证》中没有，它建立在许可证条件之上。像[GNU 通用公共许可证][9]这样的 "Copyleft "许可证，使用许可证条件来控制那些进行修改的人如何对其修改后的版本进行许可和发布。

##### 通知条件

> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

如果你给别人一份软件的副本，你需要包括许可证文本和任何版权声明。这有几个关键目的。

  1. 给别人一个通知，说明他们在公共许可证下对软件有许可。这是直接授权模式的一个关键部分，在这种模式下，每个用户都能直接从版权持有人那里获得授权。

  2. 让人们知道谁是软件的幕后推手，这样他们就可以得到赞美、荣耀和冷冰冰的现金捐赠。

  3. 确保保修免责声明和责任限制（下一步）跟在软件后面。每一个得到副本的人也应该得到一份这些许可人保护的副本。


没有任何东西可以阻止你为提供一个没有源代码的副本，甚至是编译形式的副本而收费。但是当你这么做的时候，你不能假装 MIT 代码是你自己的专有代码，或者是在其他许可下提供的。获得“公共许可证”的人可以了解他们在“公共许可证”下的权利。

坦率地说，遵守这个条件是崩溃的。几乎所有的开源许可证都有这样的"归属"条件。系统和装机软件的制作者往往明白，他们需要为自己的每一个发行版本编制一个通知文件或 "许可证信息 "屏幕，并附上库和组件的许可证文本副本。项目统筹基金会在教授这些做法方面起到了重要作用。但是网络开发者作为一个整体，还没有得到备忘录。这不能用缺乏工具来解释，工具有很多，也不能用 npm 和其他资源库中的包的高度模块化来解释，它们统一了许可证信息的元数据格式。所有好的 JavaScript minifiers 都有命令行标志来保存许可证头注释。其他工具会从包树中连接`LICENSE`文件。这实在是无可厚非。

##### 免责声明

> The Software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement.

美国几乎每个州都颁布了统一商业法典的版本，该法典是规范商业交易的法律范本。 UCC 的第2条（加利福尼亚州的“第2分部”）规定了商品销售合同，从批量购买的二手车到大批工业化学品再到制造厂。

UCC 关于销售合同的某些规则是强制性的。 这些规则始终适用，无论买卖双方是否喜欢。 其他只是“默认值”。 除非买卖双方以书面形式选择退出，否则 UCC 表示他们希望在 UCC 文本中找到交易的基准规则。 默认规则中包括隐含的“保证”，或卖方对买方关于所售商品的质量和可用性的承诺。

关于诸如 MIT 许可证之类的公共许可证是合同（许可方和被许可方之间的可执行协议）还是仅仅是许可，这在理论上存在很大争议，这是一种方式，但可能附带条件。 关于软件是否被视为“商品”，从而触发了 UCC 的规则，争论较少。 许可人之间没有就赔偿责任进行辩论：如果他们免费提供的软件可以免费休息，造成问题，无法正常工作或以其他方式引起麻烦，那么他们就不会被起诉要求巨额赔偿。 这与“默示保证”的三个默认规则完全相反：

  1. [UCC 第2-314节][26]所隐含的“可商购性”保证是对“商品”（即软件）的质量至少为平均水平，并经过适当包装和标记，并符合其常规用途， 意在服务。 仅当提供该软件的人是该软件的“商人”时，此保证才适用，这意味着他们从事软件交易并表现出对软件的熟练程度。

  2. 当卖方知道买方依靠他们提供用于特定目的的货物时，[UCC第 2-315节][27]中的“针对特定目的的适用性”的隐含担保即刻生效。 为此，商品实际上需要“适合”。

  3. 隐含的“非侵权”保证不是 UCC 的一部分，而是一般合同法的共同特征。 如果事实证明买方收到的商品侵犯了他人的知识产权，则该隐含的承诺将保护买方。 如果根据MIT许可获得的软件实际上并不属于尝试许可该软件的软件，或者属于他人拥有的专利，那就属于这种情况。


UCC 的[第2-316（3）节][28]要求，出于明显的目的，选择退出或“排除”隐含的适销性和适用性的默示保证。 反过来，“显眼”是指书写或格式化以引起人们的注意，这与微观精细印刷的反义词相反，意在溜过粗心的消费者。 州法律可能会对不侵权免责声明施加类似的引人注目的要求。

长期以来，律师们都有一种错觉，认为用 "全大写 "写任何东西都符合明显的要求。这是不正确的。法院曾批评律师协会自以为是，而且大多数人都认为，全大写更多的是阻止阅读，而不是强制阅读。同样的，大多数开源许可表格都将其担保免责声明设置为全大写，部分原因是这是在纯文本的 `LICENSE` 文件中唯一明显的方式。我更喜欢使用星号或其他 ASCII 艺术，但那是很久很久以前的事了。

##### 责任限制

> In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the Software or the use or other dealings in the Software.

麻省理工学院许可证允许 "免费 "使用软件，但法律并不认为接受免费许可证的人在出错时放弃了起诉的权利，而要责怪许可人。"责任限制"，通常与 "损害赔偿排除条款 "搭配使用，其作用与许可证很像，是不起诉的承诺。但这些都是保护许可人免受被许可人起诉的保护措施。

一般来说，法院对责任限制和损害赔偿排除条款的解读非常谨慎，因为这些条款可以将大量的风险从一方转移到另一方。为了保护社会的重大利益，让人们有办法在法庭上纠正错误，他们 "严格解释 "限制责任的语言，在可能的情况下对受其保护的一方进行解读。责任限制必须具体才能成立。特别是在 "消费者 "合同和其他放弃起诉权的人缺乏复杂性或讨价还价能力的情况下，法院有时会拒绝尊重那些似乎被埋没在视线之外的语言。部分是出于这个原因，部分是出于习惯，律师们往往也会给责任限制以全称处理。

再往下看，"责任限制 "部分是对被许可人可以起诉的金额的上限。在开源许可证中，这个上限总是没有钱，0元，"不负责任"。相比之下，在商业许可证中，它通常是过去 12 个月内支付的许可证费用的倍数，尽管它通常是经过谈判的。

“排除”部分具体列出了各种法律主张，即请求赔偿的理由，许可人无法使用。 像许多其他法律形式一样，MIT 许可证 提到了“违反合同”的行为（即违反合同）和“侵权”的行为。 侵权规则是防止粗心或恶意伤害他人的一般规则。 如果您在发短信时在路上撞人，则表示您犯了侵权行为。 如果您的公司销售的有问题的耳机会烧伤人们的耳朵，则说明您的公司已经侵权。 如果合同没有明确排除侵权索赔，那么法院有时会在合同中使用排除语言，以仅阻止合同索赔。 出于很好的考虑， MIT 许可证抛出“或其他”字样，只是为了抓住奇怪的海事法或其他奇特的法律主张。

“产生于、来自或与之相关”这句话是法律起草人固有的、焦虑的不安全感的反复出现的症状。关键是，任何与软件有关的诉讼都包含在限制和排除范围内。在偶然的情况下，有些东西可以“产生”，但不能“产生”，或者“与之相关”，把这三者都放在形式上感觉更好，所以把它们打包。更不用说，任何法院被迫在表格的这一部分分头讨论的问题，都必须对每一个问题给出不同的含义，前提是专业的起草者不会在一行中使用不同的词来表示同一件事。更不用说，在实践中，如果法院对一开始不受欢迎的限制感觉不好，那么他们将更愿意狭隘地解读范围触发器。但我离题了。同样的语言出现在数以百万计的合同中。

#### 总结

所有这些诡辩都有点像在进教堂的路上吐口香糖。MIT 许可证是一个法律经典且有效。 它绝不是所有软件 IP 弊病的灵丹妙药，尤其是它早在几十年前就已经出现的软件专利灾难。但麻省理工学院风格的许可证发挥了令人钦佩的作用，实现了一个狭隘的目的，用最少的谨慎的法律工具组合扭转了版权、销售和合同法等棘手的默认规则。在计算的大背景下，它的寿命是惊人的。麻省理工学院的许可证已经和将要超过绝大多数的软件许可证。我们只能猜测，当它最终失宠时，它将提供多少年忠实的法律服务。对于那些付不起自己律师的人来说，这是特别慷慨的。

我们已经看到，我们今天所知道的麻省理工学院的许可证是一套具体的、标准化的条款，最终将秩序带入了一个混乱的机构特定的、随意的变化。

我们已经看到了它的方法，归因和版权通知通知知识产权管理的做法，学术，标准，商业和基础机构。

我们已经看到了麻省理工学院的许可证是如何免费授予所有人软件许可的，但前提是要保护许可人不受担保和责任的影响。

我们已经看到，尽管有一些刻薄的措辞和律师的矫揉造作，但一百七十一个小词可以完成大量的法律工作，通过密集的知识产权和合同丛林为开源软件扫清了一条道路。
我非常感谢所有花时间阅读这篇相当长的文章的人，让我知道他们发现它很有用，并帮助改进它。一如既往，我欢迎您通过[e-mail][29]、[Twitter][30]和[GitHub][31]发表评论。


有很多人问，他们在哪里可以读到更多的东西，或者找到其他许可证，比如 GNU 通用公共许可证或 Apache 2.0 许可证。无论你的兴趣是什么，我都会向你推荐以下书籍:

  * Andrew M. St. Laurent 的 [Understanding Open Source & Free Software Licensing][32], 来自 O’Reilly.

我先说这本，因为虽然它有些过时，但它的方法也最接近上面使用的逐行方法。O'Reilly 已经把它[放在网上][33]。

  * Heather Meeker’s [Open (Source) for Business][34]

在我看来，这是迄今为止关于 GN U通用公共许可证和更广泛的 copyleft 的最佳著作。这本书涵盖了历史、许可证、它们的发展，以及兼容性和合规性。这本书是我给那些考虑或处理 GPL 的客户的书。

  * Larry Rosen’s [Open Source Licensing][35], from Prentice Hall.

一本很棒的第一本书，也可以免费[在线阅读][36]。对于从零开始的程序员来说，这是开源许可和相关法律的最好介绍。这本在一些具体细节上也有点过时了，但 Larry 的许可证分类法和对开源商业模式的简洁总结经得起时间的考验。



所有这些都对我作为一个开源许可律师的教育至关重要。它们的作者都是我的职业英雄。请读一读吧  — K.E.M

我将此文章基于 [Creative Commons Attribution-ShareAlike 4.0 license][37] 授权


--------------------------------------------------------------------------------

via: https://writing.kemitchell.com/2016/09/21/MIT-License-Line-by-Line.html

作者：[Kyle E. Mitchell][a]
选题：[lujun9972][b]
译者：[bestony](https://github.com/bestony)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kemitchell.com/
[b]: https://github.com/lujun9972
[1]: http://spdx.org/licenses/MIT
[2]: https://fedoraproject.org/wiki/Licensing:MIT?rd=Licensing/MIT
[3]: https://opensource.org
[4]: https://spdx.org
[5]: http://spdx.org/licenses/
[6]: https://spdx.org/licenses/JSON
[7]: https://www.npmjs.com/package/licensor
[8]: https://www.apache.org/licenses/LICENSE-2.0
[9]: https://www.gnu.org/licenses/gpl-3.0.en.html
[10]: http://spdx.org/licenses/BSD-4-Clause
[11]: https://spdx.org/licenses/BSD-3-Clause
[12]: https://spdx.org/licenses/BSD-2-Clause
[13]: http://www.isc.org/downloads/software-support-policy/isc-license/
[14]: http://worksmadeforhire.com/
[15]: https://www.eclipse.org/legal/epl-v10.html
[16]: https://www.apache.org/licenses/#clas
[17]: https://wiki.eclipse.org/ECA
[18]: https://en.wikipedia.org/wiki/Feist_Publications,_Inc.,_v._Rural_Telephone_Service_Co.
[19]: https://writing.kemitchell.com/2017/02/16/Against-Legislating-the-Nonobvious.html
[20]: http://developercertificate.org/
[21]: https://github.com/berneout/berneout-pledge
[22]: https://github.com/berneout/authors-certificate
[23]: https://en.wikipedia.org/wiki/Immediately-invoked_function_expression
[24]: https://www.govinfo.gov/app/details/USCODE-2017-title35/USCODE-2017-title35-partIII-chap28-sec271
[25]: https://www.govinfo.gov/app/details/USCODE-2017-title17/USCODE-2017-title17-chap1-sec106
[26]: https://leginfo.legislature.ca.gov/faces/codes_displaySection.xhtml?sectionNum=2314.&lawCode=COM
[27]: https://leginfo.legislature.ca.gov/faces/codes_displaySection.xhtml?sectionNum=2315.&lawCode=COM
[28]: https://leginfo.legislature.ca.gov/faces/codes_displaySection.xhtml?sectionNum=2316.&lawCode=COM
[29]: mailto:kyle@kemitchell.com
[30]: https://twitter.com/kemitchell
[31]: https://github.com/kemitchell/writing/tree/master/_posts/2016-09-21-MIT-License-Line-by-Line.md
[32]: https://lccn.loc.gov/2006281092
[33]: http://www.oreilly.com/openbook/osfreesoft/book/
[34]: https://www.amazon.com/dp/1511617772
[35]: https://lccn.loc.gov/2004050558
[36]: http://www.rosenlaw.com/oslbook.htm
[37]: https://creativecommons.org/licenses/by-sa/4.0/legalcode