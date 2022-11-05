[#]: subject: (How we built an open source design system to create new community logos)
[#]: via: (https://opensource.com/article/21/4/ansible-community-logos)
[#]: author: (Fiona Lin https://opensource.com/users/fionalin)
[#]: collector: (lujun9972)
[#]: translator: (MareDevi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

我们如何建立一个开源的设计系统来创造新的社区Logo
======
了解Ansible的新logo是如何根据股东的意见开发以确保整个项目的品牌一致性。(确保整个项目有一个统一的品牌)
![UX design Mac computer with mobile and laptop][1]

作为红帽的用户体验（UX）设计和Ansible产品团队的交互设计师，我们花了大约6个月的时间为Ansible社区建立了一系列logo。 这段旅程开始得很早，当时一位项目经理要求我们为一个幻灯片提供一个 "快速而简单 "的标志。在收集了一些需求后，我们在几天内就向股东展示了一个标志，而且不需要太多迭代。几个月后，另一个股东决定他们也将从材料的图像中受益，所以我们重复了这个过程。

在这一点上，我们注意到一个模式：像这样的logo资源不再代表个人的要求，而是整个Ansible项目的共同需要。在完成了几个logo要求后，我们设计了一个临时的系列，但在没有意识到品牌和设计惯例的情况下，造成了整个Ansible品牌的视觉不一致的可能性。随着logo系列的增加，我们认识到了这个迫在眉睫的问题，并需要解决它。

我们的解决方案是创建一个Ansible设计系统，这是一个针对品牌的资源，可以指导未来一致的标志设计。

### 什么是设计系统?

设计系统是一个可重复使用的资源和指导方法的集合，有助于告知任何数字产品套件的视觉语言。设计系统创造了一些模式，将独立的产品整合在一起，并通过可扩展性和一致性提升品牌。

特别是在一个有多种产品的大公司里，如果没有标准化，扩展起来就不容易，因为不同的团队对每个产品都有贡献。设计系统可以作为每个团队建立新资产的基线。有了标准化的外观和感觉，产品在整个组合中被统一为一个家族。

### 开始构建一个设计系统

在收到股东提出的为开源Ansible社区（如Ansible Builder、Ansible Runner和Project Receptor）创建logo的一系列要求后，我们决定为我们的工作流程设计一个结构，并创建一个单一的事实来源，为之努力。

首先，我们对现有的logo进行了视觉审计，以确定我们要做的是什么。 Ansible的原始logo系列由四个主要图像组成：代表AWX的Angry Spud，代表Ansible Core/Engine的Ansibull，以及代表AWX的带翅膀的显示器。 大部分的标志都是用一致的红色阴影和公牛的形象联系在一起的，但是笔画的宽度、笔画的颜色、线条的质量和排版都是庞大而多样的。

![Original Ansible logos][2]

(Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3])

愤怒的飞毛腿使用棕褐色的轮廓和手绘风格，而公牛则是一个对称的几何矢量。AWX显示器是一个异类，它有细线画的翅膀，蓝色的矢量矩形，以及古英语字体（这里没有包括在内，但与家族中其他使用现代无衬线的字体相比，它是一个例外）。

### 确立新的设计标准

考虑到调色板、排版和图像，我们产生了一个一致的构图，以Ansibull为特色的所有核心Ansible产品，以及大胆的线条和充满活力的颜色。

![Ansible design system][4]

(Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3])

新的Ansible社区logo设计风格指南详细说明了Ansible产品logo的调色、排版、尺寸、间距和logo变化。

新的风格指南展示了一种全新的、现代的定制字体，该字体基于瑞士独立字体铸造厂[Grilli Type][5]的GT America。我们为该字体创造了一个柔和的外观，通过使每个字母的圆角来配合图像的圆润度。

我们决定通过在光谱中加入更多的颜色并以原色为基础，设计一个更生动、更饱和、更普遍的调色板。新的调色板具有浅蓝色、黄色和粉红色，每种颜色都有较浅的高光和较深的阴影。这种更广泛的颜色范围使系统内有更多的灵活性，并引入了3D的外观和感觉。

![New Ansible logos][6]

(Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3])

我们还引入了新的图像，如Receptor和AWXlogo中的六边形，以保持视觉上的连续性。最后，我们确保每个logo在浅色和深色背景上都能使用，以获得最大的灵活性。

### 拓展设计组合

一旦我们建立了核心logo系列，我们就开始为Ansible服务创建徽章，如Ansible Demo和Ansible Workshop。为了将服务与产品区分开来，我们决定将服务图形包围在一个圆圈中，圆圈中包含了相同的定制排版的服务名称。新的服务徽章显示了幼儿Ansibull（来自Ansible Builder的标志）正在完成与每个服务相关的任务，例如Ansible Demo指向白板，Ansible Workshop则使用构建工具。

![New Ansible services logos][7]

(Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3])

### 利用开放源码进行设计决策

最初的AWX标志受到了摇滚乐图像的影响，如翅膀和重金属字体（此处省略）。

![Original AWX logo][8]

(Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3])

