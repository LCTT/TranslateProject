[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12047-1.html)
[#]: subject: (7 open hardware projects working to solve COVID-19)
[#]: via: (https://opensource.com/article/20/3/open-hardware-covid19)
[#]: author: (Harris Kenny https://opensource.com/users/harriskenny)

应对新冠病毒的 7 个开源硬件项目
======

> 开源硬件解决方案可以为抵御新型冠状病毒的传播和痛苦做出贡献。

![](https://img.linux.net.cn/data/attachment/album/202003/29/103909f50gm91z22twuv23.jpg)

开源[硬件][2]运动长期以来一直主张维修权的重要性，完全拥有所购买的技术，并能够像音乐一样重新组合和复制部件。因此，在这个充满挑战的时期内，开源硬件为由冠状病毒大流行引起的一些问题提供了一些答案。

### 背景概述

首先，全球的硬件开发人员正在努力使用开源解决供应链中的弱点，在过去 30 年中，这种理念推动了新软件技术的大量涌现。过去在硬件运动方面的成功，如 [RepRap Project][3]、[Open Source Ecology][4] 和 [Open Source Beehives][5]，证明了这一点是可以做到的。

对于使用 3D 打印和其他技术按需生产安全设备和按需制造它的替换零件，创客们的兴趣日益增加。例如，香港理工大学实验室为医院工作人员提供 [3D 打印面罩][6]。意大利初创公司 Isinnova 与米兰 FabLab 合作，为受重灾的意大利北部提供用于呼吸机的 [3D 打印替换阀][7]。公司们还发布了设计以适应我们的物理接触需求，例如 Materialise 的 [3D 打印免提开门器][8]。这些更换零件和解决问题的示例是一个很好的起点，为挽救生命做出了努力。

另一种传统的硬件技术正在加速发展：缝纫。法新社报道说，全球急需口罩，来自世界卫生组织的指导也指明了其重要性。随着一次性口罩要优先供给于医护人员，捷克共和国的人们[开始缝制自己的口罩][9]。（重复使用的口罩确实会带来细菌问题。）Facebook 小组“捷克缝制口罩”开始在他们的国家解决这个问题，成千上万的成员开始用起了他们的家用缝纫机。

开源硬件设备和机械项目也越来越受欢迎。首先，有一些测试性设备具备高精度且功能强大。其次，在没有其他选择方案的情况下，有一些医疗设备（顶多）可以归类为现场级。这些项目将在下面详细概述。

为了解更多信息，我与总部位于芝加哥的 [Tapster Robotics][10] 的创始人兼首席执行官 Jason Huggins 进行了交谈。Tapster Robotics 使用 3D 打印、计算机数控（CNC）加工和 [Arduino][11] 等开源电子产品设计和制造台式机器人。他兼具技术知识和工业能力，具有很高的影响力。他想投入自己公司的资源来帮助这场斗争。

“基本上，我们现在正处于第二次世界大战的动员时刻。即使我不是医生，我们仍然应该遵循希波克拉底誓言。无论我做什么，我都不想让问题变得更糟”，Huggins 解释，他认为：“作为对策，世卫组织执行主任 Michael Ryan 博士发表了这样的评论：‘速度胜过完美’。”

> 哇！
>
> 这个人是疾病传播的全球权威。如果您是领导者（无论以何种身份），请注意。如果不是，也请注意。 
> 
> [pic.twitter.com/bFogaekehM][12]
>
> — Jim RichardsSh🎙wgram（@JIMrichards1010）[2020 年 3 月 15 日][13]

Huggins 在应需提供方面具有丰富的经验。他的努力有助于 [Healthcare.gov][14] 在挑战性的最初启动后得以扩展。他还创建了软件行业标准的测试框架 Selenium 和 Appium。有了这一经验，他的建议非常值得考虑。

我还与 [Tyson Law][15] 的西雅图律师 Mark Tyson 进行了交谈，他的合作对象是初创公司和小型企业。他在快速发展的行业中与敏捷公司合作有着直接的经验。在阐述整个问题时，Tyson 说到：

> 《<ruby>善良的撒玛利亚人法<rt>Good Samaritan law</rt></ruby>》保护志愿者（即“好撒玛利亚人”）免于因其在紧急情况下提供援助的决定而承担责任。尽管这些法律的具体内容因州而异，但它们具有共同的公共政策依据：即鼓励旁观者帮助遇到紧急情况的其他人。可以想象，除了传统的把车祸的受害者从伤害中拉出来之外，这种理论依据可以证明在不太传统的环境中应用这类法律的合理性。

对于这种特定情况，Tyson 指出：

> “在采取行动之前，创客们明智的做法是与律师沟通一下，以针对特定的州进行风险评估。还应谨慎地要求大型机构（例如医院或保险公司）通过合同接受潜在的责任风险，例如，通过使用赔偿协议，使医院或其保险人同意赔偿创客们的责任。”

Tyson 明白情况的紧迫性和严重性。使用合同的这种选择并不意味着障碍。相反，这可能是一种帮助其大规模采用的方法，以更快地产生更大的变化。这取决于你或你的机构。

综上所述，让我们探索正在使用或正在开发中的项目（可能很快就可以部署）。

### 7 个与新冠病毒对抗的开源硬件项目

#### Opentrons

[Opentrons][16] 的开源实验室自动化平台由一套开源硬件、经过验证的实验室器具、消耗品、试剂和工作站组成。Opentrons 表示，其产品可以“在下订单后几天内每天自动进行多达 2400 个测试”的系统，可以极大地帮助提高[新冠病毒测试规模][17]。它计划在 7 月 1 日之前提升到多达 100 万个测试样本。

![Opentrons roadmap graphic][18]

*来自 Opentrons [网站][17]，版权所有*

该公司已经在与联邦和地方政府机构合作，以确定其系统是否可以在[紧急使用授权][19]下用于临床诊断。 Opentrons 在 [Apache 2.0 许可证][20]下共享。我最初是从与该项目有联系的生物学家 Kristin Ellis 那里得知它的。

#### Chai 的 Open qPCR

Chai 的 [Open qPCR][21] 设备使用[聚合酶链反应][22]（PCR）快速检测物品表面（例如，门把手和电梯按钮）上的拭子，以查看是否存在新型冠状病毒。这种在 [Apache 2.0 许可证][23]下共享的开源硬件使用 [BeagleBone][24] 低功耗 Linux 计算机。Chai 的 Open qPCR 提供的数据可以使公共卫生、公民和企业领导者做出有关清洁、缓解、关闭设施、接触追踪和测试的更明智的决策。

#### OpenPCR

[OpenPCR][25] 是 Chai Open qPCR 的创建者 Josh Perfetto 和 Jessie Ho 的 PCR 测试设备套件。与他们的前一个项目相比，这更像是一种 DIY 开源设备，但它具有相同的使用场景：使用环境测试来识别野外冠状病毒。正如该项目页面所指出的那样，“能够检测这些病原体的传统实时 PCR 设备通常花费超过 30,000 美元，而且不适合在现场使用。”由于 OpenPCR 是用户构建的工具包，并且在 [GPLv3.0 许可证][26]下共享，因此该设备旨在使分子诊断的访问大众化。

![OpenPCR][27]

*来自 OpenPCR [网站][25]，版权所有*

而且，就像任何优秀的开源项目一样，它也有一个衍生产品！瑞士的 [Gaudi Labs][29] 推出的  [WildOpenPCR][28] 也以 [GPLv3.0 许可证][30]共享。

#### PocketPCR

Gaudi Labs 的 [PocketPCR][31] 热循环仪可通过升高和降低小试管中液体的温度来激活生物反应。它可以通过简单的 USB 电源适配器供电，该适配器可以绑定到设备上，也可以单独使用，不使用计算机或智能手机时可使用预设参数。

![PocketPCR][32]

*来自 PocketPCR [网站][31]，版权所有*

与本文所述的其他 PCR 产品一样，此设备可能有助于对冠状病毒进行环境测试，尽管其项目页面并未明确说明。PocketPCR 在 [GPLv3.0 许可证][33]下共享。

#### Open Lung 低资源呼吸机

[Open Lung 低资源呼吸机][34]是一种快速部署的呼吸机，它以[气囊阀罩][35]（BVM）（也称为 Ambu 气囊）为核心组件。Ambu 气囊已批量生产，经过认证，体积小，机械简单，并且适用于侵入性导管和口罩。 Open Lung 呼吸机使用微电子技术来感测和控制气压和流量，以实现半自主运行。

![Open Lung ventilator][36]

*Open Lung，[GitLab][37]*

这个早期项目拥有一支由数百名贡献者组成的大型团队，领导者包括：Colin Keogh、David Pollard、Connall Laverty 和 Gui Calavanti。它是以 [GPLv3.0 许可证][38]共享的。

#### Pandemic 呼吸机

[Pandemic 呼吸机][39]是 DIY 呼吸机的原型。像 RepRap 项目一样，它在设计中使用了常用的硬件组件。该项目已由用户 Panvent 于 10 多年前上传到 Instructables，并且有六个主要的生产步骤。该项目是以 [CC BY-NC-SA 许可证][39]共享的。

#### Folding at Home

[Folding at Home][40] 是一个分布式计算项目，用于模拟蛋白质动力学，包括蛋白质折叠的过程以及与多种疾病有关的蛋白质运动。这是一个面向公民科学家、研究人员和志愿者的行动呼吁，类似于退役的 [SETI@Home 项目][41]使用家中的计算机来运行解码计算。如果你是具备强大计算机硬件功能的技术人员，那么这个项目适合你。

![Markov state model][42]

*Vincent Voelz，CC BY-SA 3.0*

Folding at Home 项目使用马尔可夫状态模型（如上所示）来建模蛋白质可能采取的形状和折叠途径，以寻找新的治疗机会。你可以在华盛顿大学生物物理学家 Greg Bowman 的帖子《[它是如何运作的以及如何提供帮助][43]》中找到有关该项目的更多信息。

该项目涉及来自许多国家和地区（包括香港、克罗地亚、瑞典和美国）的财团的学术实验室、贡献者和公司赞助者。 在 [GitHub][45] 上，[在混合了 GPL 和专有许可证][44]下共享，并且可以在 Windows、macOS 和 GNU/Linux（例如 Debian、Ubuntu、Mint、RHEL、CentOS、Fedora）。

### 许多其他有趣的项目

这些项目只是在开源硬件领域中解决或治疗新冠病毒活动中的一小部分。在研究本文时，我发现了其他值得探索的项目，例如：

* Coronavirus Tech Handbook 提供的[开源呼吸机、氧气浓缩器等][46]
* 来自 ProjectOpenAir 的 [有用的工程][47]
* Hackaday 上的[开源呼吸机黑客马拉松][48]
* 约翰·霍普金斯急诊医学住院医师 Julian Botta 的[简单开源机械呼吸机规范][49]
* [与冠状病毒有关的网络钓鱼、恶意软件和随机软件正在增加][50]，作者：Shannon Morse
* [将低成本的 CPAP 鼓风机转换为基本呼吸机][51]，作者： jcl5m1
* [A.I.R.E. 论坛上关于开源呼吸器和风扇的讨论][52]（西班牙语）
* [关于新冠病毒的开源医疗硬件的特殊问题][53]，作者：Elsevier HardwareX

这些项目遍布全球，而这种全球合作正是我们所需要的，因为病毒无视国界。新冠病毒大流行在不同时期以不同方式影响国家，因此我们需要一种分布式方法。

正如我和同事 Steven Abadie 在 [OSHdata 2020 报告][54]中所写的那样，开源硬件运动是全球性运动。参与该认证项目的个人和组织遍布全球 35 个国家地区和每个半球。

![Open source hardware map][55]

*OSHdata，CC BY-SA 4.0 国际版*

如果你有兴趣加入这场与全球开源硬件开发人员的对话，请加入[开源硬件峰会的 Discord][56] 服务器，并通过专用渠道进行有关新冠病毒的讨论。你在这里可以找到机器人专家、设计师、艺术家、固件和机械工程师、学生、研究人员以及其他共同为这场战争而战的人。希望可以看到你。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/open-hardware-covid19

作者：[Harris Kenny][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/harriskenny
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/health_heartbeat.png?itok=P-GXea-p (open on blue background with heartbeat symbol)
[2]: https://opensource.com/resources/what-open-hardware
[3]: https://reprap.org/wiki/RepRap
[4]: https://www.opensourceecology.org/
[5]: https://www.osbeehives.com/
[6]: https://www.scmp.com/news/hong-kong/health-environment/article/3052135/polytechnic-university-lab-3d-printing-face
[7]: https://www.3dprintingmedia.network/covid-19-3d-printed-valve-for-reanimation-device/
[8]: https://www.3dprintingmedia.network/materialise-shows-3d-printed-door-opener-for-coronavirus-containment-efforts/
[9]: https://news.yahoo.com/stitch-time-czechs-sew-combat-virus-mask-shortage-205213804.html
[10]: http://tapster.io/
[11]: https://opensource.com/life/15/5/arduino-or-raspberry-pi
[12]: https://t.co/bFogaekehM
[13]: https://twitter.com/JIMrichards1010/status/1239140710558969857?ref_src=twsrc%5Etfw
[14]: http://Healthcare.gov
[15]: https://www.marktysonlaw.com/
[16]: https://opentrons.com/
[17]: https://blog.opentrons.com/testing-for-covid-19-with-opentrons/
[18]: https://opensource.com/sites/default/files/uploads/opentrons.png (Opentrons roadmap graphic)
[19]: https://www.fda.gov/regulatory-information/search-fda-guidance-documents/policy-diagnostics-testing-laboratories-certified-perform-high-complexity-testing-under-clia-prior
[20]: https://github.com/Opentrons/opentrons/blob/edge/LICENSE
[21]: https://www.chaibio.com/openqpcr
[22]: https://en.wikipedia.org/wiki/Polymerase_chain_reaction
[23]: https://github.com/chaibio/chaipcr
[24]: https://beagleboard.org/bone
[25]: https://openpcr.org/
[26]: https://github.com/jperfetto/OpenPCR/blob/master/license.txt
[27]: https://opensource.com/sites/default/files/uploads/openpcr.png (OpenPCR)
[28]: https://github.com/GenericLab/WildOpenPCR
[29]: http://www.gaudi.ch/GaudiLabs/?page_id=328
[30]: https://github.com/GenericLab/WildOpenPCR/blob/master/license.txt
[31]: http://gaudi.ch/PocketPCR/
[32]: https://opensource.com/sites/default/files/uploads/pocketpcr.png (PocketPCR)
[33]: https://github.com/GaudiLabs/PocketPCR/blob/master/LICENSE
[34]: https://gitlab.com/TrevorSmale/low-resource-ambu-bag-ventilor
[35]: https://en.wikipedia.org/wiki/Bag_valve_mask
[36]: https://opensource.com/sites/default/files/uploads/open-lung.png (Open Lung ventilator)
[37]: https://gitlab.com/TrevorSmale/low-resource-ambu-bag-ventilor/-/blob/master/images/CONCEPT_1_MECH.png
[38]: https://gitlab.com/TrevorSmale/low-resource-ambu-bag-ventilor/-/blob/master/LICENSE
[39]: https://www.instructables.com/id/The-Pandemic-Ventilator/
[40]: https://foldingathome.org/
[41]: https://setiathome.ssl.berkeley.edu/
[42]: https://opensource.com/sites/default/files/uploads/foldingathome.png (Markov state model)
[43]: https://foldingathome.org/2020/03/15/coronavirus-what-were-doing-and-how-you-can-help-in-simple-terms/
[44]: https://en.wikipedia.org/wiki/Folding@home
[45]: https://github.com/FoldingAtHome
[46]: https://coronavirustechhandbook.com/hardware
[47]: https://app.jogl.io/project/121#about
[48]: https://hackaday.com/2020/03/12/ultimate-medical-hackathon-how-fast-can-we-design-and-deploy-an-open-source-ventilator/
[49]: https://docs.google.com/document/d/1FNPwrQjB1qW1330s5-S_-VB0vDHajMWKieJRjINCNeE/edit?fbclid=IwAR3ugu1SGMsacwKi6ycAKJFOMduInSO4WVM8rgmC4CgMJY6cKaGBNR14mpM
[50]: https://www.youtube.com/watch?v=dmQ1twpPpXA
[51]: https://github.com/jcl5m1/ventilator
[52]: https://foro.coronavirusmakers.org/
[53]: https://www.journals.elsevier.com/hardwarex/call-for-papers/special-issue-on-open-source-covid19-medical-hardware
[54]: https://oshdata.com/2020-report
[55]: https://opensource.com/sites/default/files/uploads/oshdata-country.png (Open source hardware map)
[56]: https://discord.gg/duAtG5h
