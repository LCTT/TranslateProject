[#]: subject: (How we built an open source design system to create new community logos)
[#]: via: (https://opensource.com/article/21/4/ansible-community-logos)
[#]: author: (Fiona Lin https://opensource.com/users/fionalin)
[#]: collector: (lujun9972)
[#]: translator: (MareDevi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15227-1.html)

我们如何建立一个开源的设计系统来创造新的社区徽标
======

> 了解 Ansible 的新徽标是如何根据相关人员的意见开发的，以确保整个项目的品牌一致性。

![UX design Mac computer with mobile and laptop][1]

作为红帽的用户体验（UX）设计和 Ansible 产品团队的交互设计师，我们花了大约 6 个月的时间为 Ansible 社区设计了一系列徽标。这件事其实在更早的时候就开始了，当时一位项目经理要求我们为一个幻灯片提供一个 “快速而简单” 的徽标。在收集了一些需求后，我们在几天内就向相关人员展示了一个徽标，而且没有经过太多调整。几个月后，另一个相关人员说他们也需要类似的徽标，所以我们重复了这个过程。

于是，我们注意到一个模式：像这样的徽标资源不仅仅代表个人的要求，而是整个 Ansible 项目的共同需要。在完成了几个徽标要求后，我们有了一系列临时的设计，但在没有意识到品牌和设计惯例的情况下，这可能给整个 Ansible 的品牌视觉造成了不一致。随着这个徽标系列的增加，我们认识到了这个迫在眉睫的问题，并需要解决它。

我们的解决方案是创建一个 Ansible 设计系统，这是一个针对品牌的资源，可以指导未来一致的徽标设计。

### 什么是设计系统？

设计系统是一个可重复使用的资源和指导方法的集合，有助于告知任何数字产品套件的视觉语言。设计系统创造了一些模式，将独立的产品整合在一起，并通过可扩展性和一致性提升品牌。

特别是在一个有多种产品的大公司里，如果没有标准化，扩展起来就不容易，因为不同的团队对每个产品都有贡献。设计系统可以作为每个团队建立新资产的基线。有了标准化的外观和感觉，产品在整个组合中被统一为一个家族。

### 从头构建一个设计系统

在收到相关人员提出的为 Ansible 开源社区（如 Ansible Builder、Ansible Runner 和Project Receptor）创建徽标的一系列要求后，我们决定为我们的工作流程设计一个结构，并创建一个单一的事实来源，为之努力。

首先，我们对现有的徽标进行了视觉审计，以确定我们要做的是什么。Ansible 的原始徽标系列由四个主要图像组成：代表 AWX 的 Angry Spud，代表 Ansible 核心/引擎的 Ansibull，以及代表 AWX 的带翅膀的显示器。大部分的徽标都是用一致的红色阴影和公牛的形象联系在一起的，但是笔画的宽度、笔画的颜色、线条的质量和排版复杂而多样。

![Original Ansible logos][2]

Angry Spud 使用棕褐色的轮廓和手绘风格，而 Ansibull 则是一个对称的几何矢量图。AWX 显示器是一个异类，它有细线画的翅膀，蓝色的矢量矩形，以及古英语字体（这里没有包括在内，但与家族中其他使用现代无衬线的字体相比，它是一个例外）。

### 确立新的设计标准

考虑到调色板、排版和图像，我们产生了一个一致的构图，以 Ansibull 代表所有核心的 Ansible 产品，以及大胆的线条和充满活力的颜色。

![Ansible design system][4]

新的 Ansible 社区徽标设计风格指南详细说明了 Ansible 产品徽标的调色、排版、尺寸、间距和徽标变化。

新的风格指南展示了一种全新的、现代的定制字体，该字体基于瑞士独立字体厂商 [Grilli Type][5] 的 GT America 字体。我们为该字体创造了一个柔和的外观，通过圆润每个字母某些角落来配合图像的圆润度。

我们决定通过在光谱中加入更多的颜色并以原色为基础，设计一个更生动、更饱和、更普遍的调色板。新的调色板以浅蓝色、黄色和粉红色为主色调，每种颜色都有较浅的高光和较深的阴影。这种更广泛的颜色范围使系统内有更多的灵活性，并引入了 3D 的外观和感觉。

![New Ansible logos][6]

我们还引入了新的图像，如 Receptor 和 AWX 徽标中的六边形，以保持视觉上的连续性。最后，我们确保每个徽标在浅色和深色背景上都能使用，以获得最大的灵活性。

### 拓展设计组合

一旦我们建立了核心徽标系列，我们就开始为 Ansible 服务创建徽章，如 Ansible Demo 和 Ansible Workshop。为了将服务与产品区分开来，我们决定将服务图形包围在一个圆圈中，圆圈中包含了相同的定制排版的服务名称。新的服务徽章显示了幼儿版的 Ansibull（来自 Ansible Builder 的徽标）正在完成与每个服务相关的任务，例如 Ansible Demo 指向白板，Ansible Workshop 则使用构建工具。

![New Ansible services logos][7]

### 利用开放源码进行设计决策

最初的 AWX 徽标受到了摇滚乐图像的影响，如翅膀和重金属字体（此处省略）。

![Original AWX logo][8]

(Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3])

Ansible 社区的一些成员，包括红帽多样性和包容性小组，提请我们注意，这些元素类似于仇恨团体使用的图像。

考虑到原徽标的社会影响，我们必须迅速与 Ansible 社区合作，设计一个替代徽标。我们没有像最初的徽标那样闭门造车，而是扩大了项目的范围，仔细考虑了更多的相关人员，包括 Ansible 社区、红帽多样性和包容性小组，以及红帽法律团队。

我们开始了头脑风暴，向 Ansible 开源社区征求意见。Ansible 的一位工程师 Rebeccah Hunter 在草图绘制阶段做出了贡献，后来成为我们设计团队中的一员。让一大群相关人员参与进来的挑战之一是，我们对新的徽标概念有了各种各样的想法，比如一条辅助电缆、一碗拉面等等。

我们勾画了五个社区贡献的徽标创意，每个徽标都有不同的品牌视觉：一个芽、一个火箭、一个显示器、一碗拉面和一个辅助电缆。

![AWX logo concepts][9]

在完成这些初步的概念草图后，我们建立了一个虚拟的投票机制，并在整个迭代过程中使用。这个投票系统使我们能够利用社区的反馈，从五个初始概念缩小到三个：火箭、一碗拉面和显示器。我们在这三个方向上进一步迭代，并通过专门的 Slack 频道进行反馈，直到我们找到一个符合社区愿景的方向，即 AWX 显示器。

![New AWX logo][10]

以社区的意见为指导，我们围绕显示器为 AWX 打造了徽标概念。我们保留了原徽标中的显示器元素，同时使其外观和感觉现代化，以配合我们更新的设计系统。我们使用了更鲜艳的色调，更简洁的无衬线字体，以及来自 Project Receptor 徽标的元素，包括六角形图案。

通过从一开始就与我们的社区接触，我们能够在公开场合进行设计和迭代，所有相关人员都有一种包容感。最后，我们认为这是取代一个有争议的徽标的最好方法。最终的版本被移交给了红帽法律团队，在获得批准后，我们用这个新的徽标替换了所有的现有资产。

### 主要收获

为设计系统创建一套规则和资源，使你的数字产品全面保持一致，消除品牌混乱，并实现可扩展性。

当你探索在自己的社区建立一个设计系统时，你可能会从我们在这条路上学到的这些关键经验中受益：

  * 用设计系统来扩展新的徽标，比没有设计系统要容易得多。
  * 当你使用投票系统来验证结果时，杂乱无章的设计方案就会变得不那么令人生畏。
  * 将大量受众的注意力引向三套方案，可以消除决策疲劳，集中社区反馈。

我们希望这篇文章能够提供用于开源社区的设计系统的启示，并帮助你认识到在早期开发一个系统的好处。如果你正在创建一个新的设计系统，你有什么问题？如果你已经创建了一个，你学到了什么教训？请在评论中分享你的想法。

*（图像来自：Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3]）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/ansible-community-logos

作者：[Fiona Lin][a]
选题：[lujun9972][b]
译者：[MareDevi](https://github.com/MareDEvi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fionalin
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ux-design-mac-laptop.jpg?itok=9-HKgXa9 (UX design Mac computer with mobile and laptop)
[2]: https://opensource.com/sites/default/files/pictures/original_logos.png (Original Ansible logos)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/pictures/design_system.png (Ansible design system)
[5]: https://www.grillitype.com/
[6]: https://opensource.com/sites/default/files/pictures/new_logos.png (New Ansible logos)
[7]: https://opensource.com/sites/default/files/pictures/new_service_badges.png (New Ansible services logos)
[8]: https://opensource.com/sites/default/files/uploads/awx_original.png (Original AWX logo)
[9]: https://opensource.com/sites/default/files/uploads/awx_concepts.png (AWX logo concepts)
[10]: https://opensource.com/sites/default/files/uploads/awx.png (New AWX logo)
