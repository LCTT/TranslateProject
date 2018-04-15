translating by kennethXia

5 keys to building open hardware
构建开源硬件的5个关键点
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openhardwaretools.png?itok=DC1RC_1f)
科学社区正在加速拥抱自由和开源硬件([FOSH][1]). 研究员正忙于[改进他们自己的装备][2]并创造数以百计基于分布式数字制造模型的设备来推动他们的研究。
The science community is increasingly embracing free and open source hardware ([FOSH][1]). Researchers have been busy [hacking their own equipment][2] and creating hundreds of devices based on the distributed digital manufacturing model to advance their scientific experiments.

热衷于 FOSH 的主要原因还是钱： 有研究表明，和专用设备相比，FOSH 可以[节约90%到99%的花费][3]。基于[开源硬件商业模式][4]的科学 FOSH 的商业化已经推动其快速地发展为一个新的工程领域，并为此定期[举行年会][5]。
A major reason for all this interest in distributed digital manufacturing of scientific FOSH is money: Research indicates that FOSH [slashes costs by 90% to 99%][3] compared to proprietary tools. Commercializing scientific FOSH with [open hardware business models][4] has supported the rapid growth of an engineering subfield to develop FOSH for science, which comes together annually at the [Gathering for Open Science Hardware][5].

特别的是，不止一本，而是两本关于这个主题的学术期刊：[Journal of Open Hardware] (由Ubiquity出版，一个新的开放访问出版商，同时出版了[Journal of Open Research Software][8])以及[HardwareX][9](由Elsevier出版的一种[自由访问期刊][10]，它是世界上最大的学术出版商之一)。
Remarkably, not one, but [two new academic journals][6] are devoted to the topic: the [Journal of Open Hardware][7] (from Ubiquity Press, a new open access publisher that also publishes the [Journal of Open Research Software][8] ) and [HardwareX][9] (an [open access journal][10] from Elsevier, one of the world's largest academic publishers).

由于学术社区的支持，科学 FOSH 的开发者在获取制作乐趣并推进科学快速发展的同时获得学术声望。
Because of the academic community's support, scientific FOSH developers can get academic credit while having fun designing open hardware and pushing science forward faster.

### 5 steps for scientific FOSH
### 科学 FOSH 的5个步骤

协恩 （Shane Oberloier）和我在名为Designes的自由问工程期刊上共同发表了一篇关于设计 FOSH 科学设备原则的文章。我们以滑动烘干机为例，制造成本低于20美元，仅是专用设备价格的三百分之一。[科学][1]和[医疗][12]设备往往比较复杂，开发 FOSH 替代品将带来巨大的回报。
Shane Oberloier and I co-authored a new [article][11] published in Designs, an open access engineering design journal, about the principles of designing FOSH scientific equipment. We used the example of a slide dryer, fabricated for under $20, which costs up to 300 times less than proprietary equivalents. [Scientific][1] and [medical][12] equipment tends to be complex with huge payoffs for developing FOSH alternatives.

我总结了5个步骤（包括6条设计原则），它们在协恩和我发表的文章里有详细阐述。这些设计原则也推广到非科学设备，而且制作越复杂的设计越能带来更大的潜在收益。
I've summarized the five steps (including six design principles) that Shane and I detail in our Designs article. These design principles can be generalized to non-scientific devices, although the more complex the design or equipment, the larger the potential savings.

如果你对科学项目的开源硬件设计感兴趣，这些步骤将使你的项目的影响最大化。
If you are interested in designing open hardware for scientific projects, these steps will maximize your project's impact.

  1. 评估类似现有工具的功能，你的 FOSH 设计目标应该针对实际效果而不是现有的设计（译者注：作者的意思应该是不要被现有设计缚住手脚）。必要的时候需进行概念证明。
  1. Evaluate similar existing tools for their functions but base your FOSH design on replicating their physical effects, not pre-existing designs. If necessary, evaluate a proof of concept.

  2. 使用下列设计原则：
  2. Use the following design principles:

  * 在设备生产中，仅适用自由和开源的软件工具链（比如，开源的CAD工具，例如[OpenSCAD][13], [FreeCAD][14], or [Blender][15]）和开源硬件。
  * Use only free and open source software toolchains (e.g., open source CAD packages such as [OpenSCAD][13], [FreeCAD][14], or [Blender][15]) and open hardware for device fabrication.
  * 尝试减少部件的数量和类型并降低工具的复杂度
  * Attempt to minimize the number and type of parts and the complexity of the tools.
  * 减少材料的数量和制造成本。
  * Minimize the amount of material and the cost of production.
  * 尽量使用方便易得的工具（比如 RepRap 3D 打印机）进行部件的分布式或数字化生产。
  * Maximize the use of components that can be distributed or digitally manufactured by using widespread and accessible tools such as the open source [RepRap 3D printer][16].
  * 对部件进行[参数化设计][17]，这使他人可以对你的设计进行个性化改动。相较于特例化设计，参数化设计会更有用。在未来的项目中，使用者可以通过修改核心参数来继续利用它们。
  * Create [parametric designs][17] with predesigned components, which enable others to customize your design. By making parametric designs rather than solving a specific case, all future cases can also be solved while enabling future users to alter the core variables to make the device useful for them.
  * 所有不能使用开源硬件进行分布制造的零件，必须选择现货产品以方便采购
  * All components that are not easily and economically fabricated with existing open hardware equipment in a distributed fashion should be chosen from off-the-shelf parts that are readily available throughout the world.

  3. 验证功能设计
  3. Validate the design for the targeted function(s).

  4. 提供关于设计、生产、装配、校准和操作的详尽文档。包括原始设计文件而不仅仅是设计输出。开源硬件协会对于开源设计的发布和文档化有额外的指南，总结如下：
  4. Meticulously document the design, manufacture, assembly, calibration, and operation of the device. This should include the raw source of the design, not just the files used for production. The Open Source Hardware Association has extensive [guidelines][18] for properly documenting and releasing open source designs, which can be summarized as follows:

  * 以通用的形式分享设计文件
  * Share design files in a universal type.
  * 提供详尽的材料清单，包括价格和采购信息
  * Include a fully detailed bill of materials, including prices and sourcing information.
  * 如果包含软件，确保代码对大众来说清晰易懂
  * If software is involved, make sure the code is clear and understandable to the general public.
  * 作为生产时的参考，必须提供足够的照片，以确保没有任何被遮挡的部分。
  * Include many photos so that nothing is obscured, and they can be used as a reference while manufacturing.
  * 在描述方法的章节，整个制作过程必须被细化成简单步骤以便复制此设计。
  * In the methods section, the entire manufacturing process must be detailed to act as instructions for users to replicate the design.
  * 在线上分享并指定许可证。这为用户提供了合理使用设计的信息。
  * Share online and specify a license. This gives users information on what constitutes fair use of the design.

  5. 主动分享！为了使 FOSH 发扬光大，设计必须被广泛、频繁和有效地分享以提升他们的存在感。所有的文档应该在开放存取文献中发表，并与适当的社区共享。[开源科学框架][19]是一个值得考虑的优雅的通用存储库，它由开源科学中心主办，该中心设置为接受任何类型的文件并处理大型数据集。
  5. Share aggressively! For FOSH to proliferate, designs must be shared widely, frequently, and noticeably to raise awareness of their existence. All documentation should be published in the open access literature and shared with appropriate communities. One nice universal repository to consider is the [Open Science Framework][19], hosted by the Center for Open Science, which is set up to take any type of file and handle large datasets.


这篇文章得到了 [Fulbright Finland][20] 的支持，该公司赞助了芬兰 Fulbright-Aalto 大学的特聘校席 Joshua Pearce 在开源科学硬件方面的研究工作。
This article was supported by [Fulbright Finland][20], which is sponsoring Joshua Pearce's research in open source scientific hardware in Finland as the Fulbright-Aalto University Distinguished Chair.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/5-steps-creating-successful-open-hardware

作者：[Joshua Pearce][a]
译者：[kennethXia](https://github.com/kennethXia)
校对：[校对者ID](https://github.com/校对者ID)

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
