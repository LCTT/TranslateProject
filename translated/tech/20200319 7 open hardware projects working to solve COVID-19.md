[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 open hardware projects working to solve COVID-19)
[#]: via: (https://opensource.com/article/20/3/open-hardware-covid19)
[#]: author: (Harris Kenny https://opensource.com/users/harriskenny)

应对新冠病毒事件的 7 个开放硬件项目
======
> 开放硬件解决方案可以为抵御新型冠状病毒的传播和痛苦做出贡献。

![open on blue background with heartbeat symbol][1]

开源[硬件][2]运动长期以来一直主张维修权的重要性，完全拥有所购买的技术，并能够像音乐一样重新组合和复制组件。因此，在这个充满挑战的时期内，开放硬件为由冠状病毒大流行引起的一些问题提供了一些答案。

### 背景概述

首先，全球的硬件开发人员正在努力使用开源解决供应链中的弱点，在过去 30 年中，这种理念推动了新软件技术的大量涌现。过去在硬件运动方面的成功，如 [RepRap Project][3]，[Open Source Ecology][4] 和 [Open Source Beehives][5]，证明了这一点是可以做到的。

对使用 3D 打印和其他技术按需制造安全设备的替换零件和按需生产的创作者的兴趣日益增加。例如，香港理工大学实验室为医院工作人员提供 [3D 打印面罩][6]。意大利初创公司 Isinnova 与米兰 FabLab 合作，为受重灾的意大利北部提供用于呼吸机的 [3D 打印替换阀][7]。公司们还发布了设计以适应我们的物理接触，例如 Materialise 的 [3D 打印免提开门器] [8]。这些更换零件和解决问题的示例是一个很好的起点，为挽救生命做出了努力。

另一种传统的硬件技术正在加速发展：缝纫。法新社报道说，全球急需口罩，来自世界卫生组织的指导也指明了其重要性。随着一次性口罩要优先供给于医护人员，捷克共和国的人们[开始缝制自己的口罩][9]。（重复使用的口罩确实会带来细菌问题。）Facebook 小组“捷克缝制口罩”开始在他们的国家解决这个问题，成千上万的成员开始用起了他们的家用缝纫机。

开源硬件设备和机械项目也越来越受欢迎。首先，有一些测试性设备具备高精度且功能强大。其次，在没有其他选择方案的情况下，有一些医疗设备可以归类为现场级（最好）。这些项目将在下面详细概述。

为了解更多信息，我与总部位于芝加哥的 [Tapster Robotics][10] 的创始人兼首席执行官 Jason Huggins 进行了交谈。Tapster Robotics 使用 3 D打印、计算机数控（CNC）加工和 [Arduino][11] 等开放式电子产品设计和制造台式机器人。他兼具技术知识和工业能力，具有很高的影响力。他想投入自己公司的资源来帮助这场斗争。

“基本上，我们现在正处于第二次世界大战的动员时刻。即使我不是医生，我们仍然应该遵循希波克拉底誓言。无论我做什么，我都不想让问题变得更糟，” Huggins 解释。他认为：“作为对策，世卫组织执行主任 Michael Ryan 博士发表了这样的评论：‘速度胜过完美’。”

> 哇
>
> 这个人是疾病传播的全球权威。如果您是领导者（无论以何种身份），请注意。如果不是，也请注意。 [pic.twitter.com/bFogaekehM][12]
>
> — Jim RichardsSh🎙wgram（@JIMrichards1010）[2020 年 3 月 15 日][13]

Huggins 在应需提供方面具有丰富的经验。他的努力有助于 [Healthcare.gov][14] 在挑战性的最初启动后得以扩展。他还创建了软件行业标准的测试框架 Selenium 和 Appium。有了这一经验，他的建议非常值得考虑。

我还与 [Tyson Law][15] 的西雅图律师 Mark Tyson 进行了交谈，他与初创公司和小型企业合作。他在快速发展的行业中与敏捷公司合作有着直接的经验。在阐述整个问题时，Tyson 说到：

> 《<ruby>善良的撒玛利亚人法<rt>Good Samaritan law</rt></ruby>》保护志愿者（即“好撒玛利亚人”）免于因其决定在紧急情况下提供援助而承担责任。尽管这些法律的具体内容因州而异，但它们具有共同的公共政策依据：即鼓励旁观者帮助遇到紧急情况的其他人。可以想象，除了传统的把车祸的受害者从伤害中拉出来之外，这种理论依据可以证明在不太传统的环境中应用这类法律的合理性。

对于这种特定情况，Tyson 指出：

> “在采取行动之前，创客们明智的做法是与律师沟通一下，以针对特定的州进行风险评估。还应谨慎地要求大型机构（例如医院或保险公司）通过合同接受潜在的责任风险，例如，通过使用赔偿协议，使医院或其保险人同意赔偿创客们的责任。”

Tyson 明白情况的紧迫性和严重性。使用合同的这种选择并不意味着障碍。相反，这可能是一种帮助其大规模采用的方法，以更快地产生更大的变化。这取决于你或你的机构。

综上所述，让我们探索正在使用或正在开发中的项目（可能很快就可以部署）。

### 7 open hardware projects fighting COVID-19

#### Opentrons

[Opentrons][16]' open source lab automation platform is comprised of a suite of open source hardware, verified labware, consumables, reagents, and workstations. Opentrons says its products can help dramatically [scale-up COVID-19 testing][17] with systems that can "automate up to 2,400 tests per day within days of an order being placed." It plans to ramp up to 1 million tested samples by July 1.

![Opentrons roadmap graphic][18]

From the Opentrons [website][17], Copyright

The company is already working with federal and local government agencies to determine if its systems can be used for clinical diagnosis under an [emergency use authorization][19]. Opentrons is shared under an [Apache 2.0 license][20]. I first learned of it from biologist Kristin Ellis, who is affiliated with the project.

#### Chai Open qPCR

Chai's [Open qPCR][21] device uses [polymerase chain reaction][22] (PCR) to rapidly test swabs from surfaces (e.g., door handles and elevator buttons) to see if the novel coronavirus is present. This open source hardware shared under an [Apache 2.0 license][23] uses a [BeagleBone][24] low-power Linux computer. Data from the Chai Open qPCR can enable public health, civic, and business leaders to make more informed decisions about cleaning, mitigation, facility closures, contract tracing, and testing.

#### OpenPCR

[OpenPCR][25] is a PCR testing device kit from Josh Perfetto and Jessie Ho, the creators behind the Chai Open qPCR. This is more of a DIY open source device than their previous project, but it has the same use case: using environmental testing to identify the coronavirus in the field. As the project page states, "traditional real-time PCR machines capable of detecting these pathogens typically cost upwards of $30,000 US dollars and are not suitable for field usage." Because OpenPCR is a kit users build and is shared under a [GPLv3.0 license][26], the device aims to democratize access to molecular diagnostics.

![OpenPCR][27]

From the OpenPCR [website][25], Copyright

And, like any good open source project, there is a derivative! [WildOpenPCR][28] by [GaudiLabs][29] in Switzerland is also shared under a [GPLv3.0 license][30].

#### PocketPCR

Gaudi Labs' [PocketPCR][31] thermocycler is used to activate biological reactions by raising and lowering the temperature of a liquid in small test tubes. It can be powered with a simple USB power adapter, either tethered to a device or on its own, with preset parameters that don't require a computer or smartphone.

![PocketPCR][32]

From the PocketPCR [website][31], Copyright

Like the other PCR options described in this article, this device may facilitate environmental testing for coronavirus, although its project page does not explicitly state so. PocketPCR is shared under a [GPLv3.0 license][33].

#### Open Lung Low Resource Ventilator

The [Open Lung Low Resource Ventilator][34] is a quick-deployment ventilator that utilizes a [bag valve mask][35] (BVM), also known as an Ambu-bag, as a core component. Ambu-bags are mass-produced, certified, small, mechanically simple, and adaptable to both invasive tubing and masks. The OPEN LUNG ventilator will use micro-electronics to sense and control air pressure and flow, with the goal to enable semi-autonomous operation.

![Open Lung ventilator][36]

Open Lung [on GitLab][37]

This early-stage project boasts a large team with hundreds of contributors, led by: Colin Keogh, David Pollard, Connall Laverty, and Gui Calavanti. It is shared under a [GPLv3.0 license][38].

#### Pandemic Ventilator

The [Pandemic Ventilator][39] is a DIY ventilator prototype. Like the RepRap project, it uses commonly available hardware components in its design. The project was uploaded by user Panvent to Instructables more than 10 years ago, and there are six major steps to producing it. The project is shared under a [CC BY-NC-SA license][39]. This video shows the system in action:

#### Folding at Home

[Folding at Home][40] is a distributed computing project for simulating protein dynamics, including the process of protein folding and the movements of proteins implicated in a variety of diseases. It is a call-to-action for citizen scientists, researchers, and volunteers to use their computers at home to help run simulations, similar to the decommissioned [SETI@Home project][41]. If you're a technologist with capable computer hardware, Folding at Home is for you.

![Markov state model][42]

Vincent Voelz, CC BY-SA 3.0

Folding at Home uses Markov state models (shown above) to model the possible shapes and folding pathways a protein can take in order to look for new therapeutic opportunities. You can find out more about the project in Washington University biophysicist Greg Bowman's post on [how it works and how you can help][43].

The project involves a consortium of academic laboratories, contributors, and corporate sponsors from many countries, including Hong Kong, Croatia, Sweden, and the United States. Folding at Home is shared under a [mix of GPL and proprietary licenses][44] on [GitHub][45] and is multi-platform for Windows, macOS, and GNU/Linux (e.g., Debian, Ubuntu, Mint, RHEL, CentOS, Fedora).

### Many other interesting projects

These projects are just a fraction of the activity happening in the open hardware space to solve or treat COVID-19. In researching this article, I discovered other projects worth exploring, such as:

  * [Open source ventilators, oxygen concentrators, etc.][46] by Coronavirus Tech Handbook
  * [Helpful engineering][47] by ProjectOpenAir
  * [Open source ventilator hackathon][48] on Hackaday
  * [Specifications for simple open source mechanical ventilator][49] by Johns Hopkins emergency medicine resident Julian Botta
  * [Coronavirus-related phishing, malware, and randomware on the rise][50] by Shannon Morse
  * [Converting a low-cost CPAP blower into a rudimentary ventilator][51] by jcl5m1
  * [Forum A.I.R.E. discussion on open respirators and fans][52] (Spanish/español)
  * [Special Issue on Open-Source COVID19 Medical Hardware][53] by Elsevier HardwareX



These projects are based all over the world, and this type of global cooperation is exactly what we need, as the virus ignores borders. The novel coronavirus pandemic affects countries at different times and in different ways, so we need a distributed approach.

As my colleague Steven Abadie and I write in the [OSHdata 2020 Report][54], the open source hardware movement is a global movement. Participating individuals and organizations with certified projects are located in over 35 countries around the world and in every hemisphere.

![Open source hardware map][55]

OSHdata, CC BY-SA 4.0 International

If you are interested in joining this conversation with open source hardware developers around the world, join the [Open Hardware Summit Discord][56] server with a dedicated channel for conversations about COVID-19. You can find roboticists, designers, artists, firmware and mechanical engineers, students, researchers, and others who are fighting this war together. We hope to see you there.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/open-hardware-covid19

作者：[Harris Kenny][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
