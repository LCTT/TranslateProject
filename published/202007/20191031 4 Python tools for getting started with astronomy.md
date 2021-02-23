[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12459-1.html)
[#]: subject: (4 Python tools for getting started with astronomy)
[#]: via: (https://opensource.com/article/19/10/python-astronomy-open-data)
[#]: author: (Gina Helfrich, Ph.D. https://opensource.com/users/ginahelfrich)

开启天文之路的 4 个 Python 工具
======

> 使用 NumPy、SciPy、Scikit-Image 和 Astropy 探索宇宙

![](https://img.linux.net.cn/data/attachment/album/202007/27/223146sjfgbj9jfu9m1z2c.jpg)

### 天文学与 Python

对科学界而言，尤其是对天文学界来说，Python 是一种伟大的语言工具。各种软件包，如 [NumPy][5]、[SciPy][6]、[Scikit-Image][7] 和 [Astropy][8]，（仅举几例） ，都充分证明了 Python 对天文学的适用性，而且有很多用例。（NumPy、Astropy 和 SciPy 是 NumFOCUS 提供资金支持的项目；Scikit-Image 是个隶属项目）。我在十几年前脱离天文研究领域，成为了软件开发者之后，对这些工具包的演进一直很感兴趣。我的很多前天文界同事在他们的研究中，使用着前面提到的大部分甚至是全部工具包。以我为例，我也曾为位于智利的超大口径望远镜（VLT）上的仪器编写过专业天文软件工具包。

最近令我吃惊的是，Python 工具包竟然演进到如此好用，任何人都可以轻松编写 <ruby>[数据还原][9]<rt>data reduction</rt></ruby> 脚本，产生出高质量的数据产品。天文数据易于获取，而且大部分是可以公开使用的，你要做的只是去寻找相关数据。

比如，负责 VLT 运行的 ESO，直接在他们的网站上提供数据下载服务，只要访问 [www.eso.org/UserPortal][10] 并在首页创建用户就可以享有数据下载服务。如果你需要 SPHERE 数据，可以下载附近任何一个包含<ruby>系外行星<rt>exoplanet</rt></ruby>或者<ruby>原恒星盘<rt>proto-stellar discs</rt></ruby>的恒星的全部数据集。对任何 Python 高手而言，通过还原数据发现深藏于噪声中的行星或者原恒星盘，实在是件令人兴奋的事。

我鼓励你下载 ESO 或其它天文影像数据，开启你的探索历程。这里提供几条建议：

1. 首先要有一个高质量的数据集。看一些有关包含系外行星或者原恒星盘的较近恒星的论文，然后在 <http://archive.eso.org/wdb/wdb/eso/sphere/query> 之类的网站检索数据。需要注意的是，前述网站上的数据有的标注为红色，有的标注为绿色，标注为红色的数据是尚未公开的，在相应的“发布日期”处会注明数据将来公开的时间。
2. 了解一些用于获取你所用数据的仪器的信息。尽量对数据的获取有一个基本的理解，对标准的数据还原之后应该是什么样子做到心中有数。所有的望远镜和仪器都有这方面的文档供公开获取。
3. 必须考虑天文数据的标准问题，并予以校正：

    1. 数据以 FITS 格式文件保存。需要使用 `pyfits` 或者 `astropy` （包含 `pyfits` ）将其读入到 `NumPy` 数组。有些情况下，数据是三维的，需要沿 z 轴使用 `numpy.median` 将数据转换为二维数组。有些 SPHERE 数据在同一幅影像中包含了同一片天空的两份拷贝（各自使用了不同的滤波器），这时候需要使用 **索引** 和 **切片** 将它们分离出来。
    2. <ruby>全黑图<rt>master dark</rt></ruby>和<ruby>坏点图<rt>bad pixel map</rt></ruby>。所有仪器都有快门全关（完全无光）状态拍摄的特殊图片，使用 **NumPy 掩膜数组** 从中分离出坏点图。坏点图非常重要，你在合成最终的清晰图像过程中，需要持续跟踪坏点。有些情况下，这还有助于你从原始科学数据中扣除暗背景的操作。
    3. 一般情况下，天文仪器还要拍<ruby>标准响应图<rt>master flat frame</rt></ruby>。这是对均匀的单色标准光源拍摄的一张或者一组图片。你需要将所有的原始数据除以标准响应之后再做后续处理（同样，使用 Numpy 掩膜数组实现的话，这仅仅是一个简单的除法运算）。
    4. 对行星影像，为了使行星在明亮恒星背景下变得可见，需要仰仗<ruby>日冕仪<rt>coronagraph</rt></ruby>和<ruby>角差分成像<rt>angular differential imaging</rt></ruby>技术。这一步需要识别影像的光学中心，这是比较棘手的环节之一，过程中要使用 `skimage.feature.blob_dog` 从原始影像中寻找一些人工辅助影像作为帮助。
4. 要有耐心。理解数据格式并弄清如何操作需要一些时间，绘出像素数据曲线图或者统计图有助于你的理解。贵在坚持，必有收获！你会从中学到很多关于图像数据及其处理的知识。

综合应用 NumPy、SciPy、Astropy、scikit-image 及其它工具，结合耐心和恒心，通过分析大量可用的天文数据分析实现重大的发现是非常有可能的。说不定，你会成为某个之前被忽略的系外行星的第一发现者呢。祝你好运！

---

NumFOCUS 是个非盈利组织，维护着一套科学计算与数据科学方面的杰出开源工具集。如果想了解我们的任务及代码，可以访问 [numfocus.org][3]。如果你有兴趣以个人身份加入 NumFOCUS 社区，可以关注你所在地区的 [PyData 活动][4]。

本文基于 Pivigo CTO [Ole Moeller-Nilsson][12] 的一次 [谈话][11]，最初发布于 NumFOCUS 的博客，蒙允再次发布。如果你有意支持 NumFOCUS，可以 [捐赠][13]，也可以参与遍布全球的 [PyData 活动][4] 中你身边的那些。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/python-astronomy-open-data

作者：[Gina Helfrich, Ph.D.][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/silentdawn-zz)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ginahelfrich
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/space_stars_cosmos_person.jpg?itok=XUtz_LyY (Person looking up at the stars)
[2]: https://numfocus.org/blog
[3]: https://numfocus.org
[4]: https://pydata.org/
[5]: http://numpy.scipy.org/
[6]: http://www.scipy.org/
[7]: http://scikit-image.org/
[8]: http://www.astropy.org/
[9]: https://en.wikipedia.org/wiki/Data_reduction
[10]: http://www.eso.org/UserPortal
[11]: https://www.slideshare.net/OleMoellerNilsson/pydata-lonon-finding-planets-with-python
[12]: https://twitter.com/olly_mn
[13]: https://numfocus.org/donate