Ansible社区的一些成员，包括红帽多样性和包容性小组，提请我们注意，这些元素类似于仇恨组织使用的图像。

考虑到原logo的社会影响，我们必须迅速与Ansible社区合作，设计一个替代logo。我们没有像最初的logo那样在一个孤岛上工作，而是扩大了项目的范围，仔细考虑了更多的利益相关者，包括Ansible社区、红帽多样性和包容性小组，以及红帽法律团队。

我们开始了头脑风暴，向Ansible开源社区征求意见。Ansible的一位工程师Rebeccah Hunter在草图绘制阶段做出了贡献，后来成为我们设计团队中的一员。让一大群股东参与进来的挑战之一是，我们对新的标志概念有各种各样的想法，从一条辅助电缆到一碗拉面。

我们勾画了五个社区外部的logo，每个标识都有不同的品牌视觉：一个豆芽、一个火箭、一个显示器、一碗拉面和一个辅助电缆。

![AWX logo concepts][9]

(Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3])

在完成这些初步的概念草图后，我们建立了一个虚拟的投票机制，并在整个迭代过程中使用。这个投票系统使我们能够利用社区的反馈，从五个初始概念缩小到三个：火箭、一碗拉面和显示器。我们在这三个方向上进一步迭代，并通过专门的Slack频道进行反馈，直到我们找到一个符合社区愿景的方向，即AWX显示器。

![New AWX logo][10]

(Fiona Lin and Taufique Rahman, [CC BY-SA 4.0][3])

以社区的意见为指导，我们为AWX追求显示器的logo概念。我们保留了原logo中的显示器元素，同时使其外观和感觉现代化，以配合我们更新的设计系统。我们使用了更鲜艳的色调，更简洁的无衬线字体，以及来自Project Receptor logo的元素，包括六角形图案。

通过从一开始就与我们的社区接触，我们能够在公开场合进行设计和迭代，所有股东都有一种包容感。最后，我们认为这是取代一个有争议的logo的最好方法。最终的版本被移交给了红帽法律团队，在获得批准后，我们用这个新的logo替换了所有的现有资产。

###  主要收获

为设计系统创建一套规则和资源，使你的数字产品全面保持一致，消除品牌混乱，并实现可扩展性。

在你探索与你自己的社区建立一个设计系统时，你可能会从我们在这条路上学到的这些关键经验中受益：

  * 用设计系统来扩展新的标识，比没有设计系统要容易得多。
  * 当你使用投票系统来验证结果时，杂乱无章的设计方案就会变得不那么令人生畏。
  * 将大量群众的注意力引向多组，消除决策疲劳，集中社区反馈。



我们希望这篇文章能够为设计一个具有开放源码社区的系统提供启示，并帮助你认识到在早期开发系统的好处。如果你正在创建一个新的设计系统，你有什么问题？如果你已经创建了一个，你学到了什么教训？请在评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/ansible-community-logos

作者：[Fiona Lin][a]
选题：[lujun9972][b]
译者：[MareDevi](https://github.com/MareDEvi)
校对：[校对者ID](https://github.com/校对者ID)

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
