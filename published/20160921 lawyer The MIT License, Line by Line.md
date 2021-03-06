[#]: collector: (lujun9972)
[#]: translator: (bestony)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13180-1.html)
[#]: subject: (lawyer The MIT License, Line by Line)
[#]: via: (https://writing.kemitchell.com/2016/09/21/MIT-License-Line-by-Line.html)
[#]: author: (Kyle E. Mitchell https://kemitchell.com/)

逐行解读 MIT 许可证
======

![](https://img.linux.net.cn/data/attachment/album/202103/06/224509d0zt70ctxtt7iibo.png)

> 每个程序员都应该明白的 171 个字。

[MIT 许可证][1] 是世界上最流行的开源软件许可证。以下是它的逐行解读。

### 阅读许可证

如果你参与了开源软件，但还没有花时间从头到尾的阅读过这个许可证（它只有 171 个单词），你需要现在就去读一下。尤其是如果许可证不是你日常每天都会接触的，把任何看起来不对劲或不清楚的地方记下来，然后继续阅读。我会分段、按顺序、加入上下文和注释，把每一个词再重复一遍。但最重要的还是要有个整体概念。

> The MIT License (MIT)
>
> Copyright (c) \<year> \<copyright holders>
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
> *The Software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the Software.*

（LCTT 译注：MIT 许可证并无官方的中文文本，我们也没找到任何可靠的、精确的非官方中文文本。在本文中，我们仅作为参考目的提供一份逐字逐行而没有经过润色的中文翻译文本，但该文本及对其的理解**不能**作为 MIT 许可证使用，我们也不为此中文翻译文本的使用承担任何责任，这份中文文本，我们贡献给公共领域。）

> MIT 许可证（MIT）
>
> 版权 (c) <年份> <版权人>
>
> 特此免费授予任何获得本软件副本和相关文档文件（下称“软件”）的人不受限制地处置该软件的权利，包括不受限制地使用、复制、修改、合并、发布、分发、转授许可和/或出售该软件副本，以及再授权被配发了本软件的人如上的权利，须在下列条件下：
>
> 上述版权声明和本许可声明应包含在该软件的所有副本或实质成分中。
>
> 本软件是“如此”提供的，没有任何形式的明示或暗示的保证，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人都不对任何索赔、损害或其他责任负责，无论这些追责来自合同、侵权或其它行为中，还是产生于、源于或有关于本软件以及本软件的使用或其它处置。

该许可证分为五段，按照逻辑划分如下：

  * **头部**
    * **许可证名称**：“MIT 许可证”
    * **版权说明**：“版权 (c) …”
  * **许可证授予**：“特此授予 …”
    * **授予范围**：“… 处置软件 …”
    * **条件**：“… 须在 …”
      * **归因和声明**：“上述 … 应包含在 …”
      * **免责声明**：“本软件是‘如此’提供的 …”
      * **责任限制**：“在任何情况下 …”

接下来详细看看。

### 头部

#### 许可证名称

> The MIT License (MIT)

> MIT 许可证（MIT）

“MIT 许可证”不是一个单一的许可证，而是根据<ruby>麻省理工学院<rt>Massachusetts Institute of Technology</rt></ruby>（MIT）为发行版本准备的语言衍生出来一系列许可证形式。多年来，无论是对于使用它的原始项目，还是作为其他项目的范本，它经历了许多变化。Fedora 项目一直保持着 [收藏 MIT 许可证的好奇心][2]，以纯文本的方式记录了那些平淡的变化，如同泡在甲醛中的解剖标本一般，追溯了它的各种演变。

幸运的是，<ruby>[开放源码倡议组织][3]<rt>Open Source Initiative</rt></ruby>（OSI） 和 <ruby>[软件数据包交换][4]<rt>Software Package Data eXchange</rt></ruby>组织（SPDX）已经将一种通用的 MIT 式的许可证形式标准化为“<ruby>MIT 许可证<rt>The MIT License</rt></ruby>”。OSI 反过来又采用了 SPDX 通用开源许可证的标准化 [字符串标志符][5]，并将其中的 “MIT” 明确指向了标准化形式的“MIT 许可证”。如果你想为一个新项目使用 MIT 式的条款，请使用其 [标准化的形式][1]。

即使你在 `LICENSE` 文件中包含 “The MIT License” 或 “SPDX:MIT”，任何负责的审查者仍会将文本与标准格式进行比较，以确保安全。尽管自称为“MIT 许可证”的各种许可证形式只在细微的细节上有所不同，但所谓的“MIT 许可证”的松散性已经诱使了一些作者加入麻烦的“自定义”。典型的糟糕、不好的、非常坏的例子是 [JSON 许可证][6]，一个 MIT 家族的许可证被加上了“本软件应用于善，而非恶”。这件事情可能是“非常克罗克福特”的（LCTT 译者注，Crockford 是 JSON 格式和 JSON.org 的作者）。这绝对是一件麻烦事，也许这个玩笑本来是开在律师身上的，但他们却笑得前仰后合。

这个故事的寓意是：“MIT 许可证”本身就是模棱两可的。大家可能很清楚你的意思，但你只需要把标准的 MIT 许可证文本复制到你的项目中，就可以节省每个人的时间。如果使用元数据（如包管理器中的元数据文件）来指定 “MIT 许可证”，请确保 `LICENSE` 文件和任何头部的注释都使用标准的许可证文本。所有的这些都可以 [自动化完成][7]。

#### 版权声明

> Copyright (c) <year> <copyright holders>

> 版权 (c) <年份> <版权持有人>

在 1976 年（美国）《版权法》颁布之前，美国的版权法规要求采取具体的行动，即所谓的“手续”来确保创意作品的版权。如果你不遵守这些手续，你起诉他人未经授权使用你的作品的权力就会受到限制，往往会完全丧失权力，其中一项手续就是“<ruby>声明<rt>notice</rt></ruby>”。在你的作品上打上记号，以其他方式让市场知道你拥有版权。“©” 是一个标准符号，用于标记受版权保护的作品，以发出版权声明。ASCII 字符集没有 © 符号，但 `Copyright (c)` 可以表达同样的意思。

1976 年的《版权法》“落实”了国际《<ruby>伯尔尼公约<rt>Berne Convention</rt></ruby>》的许多要求，取消了确保版权的手续。至少在美国，著作权人在起诉侵权之前，仍然需要对自己的版权作品进行登记，如果在侵权行为开始之前进行登记，可能会获得更高的赔偿。但在实践中，很多人在对某个人提起诉讼之前，都会先注册版权。你并不会因为没有在上面贴上声明、注册它、向国会图书馆寄送副本等而失去版权。

即使版权声明不像过去那样绝对必要，但它们仍然有很多用处。说明作品的创作年份和版权属于谁，可以让人知道作品的版权何时到期，从而使作品纳入公共领域。作者或作者们的身份也很有用。美国法律对个人作者和“公司”作者的版权条款的计算方式不同。特别是在商业用途中，公司在使用已知竞争对手的软件时，可能也要三思而行，即使许可条款给予了非常慷慨的许可。如果你希望别人看到你的作品并想从你这里获得许可，版权声明可以很好地起到归属作用。

至于“<ruby>版权持有人<rt>copyright holder</rt></ruby>”。并非所有标准形式的许可证都有写明这一点的空间。最新的许可证形式，如 [Apache 2.0][8] 和 [GPL 3.0][9]，发布的许可证文本是要逐字复制的，并在其他地方加上标题注释和单独文件，以表明谁拥有版权并提供许可证。这些办法巧妙地阻止了对“标准”文本的意外或故意的修改。这还使自动许可证识别更加可靠。

MIT 许可证是从为机构发布的代码而写的语言演变而来。对于机构发布的代码，只有一个明确的“版权持有人”，即发布代码的机构。其他机构抄袭了这些许可证，用他们自己的名字代替了 “MIT”，最终形成了我们现在拥有的通用形式。这一过程同样适用于该时代的其他简短的机构许可证，特别是加州大学伯克利分校的最初的 <ruby>[四条款 BSD 许可证][10]<rt>four-clause BSD License</rt></ruby> 成为了现在使用的 [三条款][11] 和 [两条款][12] 变体，以及 MIT 许可证的变体<ruby>互联网系统联盟<rt>Internet Systems Consortium</rt></ruby>的 [ISC 许可证][13]。

在每一种情况下，该机构都根据版权所有权规则将自己列为版权持有人，这些规则称为“[雇佣作品][14]”规则，这些规则赋予雇主和客户在其雇员和承包商代表其从事的某些工作中的版权所有权。这些规则通常不适用于自愿提交代码的分布式协作者。这给项目监管型基金会（如 Apache 基金会和 Eclipse 基金会）带来了一个问题，因为它们接受来自更多不同的贡献者的贡献。到目前为止，通常的基础方法是使用一个单一的许可证，它规定了一个版权持有者，如 [Apache 2.0][8] 和 [EPL 1.0][15]，并由<ruby>贡献者许可协议<rt>contributor license agreements</rt></ruby> [Apache CLA][16] 以及 [Eclipse CLA][17] 为后盾，以从贡献者中收集权利。在像 GPL 这样的<ruby>左版<rt>copyleft</rt></ruby>许可证下，将版权所有权收集在一个地方就更加重要了，因为 GPL 依靠版权所有者来执行许可证条件，以促进软件自由的价值。

如今，大量没有机构或商业管理人的项目都在使用 MIT 风格的许可条款。SPDX 和 OSI 通过标准化不涉及特定实体或机构版权持有人的 MIT 和 ISC 之类的许可证形式，为这些用例提供了帮助。有了这些许可证形式，项目作者的普遍做法是在许可证的版权声明中尽早填上自己的名字...也许还会在这里或那里填上年份。至少根据美国的版权法，由此产生的版权声明并不能说明全部情况。

软件的原始所有者保留其工作的所有权。但是，尽管 MIT 风格的许可条款赋予了他人开发和更改软件的权利，创造了法律上所谓的“衍生作品”，但它们并没有赋予原始作者对他人的贡献的所有权。相反，每个贡献者在以现有代码为起点所做的任何作品都拥有版权，[即使是稍做了一点创意][18]。

这些项目大多数也对接受<ruby>贡献者许可协议<rt>contributor license agreements</rt></ruby>（CLA）的想法嗤之以鼻，更不用说签署版权转让协议了。这既幼稚又可以理解。尽管一些较新的开源开发人员认为，在 GitHub 上发送<ruby>拉取请求<rt>Pull Request</rt></ruby>，就会“自动”根据项目现有的许可证条款授权分发贡献，但美国法律不承认任何此类规则。强有力的版权保护是默认的，而不是宽松许可。

> 更新：GitHub 后来修改了全站的服务条款，包括试图至少在 GitHub.com 上改变这一默认值。我在 [另一篇文章][19] 中写了一些对这一发展的想法，并非所有想法都是积极的。

为了填补法律上有效的、有据可查的贡献权利授予与完全没有纸质痕迹之间的差距，一些项目采用了 <ruby>[开发者原创证书][20]<rt>Developer Certificate of Origin</rt></ruby>，这是贡献者在 Git 提交中使用 `Signed-Off-By` 元数据标签暗示的标准声明。开发者原创证书是在臭名昭著的 SCO 诉讼之后为 Linux 内核开发而开发的，该诉讼称 Linux 的大部分代码源自 SCO 拥有的 Unix 源代码。作为创建显示 Linux 的每一行都来自贡献者的书面记录的一种方法，开发者原创证书的功能良好。尽管开发者原创证书不是许可证，但它确实提供了大量证据，证明提交代码的人希望项目分发其代码，并让其他人根据内核现有的许可证条款使用该代码。内核还维护着一个机器可读的 `CREDITS` 文件，其中列出了贡献者的名字、所属机构、贡献领域和其他元数据。我做了 [一些][21] [实验][22]，把这种方法改编成适用于不使用内核开发流程的项目。

### 许可证授权

> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”),

> 特此免费授予任何获得本软件副本和相关文档文件（下称“软件”）的人

MIT 许可证的实质是许可证（你猜对了）。一般来说，许可证是一个人或法律实体（“<ruby>许可人<rt>licensor</rt></ruby>”）给予另一个人（“<ruby>被许可人<rt>licensee</rt></ruby>”）做一些法律允许他们起诉的事情的许可。MIT 许可证是一种不起诉的承诺。

法律有时将许可证与给予许可证的承诺区分开来。如果有人违背了提供许可证的承诺，你可以起诉他们违背了承诺，但你最终可能得不到许可证。“<ruby>特此<rt>Hereby</rt></ruby>”是律师们永远摆脱不了的一个矫揉造作、老生常谈的词。这里使用它来表明，许可证文本本身提供了许可证，而不仅仅是许可证的承诺。这是一个合法的 [即调函数表达式（IIFE）][23]。

尽管许多许可证都是授予特定的、指定的被许可人的，但 MIT 许可证是一个“<ruby>公共许可证<rt>public license</rt></ruby>”。公共许可证授予所有人（整个公众）许可。这是开源许可中的三大理念之一。MIT 许可证通过“向任何获得……软件副本的人”授予许可证来体现这一思想。稍后我们将看到，获得此许可证还有一个条件，以确保其他人也可以了解他们的许可。

在美国式法律文件中，括号中带引号的首字母大写词汇是赋予术语特定含义的标准方式（“定义”）。当法庭看到文件中其他地方使用了一个已定义的大写术语时，法庭会可靠地回顾定义中的术语。

#### 授权范围

> to deal in the Software without restriction,

> 不受限制地处置该软件的权利，

从被许可人的角度来看，这是 MIT 许可证中最重要的七个字。主要的法律问题就是因侵犯版权而被起诉，和因侵犯专利而被起诉。无论是版权法还是专利法都没有将 “<ruby>处置<rt>to deal in</rt></ruby>” 作为一个术语，它在法庭上没有特定的含义。因此，任何法庭在裁决许可人和被许可人之间的纠纷时，都会询问当事人对这一措辞的含义和理解。法庭将看到的是，该措辞有意宽泛和开放。它为被许可人提供了一个强有力的论据，反对许可人提出的任何主张 —— 即他们不允许被许可人使用该软件做那件特定的事情，即使在授予许可证时双方都没有明显想到。

> including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,

> 包括不受限制地使用、复制、修改、合并、发布、分发、转授许可和/或出售该软件副本，以及再授权被配发了本软件的人如上的权利，

没有一篇法律是完美的、“意义上完全确定”、或明确无误的。小心那些假装不然的人。这是 MIT 许可证中最不完美的部分。主要有三个问题：

首先，“<ruby>包括不受限制地<rt>including without limitation</rt></ruby>”是一种法律反模式。它有多种衍生：

  * <ruby>包括，但不受限制<rt>including, without limitation</rt></ruby>
  * <ruby>包括，但不限于前述的一般性<rt>including, without limiting the generality of the foregoing</rt></ruby>
  * <ruby>包括，但不限于<rt>including, but not limited to</rt></ruby>
  * 很多、很多毫无意义的变化

所有这些都有一个共同的目标，但都未能可靠地实现。从根本上说，使用它们的起草者也会尽量试探着去做。在 MIT 许可证中，这意味着引入“<ruby>处置软件<rt>dealing in the Software</rt></ruby>”的具体例子 — “使用、复制、修改”等等，但不意味着被许可方的行为必须与给出的例子类似，才能算作“处置”。问题是，如果你最终需要法庭来审查和解释许可证的条款，法庭将把它的工作看作是找出这些语言的含义。如果法庭需要决定“<ruby>处置<rt>deal in</rt></ruby>”的含义，它不能“无视”这些例子，即使你告诉它。我认为，“不受限制地处置本软件”本身对被许可人更好，也更短。

其次，作为“<ruby>处置<rt>deal in</rt></ruby>”的例子的那些动词是一个大杂烩。有些在版权法或专利法下有特定的含义，有些稍微有或根本没有含义：

  * “<ruby>使用<rt>use</rt></ruby>”出现在 [《美国法典》第 35 篇，第 271(a)节][24]，这是专利法中专利权人可以起诉他人未经许可的行为的清单。
  * “<ruby>复制<rt>copy</rt></ruby>”出现在 [《美国法典》第 17 篇，第 106 节][25]，即版权法列出的版权所有人可以起诉他人未经许可的行为。
  * “<ruby>修改<rt>modify</rt></ruby>”既不出现在版权法中，也不出现在专利法中。它可能最接近版权法下的“<ruby>准备衍生作品<rt>prepare derivative works</rt></ruby>”，但也可能涉及改进或其他衍生发明。
  * 无论是在版权法还是专利法中，“<ruby>合并<rt>merge</rt></ruby>”都没有出现。“<ruby>合并<rt>merger</rt></ruby>”在版权方面有特定的含义，但这显然不是这里的意图。相反，法庭可能会根据其在行业中的含义来解读“合并”，如“合并代码”。
  * 无论是在版权法还是专利法中，都没有“<ruby>发布<rt>publish</rt></ruby>”。由于“软件”是被发布的内容，根据《[版权法][25]》，它可能最接近于“<ruby>分发<rt>distribute</rt></ruby>”。该法令还包括“公开”表演和展示作品的权利，但这些权利只适用于特定类型的受版权保护的作品，如戏剧、录音和电影。
  * “<ruby>分发<rt>distribute</rt></ruby>”出现在《[版权法][25]》中。
  * “<ruby>转授许可<rt>sublicense</rt></ruby>”是知识产权法中的一个总称。转授许可的权利是指把自己的许可证授予他人，有权进行你所许可的部分或全部活动。实际上，MIT 许可证的转授许可的权利在开源代码许可证中并不常见。通常的做法是 Heather Meeker 所说的“<ruby>直接许可<rt>direct licensing</rt></ruby>”方式，在这种方法中，每个获得该软件及其许可证条款副本的人都直接从所有者那里获得授权。任何可能根据 MIT 许可证获得转授许可的人都可能会得到一份许可证副本，告诉他们其也有直接许可证。
  * “<ruby>出售副本<rt>sell copies</rt></ruby>”是个混杂品。它接近于《[专利法][24]》中的“<ruby>要约出售<rt>offer to sell</rt></ruby>”和“<ruby>出售<rt>sell</rt></ruby>”，但指的是“<ruby>副本<rt>coyies</rt></ruby>”，这是一种版权概念。在版权方面，它似乎接近于“<ruby>分发<rt>distribute</rt></ruby>”，但《[版权法][25]》没有提到销售。
  * “<ruby>允许被配发了本软件的人这样做<rt>permit persons to whom the Software is furnished to do so</rt></ruby>”似乎是多余的“转授许可”。这也是不必要的，因为获得副本的人也可以直接获得许可证。

最后，由于这种法律、行业、一般知识产权和一般使用条款的混杂，并不清楚 MIT 许可证是否包括专利许可。一般性语言“<ruby>处置<rt>deal in</rt></ruby>”和一些例子动词，尤其是“使用”，指向了一个专利许可，尽管是一个非常不明确的许可。许可证来自于版权持有人，而版权持有人可能对软件中的发明拥有或不拥有专利权，以及大多数的例子动词和“<ruby>软件<rt>the Software</rt></ruby>”本身的定义，都强烈地指向版权许可证。诸如 [Apache 2.0][8] 之类的较新的宽容开源许可分别具体地处理了版权、专利甚至商标问题。

#### 三个许可条件

> subject to the following conditions:

> 须在下列条件下：

总有一个陷阱！MIT 许可证有三个！

如果你不遵守 MIT 许可证的条件，你就得不到许可证提供的许可。因此，如果不能履行条件，至少从理论上说，会让你面临一场诉讼，很可能是一场版权诉讼。

开源软件的第二个伟大思想是，利用软件对被许可人的价值来激励被许可人遵守条件，即使被许可人没有支付任何许可费用。最后一个伟大思想，在 MIT 许可证中没有，它构建了许可证条件：像 [GNU 通用公共许可证][9]（GPL）这样的左版许可证，使用许可证条件来控制如何对修改后的版本进行许可和发布。

#### 声明条件

> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

> 上述版权声明和本许可声明应包含在该软件的所有副本或实质成分中。

如果你给别人一份软件的副本，你需要包括许可证文本和任何版权声明。这有几个关键目的：

  1. 给别人一个声明，说明他们有权使用该公共许可证下的软件。这是直接授权模式的一个关键部分，在这种模式下，每个用户直接从版权持有人那里获得许可证。
  2. 让人们知道谁是软件的幕后人物，这样他们就可以得到赞美、荣耀和冷冰冰的现金捐赠。
  3. 确保保修免责声明和责任限制（在后面）伴随该软件。每个得到该副本的人也应该得到一份这些许可人保护的副本。

没有什么可以阻止你对提供一个副本、甚至是一个没有源代码的编译形式的副本而收费。但是当你这么做的时候，你不能假装 MIT 代码是你自己的专有代码，也不能在其他许可证下提供。接受的人要知道自己在“公共许可证”下的权利。

坦率地说，遵守这个条件正在崩溃。几乎所有的开源许可证都有这样的“<ruby>归因<rt>attribution</rt></ruby>”条件。系统和装机软件的制作者往往明白，他们需要为自己的每一个发行版本编制一个声明文件或“许可证信息”屏，并附上库和组件的许可证文本副本。项目监管型基金会在教授这些做法方面起到了重要作用。但是整个 Web 开发者群体还没有取得这种经验。这不能用缺乏工具来解释，工具有很多，也不能用 npm 和其他资源库中的包的高度模块化来解释，它们统一了许可证信息的元数据格式。所有好的 JavaScript 压缩器都有保存许可证标题注释的命令行标志。其他工具可以从包树中串联 `LICENSE` 文件。这实在是没有借口。

#### 免责声明

> The Software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement.

> 本软件是“如此”提供的，没有任何形式的明示或暗示的保证，包括但不限于对适销性、特定用途的适用性和不侵权的保证。

美国几乎每个州都颁布了一个版本的《<ruby>统一商业法典<rt>Uniform Commercial Code</rt></ruby>》（UCC），这是一部规范商业交易的示范性法律。UCC 的第 2 条（加利福尼亚州的“第 2 部分”）规定了商品销售合同，包括了从二手汽车的购买到向制造厂运送大量工业化学品。

UCC 关于销售合同的某些规则是强制性的。这些规则始终适用，无论买卖双方是否喜欢。其他只是“默认”。除非买卖双方以书面形式选择不适用这些默认，否则 UCC 潜在视作他们希望在 UCC 文本中找到交易的基准规则。默认规则中包括隐含的“<ruby>免责<rt>warranties</rt></ruby>”，或卖方对买方关于所售商品的质量和可用性的承诺。

关于诸如 MIT 许可证之类的公共许可证是合同（许可方和被许可方之间的可执行协议）还是仅仅是许可证（单向的，但可能有附加条件），这在理论上存在很大争议。关于软件是否被视为“商品”，从而触发 UCC 规则的争论较少。许可人之间没有就赔偿责任进行辩论：如果他们免费提供的软件出现故障、导致问题、无法正常工作或以其他方式引起麻烦，他们不想被起诉和被要求巨额赔偿。这与“<ruby>默示保证<rt>implied warranty</rt></ruby>”的三个默认规则完全相反：

  1. 据 [UCC 第 2-314 节][26]，“<ruby>适销性<rt>merchantability</rt></ruby>”的默示保证是一种承诺：“商品”（即软件）的质量至少为平均水平，并经过适当包装和标记，并适用于其常规用途。仅当提供该软件的人是该软件的“商人”时，此保证才适用，这意味着他们从事软件交易，并表现出对软件的熟练程度。
  2. 据 [UCC 第 2-315 节][27]，当卖方知道买方依靠他们提供用于特定目的的货物时，“<ruby>适用于某一特定目的<rt>fitness for a particular purpose</rt></ruby>”的默示保证就会生效。商品实际上需要“适用”这一目的。
  3. “<ruby>非侵权<rt>noninfringement</rt></ruby>”的默示保证不是 UCC 的一部分，而是一般合同法的共同特征。如果事实证明买方收到的商品侵犯了他人的知识产权，则这种默示的承诺将保护买方。如果根据 MIT 许可证获得的软件实际上并不属于尝试许可该软件的许可人，或者属于他人拥有的专利，那就属于这种情况。

UCC 的 [第2-316（3）节][28] 要求，选择不适用或“排除”适销性和适用于某一特定目的的默示保证措辞必须醒目。“醒目”意味着书面化或格式化，以引起人们的注意，这与旨在从不小心的消费者身边溜走的细小字体相反。各州法律可以对不侵权的免责声明提出类似的引人注目的要求。

长期以来，律师们都有一种错觉，认为用“全大写”写任何东西都符合明显的要求。这是不正确的。法庭曾批评律师协会自以为是，而且大多数人都认为，全大写更多的是阻止阅读，而不是强制阅读。同样的，大多数开源许可证的形式都将其免责声明设置为全大写，部分原因是这是在纯文本的 `LICENSE` 文件中唯一明显的方式。我更喜欢使用星号或其他 ASCII 艺术，但那是很久很久以前的事了。

#### 责任限制

> In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the Software or the use or other dealings in the Software.

> 在任何情况下，作者或版权持有人都不对任何索赔、损害或其他责任负责，无论这些追责来自合同、侵权或其它行为中，还是产生于、源于或有关于本软件以及本软件的使用或其它处置。

MIT 许可证授予软件“免费”许可，但法律并不认为接受免费许可证的人在出错时放弃了起诉的权利，而许可人应该受到责备。“责任限制”，通常与“损害赔偿排除”条款搭配使用，其作用与许可证很像，是不起诉的承诺。但这些都是保护许可人免受被许可人起诉的保护措施。

一般来说，法庭对责任限制和损害赔偿排除条款的解读非常谨慎，因为这些条款可以将大量的风险从一方转移到另一方。为了保护社会的切身利益，让民众有办法纠正在法庭上所犯的错误，他们“严格地”用措辞限制责任，尽可能地对受其保护的一方进行解读。责任限制必须具体才能成立。特别是在“消费者”合同和其他放弃起诉权的人缺乏成熟度或讨价还价能力的情况下，法庭有时会拒绝尊重那些似乎被埋没在视线之外的措辞。部分是出于这个原因，部分是出于习惯，律师们往往也会给责任限制以全大写处理。

再往下看，“责任限制”部分是对被许可人可以起诉的金额上限。在开源许可证中，这个上限总是没有钱，0 元，“不承担责任”。相比之下，在商业许可证中，它通常是过去 12 个月内支付的许可证费用的倍数，尽管它通常是经过谈判的。

“排除”部分具体列出了各种法律主张，即请求赔偿的理由，许可人不能使用。像许多其他法律形式一样，MIT 许可证 提到了“<ruby>违约<rt>of contract</rt></ruby>”行为（即违反合同）和“<ruby>侵权<rt>of tort</rt></ruby>”行为。侵权规则是防止粗心或恶意伤害他人的一般规则。如果你在发短信时在路上撞倒了人，你就犯了侵权行为。如果你的公司销售的有问题的耳机会烧伤人们的耳朵，则说明贵公司已经侵权。如果合同没有明确排除侵权索赔，那么法庭有时会在合同中使用排除措辞以防止合同索赔。出于很好的考虑，MIT 许可证抛出“或其它”字样，只是为了截住奇怪的海事法或其它异国情调的法律主张。

“<ruby>产生于、源于或有关于<rt>arising from, out of or in connection with</rt></ruby>”这句话是法律起草人固有的、焦虑的不安全感反复出现的症状。关键是，任何与软件有关的诉讼都被这些限制和排除范围所覆盖。万一某些事情可以“<ruby>产生于<rt>arising from</rt></ruby>”，但不能“<ruby>源于<rt>out of</rt></ruby>”或“<ruby>有关于<rt>in connection with</rt></ruby>”，那就最好把这三者都写在里面，所以要把它们打包在一起。更不用说，任何被迫在这部分内容中斤斤计较的法庭将不得不为每个词提出不同的含义，前提是专业的起草者不会在一行中使用不同的词来表示同一件事。更不用说，在实践中，如果法庭对一开始就不利的限制感觉不好，那么他们会更愿意狭隘地解读范围触发器。但我离题了，同样的语言出现在数以百万计的合同中。

### 总结

所有这些诡辩都有点像在进教堂的路上吐口香糖。MIT 许可证是一个法律经典，且有效。它绝不是解决所有软件知识产权弊病的灵丹妙药，尤其是它比已经出现的软件专利灾难还要早几十年。但 MIT 风格的许可证发挥了令人钦佩的作用，实现了一个狭隘的目的，用最少的、谨慎的法律工具组合扭转了版权、销售和合同法等棘手的默认规则。在计算机技术的大背景下，它的寿命是惊人的。MIT 许可证已经超过、并将要超过绝大多数软件许可证。我们只能猜测，当它最终失去青睐时，它能提供多少年的忠实法律服务。对于那些无法提供自己的律师的人来说，这尤其慷慨。

我们已经看到，我们今天所知道的 MIT 许可证是如何成为一套具体的、标准化的条款，使机构特有的、杂乱无章的变化终于有了秩序。

我们已经看到了它对归因和版权声明的处理方法如何为学术、标准、商业和基金会机构的知识产权管理实践提供信息。

我们已经看到了 MIT 许可证是如何运行所有人免费试用软件的，但前提是要保护许可人不受担保和责任的影响。

我们已经看到，尽管有一些生硬的措辞和律师的矫揉造作，但一百七十一个小词可以完成大量的法律工作，为开源软件在知识产权和合同的密集丛林中开辟一条道路。

我非常感谢所有花时间阅读这篇相当长的文章的人，让我知道他们发现它很有用，并帮助改进它。一如既往，我欢迎你通过 [e-mail][29]、[Twitter][30] 和 [GitHub][31] 发表评论。
 
---

有很多人问，他们在哪里可以读到更多的东西，或者找到其他许可证，比如 GNU 通用公共许可证或 Apache 2.0 许可证。无论你的兴趣是什么，我都会向你推荐以下书籍:

  * Andrew M. St. Laurent 的 [Understanding Open Source & Free Software Licensing][32]，来自 O’Reilly。
    > 我先说这本，因为虽然它有些过时，但它的方法也最接近上面使用的逐行方法。O'Reilly 已经把它[放在网上][33]。
  * Heather Meeker 的 [Open (Source) for Business][34]
    > 在我看来，这是迄今为止关于 GNU 通用公共许可证和更广泛的左版的最佳著作。这本书涵盖了历史、许可证、它们的发展，以及兼容性和合规性。这本书是我给那些考虑或处理 GPL 的客户的书。
  * Larry Rosen 的 [Open Source Licensing][35]，来自 Prentice Hall。
    > 一本很棒的入门书，也可以免费 [在线阅读][36]。对于从零开始的程序员来说，这是开源许可和相关法律的最好介绍。这本在一些具体细节上也有点过时了，但 Larry 的许可证分类法和对开源商业模式的简洁总结经得起时间的考验。

所有这些都对我作为一个开源许可律师的教育至关重要。它们的作者都是我的职业英雄。请读一读吧  — K.E.M

我将此文章基于 [Creative Commons Attribution-ShareAlike 4.0 license][37] 授权

--------------------------------------------------------------------------------

via: https://writing.kemitchell.com/2016/09/21/MIT-License-Line-by-Line.html

作者：[Kyle E. Mitchell][a]
选题：[lujun9972][b]
译者：[bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

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