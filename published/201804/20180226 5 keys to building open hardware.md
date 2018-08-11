构建开源硬件的 5 个关键点
======

> 最大化你的项目影响。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openhardwaretools.png?itok=DC1RC_1f)

科学社区正在加速拥抱<ruby>自由及开源硬件<rt>Free and Open Source Hardware</rt></ruby>（[FOSH][1]）。 研究员正忙于[改进他们自己的装备][2]并创造数以百计的基于分布式数字制造模型的设备来推动他们的研究。

热衷于 FOSH 的主要原因还是钱： 有研究表明，和专用设备相比，FOSH 可以[节省 90% 到 99% 的花费][3]。基于[开源硬件商业模式][4]的科学 FOSH 的商业化已经推动其快速地发展为一个新的工程领域，并为此定期[举行 GOSH 年会][5]。

特别的是，不止一本，而是关于这个主题的[两本学术期刊]：[Journal of Open Hardware] （由 Ubiquity 出版，一个新的自由访问出版商，同时出版了 [Journal of Open Research Software][8] ）以及 [HardwareX][9]（由 Elsevier 出版的一种[自由访问期刊][10]，它是世界上最大的学术出版商之一）。

由于学术社区的支持，科学 FOSH 的开发者在获取制作乐趣并推进科学快速发展的同时获得学术声望。

### 科学 FOSH 的5个步骤

Shane Oberloier 和我在名为 Designs 的自由访问工程期刊上共同发表了一篇关于设计 FOSH 科学设备原则的[文章][11]。我们以滑动式烘干机为例，制造成本低于 20 美元，仅是专用设备价格的三百分之一。[科学][1]和[医疗][12]设备往往比较复杂，开发 FOSH 替代品将带来巨大的回报。

我总结了 5 个步骤（包括 6 条设计原则），它们在 Shane Oberloier 和我发表的文章里有详细阐述。这些设计原则也可以推广到非科学设备，而且制作越复杂的设计越能带来更大的潜在收益。

如果你对科学项目的开源硬件设计感兴趣，这些步骤将使你的项目的影响最大化。

1. 评估类似现有工具的功能，你的 FOSH 设计目标应该针对实际效果而不是现有的设计（LCTT 译注：作者的意思应该是不要被现有设计缚住手脚）。必要的时候需进行概念证明。
2. 使用下列设计原则： 
  * 在设备生产中，仅使用自由和开源的软件工具链（比如，开源的 CAD 工具，例如 [OpenSCAD][13]、 [FreeCAD][14] 或 [Blender][15]）和开源硬件。  
  * 尝试减少部件的数量和类型并降低工具的复杂度
  * 减少材料的数量和制造成本。
  * 尽量使用能够分发的部件或使用方便易得的工具（比如 [RepRap 3D 打印机][16]）进行部件的数字化生产。
  * 对部件进行[参数化设计][17]，这使他人可以对你的设计进行个性化改动。相较于特例化设计，参数化设计会更有用。在未来的项目中，使用者可以通过修改核心参数来继续利用它们。
  * 所有不能使用现有的开源硬件以分布式的方式轻松且经济地制造的零件，必须选择现货产品以方便采购。
3. 验证功能设计。
4. 提供关于设计、生产、装配、校准和操作的详尽设备文档。包括原始设计文件而不仅仅是用于生产的。<ruby>开源硬件协会<rt>Open Source Hardware Association</rt></ruby>对于开源设计的发布和文档化有额外的[指南][18]，总结如下：
  * 以通用的形式分享设计文件。
  * 提供详尽的材料清单，包括价格和采购信息。
  * 如果涉及软件，确保代码对大众来说清晰易懂。
  * 作为生产时的参考，必须提供足够的照片，以确保没有任何被遮挡的部分。
  * 在描述方法的章节，整个制作过程必须被细化成简单步骤以便复制此设计。
  * 在线上分享并指定许可证。这为用户提供了合理使用该设计的信息。
5. 主动分享！为了使 FOSH 发扬光大，设计必须被广泛、频繁和有效地分享以提升它们的存在感。所有的文档应该在自由访问文献中发表，并与适当的社区共享。<ruby>[开源科学框架][19]<rt>Open Science Framework</rt></ruby>是一个值得考虑的优雅的通用存储库，它由<ruby>开源科学中心<rt>Center for Open Science</rt></ruby>主办，该中心设置为接受任何类型的文件并处理大型数据集。

这篇文章得到了 [Fulbright Finland][20] 的支持，该公司赞助了芬兰 Fulbright-Aalto 大学的特聘校席 Joshua Pearce 在开源科学硬件方面的研究工作。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/5-steps-creating-successful-open-hardware

作者：[Joshua Pearce][a]
译者：[kennethXia](https://github.com/kennethXia)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jmpearce
[1]:https://opensource.com/business/16/4/how-calculate-open-source-hardware-return-investment
[2]:https://opensource.com/node/16840
[3]:http://www.appropedia.org/Open-source_Lab
[4]:https://www.academia.edu/32004903/Emerging_Business_Models_for_Open_Source_Hardware
[5]:http://openhardware.science/
[6]:https://opensource.com/life/16/7/hardwarex-open-access-journal
[7]:https://openhardware.metajnl.com/
[8]:https://openresearchsoftware.metajnl.com/
[9]:https://www.journals.elsevier.com/hardwarex
[10]:https://opensource.com/node/30041
[11]:https://www.academia.edu/35603319/General_Design_Procedure_for_Free_and_Open-Source_Hardware_for_Scientific_Equipment
[12]:https://www.academia.edu/35382852/Maximizing_Returns_for_Public_Funding_of_Medical_Research_with_Open_source_Hardware
[13]:http://www.openscad.org/
[14]:https://www.freecadweb.org/
[15]:https://www.blender.org/
[16]:http://reprap.org/
[17]:https://en.wikipedia.org/wiki/Parametric_design
[18]:https://www.oshwa.org/sharing-best-practices/
[19]:https://osf.io/
[20]:http://www.fulbright.fi/en
