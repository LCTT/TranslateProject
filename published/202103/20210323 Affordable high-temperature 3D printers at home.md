[#]: subject: (Affordable high-temperature 3D printers at home)
[#]: via: (https://opensource.com/article/21/3/desktop-3d-printer)
[#]: author: (Joshua Pearce https://opensource.com/users/jmpearce)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13255-1.html)

在家就能用得起的高温 3D 打印机
======

> 有多实惠？低于 1000 美元。

![High-temperature 3D-printed mask][1]

3D 打印机从 20 世纪 80 年代就已经出现了，但是由于 [RepRap][2] 项目的出现，它们直到获得开源才受到人们的关注。RepRap 意即<ruby>自我复制快速原型机<rt>self-replicating rapid prototyper</rt></ruby>，它是一种基本上可以自己打印的 3D 打印机。它的开源计划[2004 年][3] 发布之后，导致 3D 打印机的成本从几十万美金降到了几百美金。

这些开源的桌面工具一直局限于 ABS 等低性能、低温热塑性塑料（如乐高积木）。市场上有几款高温打印机，但其高昂的成本（几万到几十万美元）使大多数人无法获得。直到最近，它们才参与了很多竞争，因为它们被一项专利 （US6722872B1） 锁定，该专利于 2021 年 2 月 27 日[到期][4]。

随着这个路障的消除，我们即将看到高温、低成本、熔融纤维 3D 打印机的爆发。

价格低到什么程度？低于 1000 美元如何。

在疫情最严重的时候，我的团队赶紧发布了一个 [开源高温 3D 打印机][5] 的设计，用于制造可高温消毒的个人防护装备（PPE）。该项目的想法是让人们能够 [用高温材料打印 PPE][6]（如口罩），并将它放入家用烤箱进行消毒。我们称我们的设备为 Cerberus，它具有以下特点：

  1. 可达到 200℃ 的加热床
  2. 可达到 500℃ 的热源
  3. 带有 1kW 加热器核心的隔离式加热室。
  4. 主电源（交流电源）电压室和床身加热，以便快速启动。

你可以用现成的零件来构建这个项目，其中一些零件你可以打印，价格不到 1000 美元。它可以成功打印聚醚酮酮 （PEKK） 和聚醚酰亚胺（PEI，以商品名 Ultem 出售）。这两种材料都比现在低成本打印机能打印的任何材料强得多。

![PPE printer][7]

这款高温 3D 打印机的设计是有三个头，但我们发布的时候只有一个头。Cerberus 是以希腊神话中的三头冥界看门狗命名的。通常情况下，我们不会发布只有一个头的打印机，但疫情改变了我们的优先级。[开源社区团结起来][9]，帮助解决早期的供应不足，许多桌面 3D 打印机都在产出有用的产品，以帮助保护人们免受 COVID 的侵害。

那另外两个头呢？

其他两个头是为了高温熔融颗粒制造（例如，这个开源的 [3D打印机][10] 的高温版本）并铺设金属线（像在 [这个设计][11] 中），以建立一个开源的热交换器。Cerberus 打印机的其他功能可能是一个自动喷嘴清洁器和在高温下打印连续纤维的方法。另外，你还可以在转台上安装任何你喜欢的东西来制造高端产品。

把一个盒子放在 3D 打印机周围，而把电子元件留在外面的 [专利][12] 到期，为高温家用 3D 打印机铺平了道路，这将使这些设备以合理的成本从单纯的玩具变为工业工具。

已经有公司在 RepRap 传统的基础上，将这些低成本系统推向市场（例如，1250 美元的 [Creality3D CR-5 Pro][13] 3D 打印机可以达到 300℃）。Creality 销售最受欢迎的桌面 3D 打印机，并开源了部分设计。

然而，要打印超高端工程聚合物，这些打印机需要达到 350℃ 以上。开源计划已经可以帮助桌面 3D 打印机制造商开始与垄断公司竞争，这些公司由于躲在专利背后，已经阻碍了 3D 打印 20 年。期待低成本、高温桌面 3D 打印机的竞争将真正升温！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/desktop-3d-printer

作者：[Joshua Pearce][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jmpearce
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/3d_printer_mask.jpg?itok=5ePZghTW (High-temperature 3D-printed mask)
[2]: https://reprap.org/wiki/RepRap
[3]: https://reprap.org/wiki/Wealth_Without_Money
[4]: https://3dprintingindustry.com/news/stratasys-heated-build-chamber-for-3d-printer-patent-us6722872b1-set-to-expire-this-week-185012/
[5]: https://doi.org/10.1016/j.ohx.2020.e00130
[6]: https://www.appropedia.org/Open_Source_High-Temperature_Reprap_for_3-D_Printing_Heat-Sterilizable_PPE_and_Other_Applications
[7]: https://opensource.com/sites/default/files/uploads/ppe-hight3dp.png (PPE printer)
[8]: https://www.gnu.org/licenses/fdl-1.3.html
[9]: https://opensource.com/article/20/3/volunteer-covid19
[10]: https://www.liebertpub.com/doi/10.1089/3dp.2019.0195
[11]: https://www.appropedia.org/Open_Source_Multi-Head_3D_Printer_for_Polymer-Metal_Composite_Component_Manufacturing
[12]: https://www.academia.edu/17609790/A_Novel_Approach_to_Obviousness_An_Algorithm_for_Identifying_Prior_Art_Concerning_3-D_Printing_Materials
[13]: https://creality3d.shop/collections/cr-series/products/cr-5-pro-h-3d-printer
